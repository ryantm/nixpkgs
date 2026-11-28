# services (G) {#sec-options-services-g}

## `services.g3proxy.enable` {#opt-services.g3proxy.enable}

Whether to enable g3proxy, a generic purpose forward proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/g3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/g3proxy.nix)

## `services.g3proxy.package` {#opt-services.g3proxy.package}

The g3proxy package to use.

*Type:* package

*Default:* `pkgs.g3proxy`

*Declared by:* [`nixos/modules/services/networking/g3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/g3proxy.nix)

## `services.g3proxy.settings` {#opt-services.g3proxy.settings}

Settings of g3proxy.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  server = [{
    name = "test";
    escaper = "default";
    type = "socks_proxy";
    listen = {
      address = "[::]:10086";
    };
  }];
}
```

*Declared by:* [`nixos/modules/services/networking/g3proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/g3proxy.nix)

## `services.g810-led.earlySetup` {#opt-services.g810-led.earlySetup}

Whether to enable g810-led in early stage initrd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/g810-led.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/g810-led.nix)

## `services.g810-led.enable` {#opt-services.g810-led.enable}

Whether to enable g810-led, a Linux LED controller for some Logitech G Keyboards.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/g810-led.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/g810-led.nix)

## `services.g810-led.package` {#opt-services.g810-led.package}

The g810-led package to use.

*Type:* package

*Default:* `pkgs.g810-led`

*Declared by:* [`nixos/modules/services/hardware/g810-led.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/g810-led.nix)

## `services.g810-led.profile` {#opt-services.g810-led.profile}

Keyboard profile to apply at boot time.

The upstream repository provides [example configurations](https://github.com/MatMoul/g810-led/tree/master/sample_profiles).

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Example:*

``` nix
''
  # G810-LED Profile (turn all keys on)
  
  # Set all keys on
  a ffffff
  
  # Commit changes
  c
''
```

*Declared by:* [`nixos/modules/services/hardware/g810-led.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/g810-led.nix)

## `services.galene-stt.caption` {#opt-services.galene-stt.caption}

Whether to display inferred text as captions in the Galene room.
Requires the user in Galene to have the 'caption' permission.
Note that if both `caption` and `chat` are true, `caption` takes precedence upstream.

*Type:* boolean

*Default:* `!config.services.galene-stt.chat`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.chat` {#opt-services.galene-stt.chat}

Whether to display inferred text as chat messages in the Galene room.
Requires the user in Galene to have the 'message' permission.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.debug` {#opt-services.galene-stt.debug}

Whether to enable protocol debug logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.enable` {#opt-services.galene-stt.enable}

Whether to enable Galene Speech-to-Text bot.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.extraArgs` {#opt-services.galene-stt.extraArgs}

Extra command-line arguments passed to galene-stt.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.gpu` {#opt-services.galene-stt.gpu}

Whether to run inference on GPU if possible.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.groupUrl` {#opt-services.galene-stt.groupUrl}

URL of the Galene group to connect to.

*Type:* string

*Example:* `"https://galene.example.org:8443/group/public/"`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.insecure` {#opt-services.galene-stt.insecure}

Whether to skip server certificate verification.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.keepSilence` {#opt-services.galene-stt.keepSilence}

Whether to pass silence segments to the engine instead of discarding them.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.language` {#opt-services.galene-stt.language}

Language of input, or 'auto' for autodetection.

*Type:* string

*Default:* `"en"`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.model` {#opt-services.galene-stt.model}

Path to the whisper.cpp model file (GGML format). Upstream recommends at least
the 'medium' model for useful real-time transcription.

*Type:* absolute path

*Example:* `"/var/lib/whisper/ggml-medium.bin"`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.package` {#opt-services.galene-stt.package}

The galene-stt package to use.

*Type:* package

*Default:* `pkgs.galene-stt`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.passwordFile` {#opt-services.galene-stt.passwordFile}

File containing the password for login.

*Type:* null or absolute path not in the Nix store

*Default:* `null`

*Example:* `"/run/keys/stt-password"`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.silence` {#opt-services.galene-stt.silence}

Maximum volume required to start a new phrase (default: 0.07).

*Type:* null or floating point number

*Default:* `null`

*Example:* `0.07`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.silenceTime` {#opt-services.galene-stt.silenceTime}

Seconds of silence required to start a new phrase (default: 0.3).

*Type:* null or floating point number

*Default:* `null`

*Example:* `0.3`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.translate` {#opt-services.galene-stt.translate}

Whether to translate foreign languages into English.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene-stt.username` {#opt-services.galene-stt.username}

Username to use for login. The user must exist in the Galene group with
the 'caption' permission (or 'message' permission if `chat` is enabled).

*Type:* string

*Default:* `"speech-to-text"`

*Declared by:* [`nixos/modules/services/web-apps/galene-stt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene-stt.nix)

## `services.galene.certFile` {#opt-services.galene.certFile}

Path to the server's certificate. The file is copied at runtime to
Galene's data directory where it needs to reside.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/your/cert.pem"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.dataDir` {#opt-services.galene.dataDir}

Data directory.

*Type:* absolute path

*Default:* `"${config.services.galene.stateDir}/data"`

*Example:* `"/var/lib/galene/data"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.enable` {#opt-services.galene.enable}

Whether to enable Galene Service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.group` {#opt-services.galene.group}

Group under which galene runs.

*Type:* string

*Default:* `"galene"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.groupsDir` {#opt-services.galene.groupsDir}

Web server directory.

*Type:* absolute path

*Default:* `"${config.services.galene.stateDir}/groups"`

*Example:* `"/var/lib/galene/groups"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.httpAddress` {#opt-services.galene.httpAddress}

HTTP listen address for galene.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.httpPort` {#opt-services.galene.httpPort}

HTTP listen port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8443`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.insecure` {#opt-services.galene.insecure}

Whether Galene should listen in http or in https. If left as the default
value (false), Galene needs to be fed a private key and a certificate.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.keyFile` {#opt-services.galene.keyFile}

Path to the server's private key. The file is copied at runtime to
Galene's data directory where it needs to reside.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/your/key.pem"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.package` {#opt-services.galene.package}

The galene package to use.

*Type:* package

*Default:* `pkgs.galene`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.recordingsDir` {#opt-services.galene.recordingsDir}

Recordings directory.

*Type:* absolute path

*Default:* `"${config.services.galene.stateDir}/recordings"`

*Example:* `"/var/lib/galene/recordings"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.stateDir` {#opt-services.galene.stateDir}

The directory where Galene stores its internal state. If left as the default
value this directory will automatically be created before the Galene server
starts, otherwise the sysadmin is responsible for ensuring the directory
exists with appropriate ownership and permissions.

*Type:* absolute path

*Default:* `"/var/lib/galene"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.staticDir` {#opt-services.galene.staticDir}

Web server directory.

*Type:* absolute path

*Default:* `"${package.static}/static"`

*Example:* `"/var/lib/galene/static"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.turnAddress` {#opt-services.galene.turnAddress}

Built-in TURN server listen address and port. Set to "" to disable.

*Type:* string

*Default:* `"auto"`

*Example:* `"127.0.0.1:1194"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.galene.user` {#opt-services.galene.user}

User account under which galene runs.

*Type:* string

*Default:* `"galene"`

*Declared by:* [`nixos/modules/services/web-apps/galene.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/galene.nix)

## `services.gammu-smsd.backend.files.errorSMSPath` {#opt-services.gammu-smsd.backend.files.errorSMSPath}

Where SMSes with error in transmission is placed

*Type:* absolute path

*Default:* `"/var/spool/sms/error/"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.files.inboxPath` {#opt-services.gammu-smsd.backend.files.inboxPath}

Where the received SMSes are stored

*Type:* absolute path

*Default:* `"/var/spool/sms/inbox/"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.files.outboxPath` {#opt-services.gammu-smsd.backend.files.outboxPath}

Where SMSes to be sent should be placed

*Type:* absolute path

*Default:* `"/var/spool/sms/outbox/"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.files.sentSMSPath` {#opt-services.gammu-smsd.backend.files.sentSMSPath}

Where the transmitted SMSes are placed

*Type:* absolute path

*Default:* `"/var/spool/sms/sent/"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.service` {#opt-services.gammu-smsd.backend.service}

Service to use to store sms data.

*Type:* one of "null", "files", "sql"

*Default:* `"null"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.sql.database` {#opt-services.gammu-smsd.backend.sql.database}

Database name to store sms data

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.sql.driver` {#opt-services.gammu-smsd.backend.sql.driver}

DB driver to use

*Type:* one of "native\_mysql", "native\_pgsql", "odbc", "dbi"

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.sql.host` {#opt-services.gammu-smsd.backend.sql.host}

Database server address

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.sql.password` {#opt-services.gammu-smsd.backend.sql.password}

User password used for connection to the database

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.sql.sqlDialect` {#opt-services.gammu-smsd.backend.sql.sqlDialect}

SQL dialect to use (odbc driver only)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.backend.sql.user` {#opt-services.gammu-smsd.backend.sql.user}

User name used for connection to the database

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.device.connection` {#opt-services.gammu-smsd.device.connection}

Protocol which will be used to talk to the phone

*Type:* string

*Default:* `"at"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.device.group` {#opt-services.gammu-smsd.device.group}

Owner group of the device

*Type:* string

*Default:* `"root"`

*Example:* `"dialout"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.device.path` {#opt-services.gammu-smsd.device.path}

Device node or address of the phone

*Type:* absolute path

*Example:* `"/dev/ttyUSB2"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.device.pin` {#opt-services.gammu-smsd.device.pin}

PIN code for the simcard

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.device.synchronizeTime` {#opt-services.gammu-smsd.device.synchronizeTime}

Whether to set time from computer to the phone during starting connection

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.enable` {#opt-services.gammu-smsd.enable}

Whether to enable gammu-smsd daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.extraConfig.gammu` {#opt-services.gammu-smsd.extraConfig.gammu}

Extra config lines to be added into \[gammu\] section

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.extraConfig.smsd` {#opt-services.gammu-smsd.extraConfig.smsd}

Extra config lines to be added into \[smsd\] section

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.log.file` {#opt-services.gammu-smsd.log.file}

Path to file where information about communication will be stored

*Type:* string

*Default:* `"syslog"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.log.format` {#opt-services.gammu-smsd.log.format}

Determines what will be logged to the LogFile

*Type:* one of "nothing", "text", "textall", "textalldate", "errors", "errorsdate", "binary"

*Default:* `"errors"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gammu-smsd.user` {#opt-services.gammu-smsd.user}

User that has access to the device

*Type:* string

*Default:* `"smsd"`

*Declared by:* [`nixos/modules/services/misc/gammu-smsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gammu-smsd.nix)

## `services.gancio.enable` {#opt-services.gancio.enable}

Whether to enable Gancio, a shared agenda for local communities.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx` {#opt-services.gancio.nginx}

Extra configuration for the nginx virtual host of gancio.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  enableACME = false;
  forceSSL = false;
}
```

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.acmeFallbackHost` {#opt-services.gancio.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.acmeRoot` {#opt-services.gancio.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.addSSL` {#opt-services.gancio.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.basicAuth` {#opt-services.gancio.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.basicAuthFile` {#opt-services.gancio.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.default` {#opt-services.gancio.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.enableACME` {#opt-services.gancio.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.extraConfig` {#opt-services.gancio.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.forceSSL` {#opt-services.gancio.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.globalRedirect` {#opt-services.gancio.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.http2` {#opt-services.gancio.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.http3` {#opt-services.gancio.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.http3_hq` {#opt-services.gancio.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.kTLS` {#opt-services.gancio.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.listen` {#opt-services.gancio.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.listen.*.addr` {#opt-services.gancio.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.listen.*.extraParameters` {#opt-services.gancio.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.listen.*.port` {#opt-services.gancio.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.listen.*.proxyProtocol` {#opt-services.gancio.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.listen.*.ssl` {#opt-services.gancio.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.listenAddresses` {#opt-services.gancio.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations` {#opt-services.gancio.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.alias` {#opt-services.gancio.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.basicAuth` {#opt-services.gancio.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.basicAuthFile` {#opt-services.gancio.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.extraConfig` {#opt-services.gancio.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.fastcgiParams` {#opt-services.gancio.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.index` {#opt-services.gancio.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.priority` {#opt-services.gancio.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.proxyPass` {#opt-services.gancio.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.proxyWebsockets` {#opt-services.gancio.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.recommendedProxySettings` {#opt-services.gancio.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.gancio.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.return` {#opt-services.gancio.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.root` {#opt-services.gancio.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.tryFiles` {#opt-services.gancio.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.gancio.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.locations.<name>.uwsgiPass` {#opt-services.gancio.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.onlySSL` {#opt-services.gancio.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.quic` {#opt-services.gancio.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.redirectCode` {#opt-services.gancio.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.rejectSSL` {#opt-services.gancio.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.reuseport` {#opt-services.gancio.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.root` {#opt-services.gancio.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.serverAliases` {#opt-services.gancio.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.serverName` {#opt-services.gancio.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.sslCertificate` {#opt-services.gancio.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.sslCertificateKey` {#opt-services.gancio.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.sslTrustedCertificate` {#opt-services.gancio.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.nginx.useACMEHost` {#opt-services.gancio.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.package` {#opt-services.gancio.package}

The gancio package to use.

*Type:* package

*Default:* `pkgs.gancio`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.plugins` {#opt-services.gancio.plugins}

Paths of gancio plugins to activate (linked under $WorkingDirectory/plugins/).

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.gancioPlugins.telegram-bridge ]`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings` {#opt-services.gancio.settings}

Configuration for Gancio, see [https://gancio.org/install/config](https://gancio.org/install/config) for supported values.

*Type:* open submodule of (JSON value)

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.baseurl` {#opt-services.gancio.settings.baseurl}

The full URL under which the server is reachable.

*Type:* string

*Default:* `"https://${config.services.gancio.settings.hostname}"`

*Example:* `"https://demo.gancio.org/gancio"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.db.database` {#opt-services.gancio.settings.db.database}

Name of the PostgreSQL database

*Type:* null or string

*Default:* `"if config.services.gancio.settings.db.dialect == \"postgres\" then cfg.user else null"`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.db.dialect` {#opt-services.gancio.settings.db.dialect}

The database dialect to use

*Type:* one of "sqlite", "postgres"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.db.host` {#opt-services.gancio.settings.db.host}

Connection string for the PostgreSQL database

*Type:* null or string

*Default:* `"if config.services.gancio.settings.db.dialect == \"postgres\" then \"/run/postgresql\" else null"`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.db.storage` {#opt-services.gancio.settings.db.storage}

Location for the SQLite database.

*Type:* null or string

*Default:* `"if config.services.gancio.settings.db.dialect == \"sqlite\" then \"/var/lib/gancio/db.sqlite\" else null"`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.hostname` {#opt-services.gancio.settings.hostname}

The domain name under which the server is reachable.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.log_level` {#opt-services.gancio.settings.log_level}

Gancio log level.

*Type:* one of "debug", "info", "warning", "error"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.log_path` {#opt-services.gancio.settings.log_path}

Directory Gancio logs into

*Type:* string

*Default:* `"/var/log/gancio"`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.settings.server.socket` {#opt-services.gancio.settings.server.socket}

The unix socket for the gancio server to listen on.

*Type:* absolute path

*Default:* `"/run/gancio/socket"`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.user` {#opt-services.gancio.user}

The user (and PostgreSQL database name) used to run the gancio server

*Type:* string

*Default:* `"gancio"`

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.gancio.userLocale` {#opt-services.gancio.userLocale}

Override default locales within gancio.
See [default languages and locales](https://framagit.org/les/gancio/tree/master/locales).

*Type:* attribute set of attribute set of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  en = {
    register = {
      description = "My new registration page description";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/gancio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gancio.nix)

## `services.garage.enable` {#opt-services.garage.enable}

Whether to enable Garage Object Storage (S3 compatible).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/garage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/garage.nix)

## `services.garage.environmentFile` {#opt-services.garage.environmentFile}

File containing environment variables to be passed to the Garage server.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/garage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/garage.nix)

## `services.garage.extraEnvironment` {#opt-services.garage.extraEnvironment}

Extra environment variables to pass to the Garage server.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  RUST_BACKTRACE = "yes";
}
```

*Declared by:* [`nixos/modules/services/web-servers/garage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/garage.nix)

## `services.garage.logLevel` {#opt-services.garage.logLevel}

Garage log level, see [https://garagehq.deuxfleurs.fr/documentation/quick-start/#troubleshooting](https://garagehq.deuxfleurs.fr/documentation/quick-start/#troubleshooting) for examples.

*Type:* one of "error", "warn", "info", "debug", "trace"

*Default:* `"info"`

*Example:* `"debug"`

*Declared by:* [`nixos/modules/services/web-servers/garage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/garage.nix)

## `services.garage.package` {#opt-services.garage.package}

The garage package to use. Needs to be set explicitly. If you are upgrading between major versions, please read NixOS and Garage release notes for upgrade instructions.

*Type:* package

*Example:* `garage_2`

*Declared by:* [`nixos/modules/services/web-servers/garage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/garage.nix)

## `services.garage.settings` {#opt-services.garage.settings}

Garage configuration, see [https://garagehq.deuxfleurs.fr/documentation/reference-manual/configuration/](https://garagehq.deuxfleurs.fr/documentation/reference-manual/configuration/) for reference.

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/web-servers/garage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/garage.nix)

## `services.garage.settings.data_dir` {#opt-services.garage.settings.data_dir}

The directory in which Garage will store the data blocks of objects. This folder can be placed on an HDD. It is possible to have multiple data directories.
Refer to [https://garagehq.deuxfleurs.fr/documentation/reference-manual/configuration/#data\_dir](https://garagehq.deuxfleurs.fr/documentation/reference-manual/configuration/#data_dir) for the exact format.

*Type:* absolute path or list of (attribute set)

*Default:* `"/var/lib/garage/data"`

*Example:*

``` nix
[
  {
    capacity = "2T";
    path = "/var/lib/garage/data";
  }
]
```

*Declared by:* [`nixos/modules/services/web-servers/garage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/garage.nix)

## `services.garage.settings.metadata_dir` {#opt-services.garage.settings.metadata_dir}

The metadata directory, put this on a fast disk (e.g. SSD) if possible.

*Type:* absolute path

*Default:* `"/var/lib/garage/meta"`

*Declared by:* [`nixos/modules/services/web-servers/garage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/garage.nix)

## `services.garm.enable` {#opt-services.garm.enable}

Whether to enable GARM, a self-hosted runner manager for GitHub Actions and Gitea Actions.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/garm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/garm.nix)

## `services.garm.package` {#opt-services.garm.package}

The garm package to use.

*Type:* package

*Default:* `pkgs.garm`

*Declared by:* [`nixos/modules/services/continuous-integration/garm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/garm.nix)

## `services.garm.settings` {#opt-services.garm.settings}

Configuration for GARM, rendered to `config.toml`. See
[https://github.com/cloudbase/garm/blob/main/doc/configuration.md](https://github.com/cloudbase/garm/blob/main/doc/configuration.md)
for available settings. At least `jwt_auth.secret` and
`database.passphrase` must be set.

Settings containing secret data should be set to an attribute set
containing the attribute `_secret = "/path/to/secret"`, where that
file contains the actual value. Secret files are loaded through
systemd credentials, so they only need to be readable by root.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  apiserver.bind = "0.0.0.0";
  jwt_auth.secret._secret = "/run/keys/garm-jwt-secret";
  database.passphrase._secret = "/run/keys/garm-db-passphrase";
  provider = [
    {
      name = "incus";
      description = "Incus external provider";
      provider_type = "external";
      external = {
        provider_executable = lib.getExe pkgs.garm-provider-incus;
        config_file = "/etc/garm/incus-provider.toml";
      };
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/garm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/garm.nix)

## `services.garm.settings.apiserver.bind` {#opt-services.garm.settings.apiserver.bind}

Address the API server binds to. Runner instances fetch their
metadata from it and report back to it, so it has to be reachable
from wherever the provider creates them.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/continuous-integration/garm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/garm.nix)

## `services.garm.settings.apiserver.port` {#opt-services.garm.settings.apiserver.port}

Port the API server listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9997`

*Declared by:* [`nixos/modules/services/continuous-integration/garm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/garm.nix)

## `services.garm.settings.database.backend` {#opt-services.garm.settings.database.backend}

Database backend to use.

*Type:* string

*Default:* `"sqlite3"`

*Declared by:* [`nixos/modules/services/continuous-integration/garm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/garm.nix)

## `services.garm.settings.database.sqlite3.db_file` {#opt-services.garm.settings.database.sqlite3.db_file}

Location of the SQLite database.

*Type:* string

*Default:* `"/var/lib/garm/garm.db"`

*Declared by:* [`nixos/modules/services/continuous-integration/garm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/garm.nix)

## `services.garm.settings.jwt_auth.time_to_live` {#opt-services.garm.settings.jwt_auth.time_to_live}

Lifetime of the tokens issued to runner instances.

*Type:* string

*Default:* `"8760h"`

*Declared by:* [`nixos/modules/services/continuous-integration/garm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/garm.nix)

## `services.gatus.configFile` {#opt-services.gatus.configFile}

Path to the Gatus configuration file.
Overrides any configuration made using the `settings` option.

*Type:* absolute path

*Default:* `(pkgs.formats.yaml { }).generate "gatus.yaml" config.services.gatus.settings`

*Declared by:* [`nixos/modules/services/monitoring/gatus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gatus.nix)

## `services.gatus.enable` {#opt-services.gatus.enable}

Whether to enable Gatus.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/gatus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gatus.nix)

## `services.gatus.environmentFile` {#opt-services.gatus.environmentFile}

File to load as environment file.
Environmental variables from this file can be interpolated in the configuration file using `${VARIABLE}`.
This is useful to avoid putting secrets into the nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/gatus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gatus.nix)

## `services.gatus.openFirewall` {#opt-services.gatus.openFirewall}

Whether to open the firewall for the Gatus web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/gatus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gatus.nix)

## `services.gatus.package` {#opt-services.gatus.package}

The gatus package to use.

*Type:* package

*Default:* `pkgs.gatus`

*Declared by:* [`nixos/modules/services/monitoring/gatus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gatus.nix)

## `services.gatus.settings` {#opt-services.gatus.settings}

Configuration for Gatus.
Supported options can be found at the [docs](https://gatus.io/docs).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  web.port = 8080;
  endpoints = [{
    name = "website";
    url = "https://twin.sh/health";
    interval = "5m";
    conditions = [
      "[STATUS] == 200"
      "[BODY].status == UP"
      "[RESPONSE_TIME] < 300"
    ];
  }];
}
```

*Declared by:* [`nixos/modules/services/monitoring/gatus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gatus.nix)

## `services.gatus.settings.web.port` {#opt-services.gatus.settings.web.port}

The TCP port to serve the Gatus service at.

*Type:* signed integer

*Default:* `8080`

*Declared by:* [`nixos/modules/services/monitoring/gatus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gatus.nix)

## `services.gdomap.enable` {#opt-services.gdomap.enable}

Whether to enable GNUstep Distributed Objects name server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gdomap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gdomap.nix)

## `services.gemstash.enable` {#opt-services.gemstash.enable}

Whether to enable gemstash, a cache for rubygems.org and a private gem server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/gemstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/gemstash.nix)

## `services.gemstash.openFirewall` {#opt-services.gemstash.openFirewall}

Whether to open the firewall for the port in `services.gemstash.bind`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/gemstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/gemstash.nix)

## `services.gemstash.package` {#opt-services.gemstash.package}

The gemstash package to use.

*Type:* package

*Default:* `pkgs.gemstash`

*Declared by:* [`nixos/modules/services/development/gemstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/gemstash.nix)

## `services.gemstash.settings` {#opt-services.gemstash.settings}

Configuration for Gemstash. The details can be found at in
[gemstash documentation](https://github.com/rubygems/gemstash/blob/master/man/gemstash-configuration.5.md).
Each key set here is automatically prefixed with ":" to match the gemstash expectations.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/development/gemstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/gemstash.nix)

## `services.gemstash.settings.base_path` {#opt-services.gemstash.settings.base_path}

Path to store the gem files and the sqlite database. If left unchanged, the directory will be created.

*Type:* absolute path

*Default:* `"/var/lib/gemstash"`

*Declared by:* [`nixos/modules/services/development/gemstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/gemstash.nix)

## `services.gemstash.settings.bind` {#opt-services.gemstash.settings.bind}

Host and port combination for the server to listen on.

*Type:* string

*Default:* `"tcp://0.0.0.0:9292"`

*Declared by:* [`nixos/modules/services/development/gemstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/gemstash.nix)

## `services.gemstash.settings.db_adapter` {#opt-services.gemstash.settings.db_adapter}

Which database type to use. For choices other than sqlite3, the dbUrl has to be specified as well.

*Type:* null or one of "sqlite3", "postgres", "mysql", "mysql2"

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/gemstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/gemstash.nix)

## `services.gemstash.settings.db_url` {#opt-services.gemstash.settings.db_url}

The database to connect to when using postgres, mysql, or mysql2.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/development/gemstash.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/gemstash.nix)

## `services.geoclue2.appConfig` {#opt-services.geoclue2.appConfig}

Specify extra settings per application.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
"com.github.app" = {
  isAllowed = true;
  isSystem = true;
  users = [ "300" ];
};
```

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.appConfig.<name>.desktopID` {#opt-services.geoclue2.appConfig._name_.desktopID}

Desktop ID of the application.

*Type:* string

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.appConfig.<name>.isAllowed` {#opt-services.geoclue2.appConfig._name_.isAllowed}

Whether the application will be allowed access to location information.

*Type:* boolean

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.appConfig.<name>.isSystem` {#opt-services.geoclue2.appConfig._name_.isSystem}

Whether the application is a system component or not.

*Type:* boolean

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.appConfig.<name>.users` {#opt-services.geoclue2.appConfig._name_.users}

List of UIDs of all users for which this application is allowed location
info access, Defaults to an empty string to allow it for all users.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.enable` {#opt-services.geoclue2.enable}

Whether to enable GeoClue 2 daemon, a DBus service
that provides location information for accessing.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.enable3G` {#opt-services.geoclue2.enable3G}

Whether to enable 3G source.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.enableCDMA` {#opt-services.geoclue2.enableCDMA}

Whether to enable CDMA source.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.enableDemoAgent` {#opt-services.geoclue2.enableDemoAgent}

Whether to use the GeoClue demo agent. This should be
overridden by desktop environments that provide their own
agent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.enableModemGPS` {#opt-services.geoclue2.enableModemGPS}

Whether to enable Modem-GPS source.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.enableNmea` {#opt-services.geoclue2.enableNmea}

Whether to fetch location from NMEA sources on local network.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.enableStatic` {#opt-services.geoclue2.enableStatic}

Whether to enable the static source. This source defines a fixed
location using the `staticLatitude`, `staticLongitude`,
`staticAltitude`, and `staticAccuracy` options.

Setting `enableStatic` to true will disable all other sources, to
prevent conflicts. Use `lib.mkForce true` when enabling other sources
if for some reason you want to override this.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.enableWifi` {#opt-services.geoclue2.enableWifi}

Whether to enable WiFi source.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.geoProviderUrl` {#opt-services.geoclue2.geoProviderUrl}

The url to the wifi GeoLocation Service.

*Type:* string

*Default:* `"https://api.beacondb.net/v1/geolocate"`

*Example:* `"https://www.googleapis.com/geolocation/v1/geolocate?key=YOUR_KEY"`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.package` {#opt-services.geoclue2.package}

The geoclue2 package to use

*Type:* package

*Default:* `pkgs.geoclue2`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.staticAccuracy` {#opt-services.geoclue2.staticAccuracy}

Accuracy radius in meters to use for the static source.

*Type:* positive integer or floating point number, meaning \>0

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.staticAltitude` {#opt-services.geoclue2.staticAltitude}

Altitude in meters to use for the static source.

*Type:* signed integer or floating point number

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.staticLatitude` {#opt-services.geoclue2.staticLatitude}

Latitude to use for the static source. Defaults to `location.latitude`.

*Type:* integer or floating point number between -90 and 90 (both inclusive)

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.staticLongitude` {#opt-services.geoclue2.staticLongitude}

Longitude to use for the static source. Defaults to `location.longitude`.

*Type:* integer or floating point number between -180 and 180 (both inclusive)

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.submissionNick` {#opt-services.geoclue2.submissionNick}

A nickname to submit network data with.
Must be 2-32 characters long.

*Type:* string

*Default:* `"geoclue"`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.submissionUrl` {#opt-services.geoclue2.submissionUrl}

The url to submit data to a GeoLocation Service.

*Type:* string

*Default:* `"https://api.beacondb.net/v2/geosubmit"`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.submitData` {#opt-services.geoclue2.submitData}

Whether to submit data to a GeoLocation Service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoclue2.whitelistedAgents` {#opt-services.geoclue2.whitelistedAgents}

Desktop IDs (without the .desktop extension) of whitelisted agents.

*Type:* list of string

*Default:*

``` nix
[
  "gnome-shell"
  "io.elementary.desktop.agent-geoclue2"
]
```

*Declared by:* [`nixos/modules/services/desktops/geoclue2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/geoclue2.nix)

## `services.geoipupdate.enable` {#opt-services.geoipupdate.enable}

Whether to enable periodic downloading of GeoIP databases using geoipupdate
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/geoipupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/geoipupdate.nix)

## `services.geoipupdate.interval` {#opt-services.geoipupdate.interval}

Update the GeoIP databases at this time / interval.
The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"weekly"`

*Declared by:* [`nixos/modules/services/misc/geoipupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/geoipupdate.nix)

## `services.geoipupdate.settings` {#opt-services.geoipupdate.settings}

geoipupdate configuration options. See
[https://github.com/maxmind/geoipupdate/blob/main/doc/GeoIP.conf.md](https://github.com/maxmind/geoipupdate/blob/main/doc/GeoIP.conf.md)
for a full list of available options.

Settings containing secret data should be set to an
attribute set containing the attribute
`_secret` - a string pointing to a file
containing the value the option should be set to. See the
example to get a better picture of this: in the resulting
`GeoIP.conf` file, the
`ProxyUserPassword` key will be set to the
contents of the
`/run/keys/proxy_pass` file.

*Type:* open submodule of attribute set of (string or signed integer or boolean or list of (string or signed integer or boolean))

*Example:*

``` nix
{
  AccountID = 200001;
  DatabaseDirectory = "/var/lib/GeoIP";
  LicenseKey = { _secret = "/run/keys/maxmind_license_key"; };
  Proxy = "10.0.0.10:8888";
  ProxyUserPassword = { _secret = "/run/keys/proxy_pass"; };
}
```

*Declared by:* [`nixos/modules/services/misc/geoipupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/geoipupdate.nix)

## `services.geoipupdate.settings.AccountID` {#opt-services.geoipupdate.settings.AccountID}

Your MaxMind account ID.

*Type:* signed integer

*Declared by:* [`nixos/modules/services/misc/geoipupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/geoipupdate.nix)

## `services.geoipupdate.settings.DatabaseDirectory` {#opt-services.geoipupdate.settings.DatabaseDirectory}

The directory to store the database files in. The
directory will be automatically created, the owner
changed to `geoip` and permissions
set to world readable. This applies if the directory
already exists as well, so don't use a directory with
sensitive contents.

*Type:* absolute path

*Default:* `"/var/lib/GeoIP"`

*Example:* `"/run/GeoIP"`

*Declared by:* [`nixos/modules/services/misc/geoipupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/geoipupdate.nix)

## `services.geoipupdate.settings.EditionIDs` {#opt-services.geoipupdate.settings.EditionIDs}

List of database edition IDs. This includes new string
IDs like `GeoIP2-City` and old
numeric IDs like `106`.

*Type:* list of (string or signed integer)

*Default:* `[ ]`

*Example:*

``` nix
[
  "GeoLite2-ASN"
  "GeoLite2-City"
  "GeoLite2-Country"
]
```

*Declared by:* [`nixos/modules/services/misc/geoipupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/geoipupdate.nix)

## `services.geoipupdate.settings.LicenseKey` {#opt-services.geoipupdate.settings.LicenseKey}

A file containing the MaxMind license key.

Always handled as a secret whether the value is
wrapped in a `{ _secret = ...; }`
attrset or not (refer to [services (G)](#opt-services.geoipupdate.settings) for
details).

*Type:* absolute path or attribute set of absolute path

*Declared by:* [`nixos/modules/services/misc/geoipupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/geoipupdate.nix)

## `services.geoserver.enable` {#opt-services.geoserver.enable}

Whether to enable Geoserver service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/geoserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/geoserver.nix)

## `services.geoserver.group` {#opt-services.geoserver.group}

The user's group.

*Type:* string

*Default:* `"geoserver"`

*Declared by:* [`nixos/modules/services/web-apps/geoserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/geoserver.nix)

## `services.geoserver.jettyOpts` {#opt-services.geoserver.jettyOpts}

Any options passed to the Jetty web server via the `JETTY_OPTS` environment variable. See [startup.sh](https://github.com/geoserver/geoserver/blob/main/src/release/bin/startup.sh) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"jetty.http.port=1234"`

*Declared by:* [`nixos/modules/services/web-apps/geoserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/geoserver.nix)

## `services.geoserver.jvmOpts` {#opt-services.geoserver.jvmOpts}

Any options passed to the JVM via the `JAVA_OPTS` environment variable. See [startup.sh](https://github.com/geoserver/geoserver/blob/main/src/release/bin/startup.sh) for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/geoserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/geoserver.nix)

## `services.geoserver.package` {#opt-services.geoserver.package}

The geoserver package to use.

*Type:* package

*Default:* `pkgs.geoserver`

*Declared by:* [`nixos/modules/services/web-apps/geoserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/geoserver.nix)

## `services.geoserver.user` {#opt-services.geoserver.user}

The (system) user that will run the service.

*Type:* string

*Default:* `"geoserver"`

*Declared by:* [`nixos/modules/services/web-apps/geoserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/geoserver.nix)

## `services.geph.configFile` {#opt-services.geph.configFile}

Path to the geph config file.

This file contain sensitive credentials, so it must not live in the Nix store.

*Type:* absolute path not in the Nix store

*Declared by:* [`nixos/modules/services/networking/geph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/geph.nix)

## `services.geph.enable` {#opt-services.geph.enable}

Whether to enable geph client daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/geph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/geph.nix)

## `services.geph.package` {#opt-services.geph.package}

The geph package to use.

*Type:* package

*Default:* `pkgs.geph`

*Declared by:* [`nixos/modules/services/networking/geph.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/geph.nix)

## `services.gerbil.environmentFile` {#opt-services.gerbil.environmentFile}

Path to a file containing sensitive environment variables for Gerbil. See the [Gerbil Documentation](https://docs.fossorial.io/Pangolin/Configuration/config) for more information.
These will overwrite anything defined in the config.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/nixos/secrets/gerbil.env"`

*Declared by:* [`nixos/modules/services/networking/pangolin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/pangolin.nix)

## `services.gerbil.port` {#opt-services.gerbil.port}

Specifies the port to listen on for Gerbil.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3004`

*Declared by:* [`nixos/modules/services/networking/pangolin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/pangolin.nix)

## `services.gerrit.builtinPlugins` {#opt-services.gerrit.builtinPlugins}

List of builtins plugins to install. Those are shipped in the
`gerrit.war` file.

*Type:* list of (one of "codemirror-editor", "commit-message-length-validator", "delete-project", "download-commands", "gitiles", "hooks", "plugin-manager", "replication", "reviewnotes", "singleusergroup", "webhooks")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.enable` {#opt-services.gerrit.enable}

Whether to enable Gerrit service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.jvmHeapLimit` {#opt-services.gerrit.jvmHeapLimit}

How much memory to allocate to the JVM heap

*Type:* string

*Default:* `"1024m"`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.jvmOpts` {#opt-services.gerrit.jvmOpts}

A list of JVM options to start gerrit with.

*Type:* list of string

*Default:*

``` nix
[
  "-Dflogger.backend_factory=com.google.common.flogger.backend.log4j.Log4jBackendFactory#getInstance"
  "-Dflogger.logging_context=com.google.gerrit.server.logging.LoggingContext#getInstance"
]
```

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.jvmPackage` {#opt-services.gerrit.jvmPackage}

The jdk25\_headless package to use.

*Type:* package

*Default:* `pkgs.jdk25_headless`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.listenAddress` {#opt-services.gerrit.listenAddress}

`hostname:port` to listen for HTTP traffic.

This is bound using the systemd socket activation.

*Type:* string

*Default:* `"[::]:8080"`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.package` {#opt-services.gerrit.package}

The gerrit package to use.

*Type:* package

*Default:* `pkgs.gerrit`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.plugins` {#opt-services.gerrit.plugins}

List of plugins to add to Gerrit. Each derivation is a jar file
itself where the name of the derivation is the name of plugin.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.replicationSettings` {#opt-services.gerrit.replicationSettings}

Replication configuration. This will be generated to the
`etc/replication.config` file.

*Type:* lazy attribute set of lazy attribute set of (string or boolean or signed integer or list of (string or boolean or signed integer) or lazy attribute set of (string or boolean or signed integer or list of (string or boolean or signed integer)))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.serverId` {#opt-services.gerrit.serverId}

Set a UUID that uniquely identifies the server.

This can be generated with
`nix-shell -p util-linux --run uuidgen`.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.gerrit.settings` {#opt-services.gerrit.settings}

Gerrit configuration. This will be generated to the
`etc/gerrit.config` file.

*Type:* lazy attribute set of lazy attribute set of (string or boolean or signed integer or list of (string or boolean or signed integer) or lazy attribute set of (string or boolean or signed integer or list of (string or boolean or signed integer)))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/gerrit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gerrit.nix)

## `services.geth` {#opt-services.geth}

Specification of one or more geth instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.authrpc.address` {#opt-services.geth._name_.authrpc.address}

Listen address of Go Ethereum Auth RPC API.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.authrpc.enable` {#opt-services.geth._name_.authrpc.enable}

Whether to enable Go Ethereum Auth RPC API.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.authrpc.jwtsecret` {#opt-services.geth._name_.authrpc.jwtsecret}

Path to a JWT secret for authenticated RPC endpoint.

*Type:* string

*Default:* `""`

*Example:* `"/var/run/geth/jwtsecret"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.authrpc.port` {#opt-services.geth._name_.authrpc.port}

Port number of Go Ethereum Auth RPC API.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8551`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.authrpc.vhosts` {#opt-services.geth._name_.authrpc.vhosts}

List of virtual hostnames from which to accept requests.

*Type:* null or (list of string)

*Default:*

``` nix
[
  "localhost"
]
```

*Example:*

``` nix
[
  "localhost"
  "geth.example.org"
]
```

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.enable` {#opt-services.geth._name_.enable}

Whether to enable Go Ethereum Node.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.extraArgs` {#opt-services.geth._name_.extraArgs}

Additional arguments passed to Go Ethereum.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.gcmode` {#opt-services.geth._name_.gcmode}

Blockchain garbage collection mode.

*Type:* one of "full", "archive"

*Default:* `"full"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.http.address` {#opt-services.geth._name_.http.address}

Listen address of Go Ethereum HTTP API.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.http.apis` {#opt-services.geth._name_.http.apis}

APIs to enable over WebSocket

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "net"
  "eth"
]
```

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.http.enable` {#opt-services.geth._name_.http.enable}

Whether to enable Go Ethereum HTTP API.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.http.port` {#opt-services.geth._name_.http.port}

Port number of Go Ethereum HTTP API.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8545`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.maxpeers` {#opt-services.geth._name_.maxpeers}

Maximum peers to connect to.

*Type:* signed integer

*Default:* `50`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.metrics.address` {#opt-services.geth._name_.metrics.address}

Listen address of Go Ethereum metrics service.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.metrics.enable` {#opt-services.geth._name_.metrics.enable}

Whether to enable Go Ethereum prometheus metrics.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.metrics.port` {#opt-services.geth._name_.metrics.port}

Port number of Go Ethereum metrics service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6060`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.network` {#opt-services.geth._name_.network}

The network to connect to. Mainnet (null) is the default ethereum network.

*Type:* null or one of "holesky", "sepolia"

*Default:* `null`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.package` {#opt-services.geth._name_.package}

The geth package to use.

*Type:* package

*Default:* `pkgs.go-ethereum.geth`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.port` {#opt-services.geth._name_.port}

Port number Go Ethereum will be listening on, both TCP and UDP.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `30303`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.syncmode` {#opt-services.geth._name_.syncmode}

Blockchain sync mode.

*Type:* one of "snap", "fast", "full", "light"

*Default:* `"snap"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.websocket.address` {#opt-services.geth._name_.websocket.address}

Listen address of Go Ethereum WebSocket API.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.websocket.apis` {#opt-services.geth._name_.websocket.apis}

APIs to enable over WebSocket

*Type:* null or (list of string)

*Default:* `null`

*Example:*

``` nix
[
  "net"
  "eth"
]
```

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.websocket.enable` {#opt-services.geth._name_.websocket.enable}

Whether to enable Go Ethereum WebSocket API.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.geth.<name>.websocket.port` {#opt-services.geth._name_.websocket.port}

Port number of Go Ethereum WebSocket API.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8546`

*Declared by:* [`nixos/modules/services/blockchain/ethereum/geth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/blockchain/ethereum/geth.nix)

## `services.getty.autologinOnce` {#opt-services.getty.autologinOnce}

If enabled the automatic login will only happen in the first tty
once per boot. This can be useful to avoid retyping the account
password on systems with full disk encrypted.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/ttys/getty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/getty.nix)

## `services.getty.autologinUser` {#opt-services.getty.autologinUser}

Username of the account that will be automatically logged in at the console.
If unspecified, a login prompt is shown as usual.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/ttys/getty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/getty.nix)

## `services.getty.enable` {#opt-services.getty.enable}

Include getty in the system.

getty is quiescent until called into action and does not have
runtime costs if it is not used. The benefit of disabling it is
in reducing closure size.

Disabling getty means that console login may not be possible,
`machinectl shell` and `login` may not work, and other ills.
It is only recommended for lights-out, headless containers,
appliances, and similar configurations not meant for any human
interaction ever.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/ttys/getty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/getty.nix)

## `services.getty.extraArgs` {#opt-services.getty.extraArgs}

Additional arguments passed to agetty.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--nohostname"
]
```

*Declared by:* [`nixos/modules/services/ttys/getty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/getty.nix)

## `services.getty.greetingLine` {#opt-services.getty.greetingLine}

Welcome line printed by agetty.
The default shows current NixOS version label, machine type and tty.

*Type:* string

*Declared by:* [`nixos/modules/services/ttys/getty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/getty.nix)

## `services.getty.helpLine` {#opt-services.getty.helpLine}

Help line printed by agetty below the welcome line.
Used by the installation CD to give some hints on
how to proceed.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/ttys/getty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/getty.nix)

## `services.getty.loginOptions` {#opt-services.getty.loginOptions}

Template for arguments to be passed to
`login(1)`.

See `agetty(1)` for details,
including security considerations.  If unspecified, agetty
will not be invoked with a `--login-options`
option.

*Type:* null or string

*Default:* `null`

*Example:* `"-h darkstar -- \\u"`

*Declared by:* [`nixos/modules/services/ttys/getty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/getty.nix)

## `services.getty.loginProgram` {#opt-services.getty.loginProgram}

Path to the login binary executed by agetty.

*Type:* absolute path

*Default:* `"${pkgs.shadow}/bin/login"`

*Declared by:* [`nixos/modules/services/ttys/getty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/getty.nix)

## `services.ghostfolio.database.createLocally` {#opt-services.ghostfolio.database.createLocally}

Whether to enable and configure a local PostgreSQL database.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.enable` {#opt-services.ghostfolio.enable}

Whether to enable Ghostfolio.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.environmentFiles` {#opt-services.ghostfolio.environmentFiles}

Environment files passed to Ghostfolio. This is the recommended way
to provide secrets such as `JWT_SECRET_KEY` and `ACCESS_TOKEN_SALT` as the file is not added to the Nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/secrets/ghostfolio.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.openFirewall` {#opt-services.ghostfolio.openFirewall}

Whether to open the Ghostfolio port in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.package` {#opt-services.ghostfolio.package}

The ghostfolio package to use.

*Type:* package

*Default:* `pkgs.ghostfolio`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.redis.createLocally` {#opt-services.ghostfolio.redis.createLocally}

Whether to enable and configure a local Redis server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.settings` {#opt-services.ghostfolio.settings}

Ghostfolio configuration as environment variables.

See [https://github.com/ghostfolio/ghostfolio#self-hosting](https://github.com/ghostfolio/ghostfolio#self-hosting) for the
available options. Sensitive values should be supplied with
[`services.ghostfolio.environmentFiles`](#opt-services.ghostfolio.environmentFiles) instead.

Set `ROOT_URL` explicitly when deploying behind a reverse proxy.

*Type:* open submodule of attribute set of (boolean or signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  ENABLE_FEATURE_AUTH_TOKEN = true;
  ROOT_URL = "https://ghostfolio.example.com";
}
```

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.settings.DATABASE_URL` {#opt-services.ghostfolio.settings.DATABASE_URL}

The database connection URL.

*Type:* string

*Default:* `"postgresql://ghostfolio@localhost/ghostfolio?host=/run/postgresql"`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.settings.HOST` {#opt-services.ghostfolio.settings.HOST}

Address on which Ghostfolio listens.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.settings.PORT` {#opt-services.ghostfolio.settings.PORT}

Port on which Ghostfolio listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3333`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.settings.REDIS_HOST` {#opt-services.ghostfolio.settings.REDIS_HOST}

Redis server address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.settings.REDIS_PORT` {#opt-services.ghostfolio.settings.REDIS_PORT}

Redis server port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6379`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostfolio.settings.ROOT_URL` {#opt-services.ghostfolio.settings.ROOT_URL}

The public URL of the Ghostfolio instance.
Set this explicitly when deploying behind a reverse proxy.

*Type:* string

*Default:* `"http://localhost:${toString config.services.ghostfolio.settings.PORT}"`

*Declared by:* [`nixos/modules/services/web-apps/ghostfolio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/ghostfolio.nix)

## `services.ghostunnel.enable` {#opt-services.ghostunnel.enable}

Whether to enable ghostunnel.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.package` {#opt-services.ghostunnel.package}

The ghostunnel package to use.

*Type:* package

*Default:* `pkgs.ghostunnel`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers` {#opt-services.ghostunnel.servers}

Server mode ghostunnels (TLS listener -\> plain TCP/UNIX target)

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.allowAll` {#opt-services.ghostunnel.servers._name_.allowAll}

If true, allow all clients, do not check client cert subject.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.allowCN` {#opt-services.ghostunnel.servers._name_.allowCN}

Allow client if common name appears in the list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.allowDNS` {#opt-services.ghostunnel.servers._name_.allowDNS}

Allow client if DNS subject alternative name appears in the list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.allowOU` {#opt-services.ghostunnel.servers._name_.allowOU}

Allow client if organizational unit name appears in the list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.allowURI` {#opt-services.ghostunnel.servers._name_.allowURI}

Allow client if URI subject alternative name appears in the list.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.cacert` {#opt-services.ghostunnel.servers._name_.cacert}

Path to CA bundle file (PEM/X509). Uses system trust store if `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.cert` {#opt-services.ghostunnel.servers._name_.cert}

Path to certificate (PEM with certificate chain).

Not required if `keystore` is set.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.disableAuthentication` {#opt-services.ghostunnel.servers._name_.disableAuthentication}

Disable client authentication, no client certificate will be required.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.extraArguments` {#opt-services.ghostunnel.servers._name_.extraArguments}

Extra arguments to pass to `ghostunnel server`

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.key` {#opt-services.ghostunnel.servers._name_.key}

Path to certificate private key (PEM with private key).

Not required if `keystore` is set.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.keystore` {#opt-services.ghostunnel.servers._name_.keystore}

Path to keystore (combined PEM with cert/key, or PKCS12 keystore).

NB: storepass is not supported because it would expose credentials via `/proc/*/cmdline`.

Specify this or `cert` and `key`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.listen` {#opt-services.ghostunnel.servers._name_.listen}

Address and port to listen on (can be HOST:PORT, unix:PATH).

*Type:* string

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.target` {#opt-services.ghostunnel.servers._name_.target}

Address to forward connections to (can be HOST:PORT or unix:PATH).

*Type:* string

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.ghostunnel.servers.<name>.unsafeTarget` {#opt-services.ghostunnel.servers._name_.unsafeTarget}

If set, does not limit target to localhost, 127.0.0.1, \[::1\], or UNIX sockets.

This is meant to protect against accidental unencrypted traffic on
untrusted networks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/ghostunnel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ghostunnel.nix)

## `services.gitDaemon.basePath` {#opt-services.gitDaemon.basePath}

Remap all the path requests as relative to the given path. For example,
if you set base-path to /srv/git, then if you later try to pull
git://example.com/hello.git, Git daemon will interpret the path as /srv/git/hello.git.

*Type:* string

*Default:* `""`

*Example:* `"/srv/git/"`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.enable` {#opt-services.gitDaemon.enable}

Enable Git daemon, which allows public hosting of git repositories
without any access controls. This is mostly intended for read-only access.

You can allow write access by setting daemon.receivepack configuration
item of the repository to true. This is solely meant for a closed LAN setting
where everybody is friendly.

If you need any access controls, use something else.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.exportAll` {#opt-services.gitDaemon.exportAll}

Publish all directories that look like Git repositories (have the objects
and refs subdirectories), even if they do not have the git-daemon-export-ok file.

If disabled, you need to touch .git/git-daemon-export-ok in each repository
you want the daemon to publish.

Warning: enabling this without a repository whitelist or basePath
publishes every git repository you have.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.group` {#opt-services.gitDaemon.group}

Group under which Git daemon would be running.

*Type:* string

*Default:* `"git"`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.listenAddress` {#opt-services.gitDaemon.listenAddress}

Listen on a specific IP address or hostname.

*Type:* string

*Default:* `""`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.options` {#opt-services.gitDaemon.options}

Extra configuration options to be passed to Git daemon.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.package` {#opt-services.gitDaemon.package}

The git package to use.

*Type:* package

*Default:* `pkgs.git`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.port` {#opt-services.gitDaemon.port}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9418`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.repositories` {#opt-services.gitDaemon.repositories}

A whitelist of paths of git repositories, or directories containing repositories
all of which would be published. Paths must not end in "/".

Warning: leaving this empty and enabling exportAll publishes all
repositories in your filesystem or basePath if specified.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/srv/git"
  "/home/user/git/repo2"
]
```

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitDaemon.user` {#opt-services.gitDaemon.user}

User under which Git daemon would be running.

*Type:* string

*Default:* `"git"`

*Declared by:* [`nixos/modules/services/networking/git-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/git-daemon.nix)

## `services.gitea-actions-runner.instances` {#opt-services.gitea-actions-runner.instances}

Gitea Actions Runner instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.enable` {#opt-services.gitea-actions-runner.instances._name_.enable}

Whether to enable Gitea Actions Runner instance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.hostPackages` {#opt-services.gitea-actions-runner.instances._name_.hostPackages}

List of packages, that are available to actions, when the runner is configured
with a host execution label.

*Type:* list of package

*Default:*

``` nix
with pkgs; [
  bash
  coreutils
  curl
  gawk
  gitMinimal
  gnused
  nodejs
  wget
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.labels` {#opt-services.gitea-actions-runner.instances._name_.labels}

Labels used to map jobs to their runtime environment. Changing these
labels currently requires a new registration token.

Many common actions require bash, git and nodejs, as well as a filesystem
that follows the filesystem hierarchy standard.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  # provide a debian base with nodejs for actions
  "debian-latest:docker://node:18-bullseye"
  # fake the ubuntu name, because node provides no ubuntu builds
  "ubuntu-latest:docker://node:18-bullseye"
  # provide native execution on the host
  #"native:host"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.name` {#opt-services.gitea-actions-runner.instances._name_.name}

The name identifying the runner instance towards the Gitea/Forgejo instance.

*Type:* string

*Example:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.settings` {#opt-services.gitea-actions-runner.instances._name_.settings}

Configuration for gitea-runner daemon.
See [https://gitea.com/gitea/runner/src/branch/main/internal/pkg/config/config.example.yaml](https://gitea.com/gitea/runner/src/branch/main/internal/pkg/config/config.example.yaml) for an example configuration

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.settings.cache.external_secret_file` {#opt-services.gitea-actions-runner.instances._name_.settings.cache.external_secret_file}

Path to a file containing the shared secret for an external cache server.

*Type:* null or string or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.token` {#opt-services.gitea-actions-runner.instances._name_.token}

Plain token to register at the configured Gitea/Forgejo instance.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.tokenFile` {#opt-services.gitea-actions-runner.instances._name_.tokenFile}

Path to a file containing a token to register at the configured
Gitea/Forgejo instance.

For backwards compatibility, the file may instead be a
systemd-style environment file containing a `TOKEN` assignment,
but this format is deprecated: a warning is emitted at runtime,
and support will be removed in the future.

*Type:* null or string or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.instances.<name>.url` {#opt-services.gitea-actions-runner.instances._name_.url}

Base URL of your Gitea/Forgejo instance.

*Type:* string

*Example:* `"https://forge.example.com"`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea-actions-runner.package` {#opt-services.gitea-actions-runner.package}

The gitea-actions-runner package to use.

*Type:* package

*Default:* `pkgs.gitea-actions-runner`

*Declared by:* [`nixos/modules/services/continuous-integration/gitea-actions-runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitea-actions-runner.nix)

## `services.gitea.appName` {#opt-services.gitea.appName}

Application name.

*Type:* string

*Default:* `"gitea: Gitea Service"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.camoHmacKeyFile` {#opt-services.gitea.camoHmacKeyFile}

Path to a file containing the camo HMAC key.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/secrets/gitea/camoHmacKey"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.captcha.enable` {#opt-services.gitea.captcha.enable}

Enables Gitea to display a CAPTCHA challenge on registration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.captcha.requireForExternalRegistration` {#opt-services.gitea.captcha.requireForExternalRegistration}

Displays a CAPTCHA challenge for users that register externally.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.captcha.requireForLogin` {#opt-services.gitea.captcha.requireForLogin}

Displays a CAPTCHA challenge whenever a user logs in.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.captcha.secretFile` {#opt-services.gitea.captcha.secretFile}

Path to a file containing the CAPTCHA secret key.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/secrets/gitea/captcha_secret"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.captcha.siteKey` {#opt-services.gitea.captcha.siteKey}

CAPTCHA site key to use for Gitea.

*Type:* null or string

*Default:* `null`

*Example:* `"my_site_key"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.captcha.type` {#opt-services.gitea.captcha.type}

The type of CAPTCHA to use for Gitea.

*Type:* one of "image", "recaptcha", "hcaptcha", "mcaptcha", "cfturnstile"

*Default:* `"image"`

*Example:* `"recaptcha"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.captcha.url` {#opt-services.gitea.captcha.url}

CAPTCHA url to use for Gitea. Only relevant for `recaptcha` and `mcaptcha`.

*Type:* null or string

*Default:* `null`

*Example:* `"https://google.com/recaptcha"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.customDir` {#opt-services.gitea.customDir}

Gitea custom directory. Used for config, custom templates and other options.

*Type:* string

*Default:* `"${config.services.gitea.stateDir}/custom"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.createDatabase` {#opt-services.gitea.database.createDatabase}

Whether to create a local database automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.host` {#opt-services.gitea.database.host}

Database host address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.name` {#opt-services.gitea.database.name}

Database name.

*Type:* string

*Default:* `"gitea"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.password` {#opt-services.gitea.database.password}

The password corresponding to `database.user`.
Warning: this is stored in cleartext in the Nix store!
Use `database.passwordFile` instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.passwordFile` {#opt-services.gitea.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/gitea-dbpassword"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.path` {#opt-services.gitea.database.path}

Path to the sqlite3 database file.

*Type:* string

*Default:* `"${config.services.gitea.stateDir}/data/gitea.db"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.port` {#opt-services.gitea.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:*

``` nix
if config.services.gitea.database.type != "postgresql"
then 3306
else 5432
```

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.socket` {#opt-services.gitea.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/mysqld/mysqld.sock"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.type` {#opt-services.gitea.database.type}

Database engine to use.

*Type:* one of "sqlite3", "mysql", "postgres"

*Default:* `"sqlite3"`

*Example:* `"mysql"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.database.user` {#opt-services.gitea.database.user}

Database user.

*Type:* string

*Default:* `"gitea"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.dump.backupDir` {#opt-services.gitea.dump.backupDir}

Path to the dump files.

*Type:* string

*Default:* `"${config.services.gitea.stateDir}/dump"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.dump.enable` {#opt-services.gitea.dump.enable}

Enable a timer that runs gitea dump to generate backup-files of the
current gitea database and repositories.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.dump.file` {#opt-services.gitea.dump.file}

Filename to be used for the dump. If `null` a default name is chosen by gitea.

*Type:* null or string

*Default:* `null`

*Example:* `"gitea-dump"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.dump.interval` {#opt-services.gitea.dump.interval}

Run a gitea dump at this interval. Runs by default at 04:31 every day.

The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"04:31"`

*Example:* `"hourly"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.dump.type` {#opt-services.gitea.dump.type}

Archive format used to store the dump file.

*Type:* one of "zip", "rar", "tar", "sz", "tar.gz", "tar.xz", "tar.bz2", "tar.br", "tar.lz4", "tar.zst"

*Default:* `"zip"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.enable` {#opt-services.gitea.enable}

Enable Gitea Service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.extraConfig` {#opt-services.gitea.extraConfig}

Configuration lines appended to the generated gitea configuration file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.group` {#opt-services.gitea.group}

Group under which gitea runs.

*Type:* string

*Default:* `"gitea"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.incomingMailPasswordFile` {#opt-services.gitea.incomingMailPasswordFile}

Path to a file containing the IMAP password.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/secrets/gitea/incomingmailpw"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.lfs.contentDir` {#opt-services.gitea.lfs.contentDir}

Where to store LFS files.

*Type:* string

*Default:* `"${config.services.gitea.stateDir}/data/lfs"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.lfs.enable` {#opt-services.gitea.lfs.enable}

Enables git-lfs support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.mailerPasswordFile` {#opt-services.gitea.mailerPasswordFile}

Path to a file containing the SMTP password.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/secrets/gitea/mailpw"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.metricsTokenFile` {#opt-services.gitea.metricsTokenFile}

Path to a file containing the metrics authentication token.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/secrets/gitea/metrics_token"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.minioAccessKeyId` {#opt-services.gitea.minioAccessKeyId}

Path to a file containing the S3 Access Key.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/secrets/gitea_s3_access_key"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.minioSecretAccessKey` {#opt-services.gitea.minioSecretAccessKey}

Path to a file containing the S3 Secret Key.

*Type:* null or string

*Default:* `null`

*Example:* `"/var/lib/secrets/gitea_s3_secret_key"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.package` {#opt-services.gitea.package}

The gitea package to use.

*Type:* package

*Default:* `pkgs.gitea`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.repositoryRoot` {#opt-services.gitea.repositoryRoot}

Path to the git repositories.

*Type:* string

*Default:* `"${config.services.gitea.stateDir}/repositories"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings` {#opt-services.gitea.settings}

Gitea configuration. Refer to [https://docs.gitea.io/en-us/config-cheat-sheet/](https://docs.gitea.io/en-us/config-cheat-sheet/)
for details on supported values.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  "cron.sync_external_users" = {
    RUN_AT_START = true;
    SCHEDULE = "@every 24h";
    UPDATE_EXISTING = true;
  };
  mailer = {
    ENABLED = true;
    PROTOCOL = "smtp+starttls";
    SMTP_ADDR = "smtp.example.org";
    SMTP_PORT = "587";
    FROM = "Gitea Service <do-not-reply@example.org>";
    USER = "do-not-reply@example.org";
  };
  other = {
    SHOW_FOOTER_VERSION = false;
  };
}
```

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.log.LEVEL` {#opt-services.gitea.settings.log.LEVEL}

General log level.

*Type:* one of "Trace", "Debug", "Info", "Warn", "Error", "Critical"

*Default:* `"Info"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.log.ROOT_PATH` {#opt-services.gitea.settings.log.ROOT_PATH}

Root path for log files.

*Type:* string

*Default:* `"${config.services.gitea.stateDir}/log"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.mailer.ENABLED` {#opt-services.gitea.settings.mailer.ENABLED}

Whether to use an email service to send notifications.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.mailer.PROTOCOL` {#opt-services.gitea.settings.mailer.PROTOCOL}

Which mail server protocol to use.

*Type:* one of <null>, "smtp", "smtps", "smtp+starttls", "smtp+unix", "sendmail", "dummy"

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.mailer.SENDMAIL_PATH` {#opt-services.gitea.settings.mailer.SENDMAIL_PATH}

Path to sendmail binary or script.

*Type:* string

*Default:* `if config.services.gitea.settings.mailer.ENABLED && config.services.gitea.settings.mailer.PROTOCOL == "sendmail" then "/run/wrappers/bin/sendmail" else "sendmail"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.server.DISABLE_SSH` {#opt-services.gitea.settings.server.DISABLE_SSH}

Disable external SSH feature.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.server.HTTP_ADDR` {#opt-services.gitea.settings.server.HTTP_ADDR}

Listen address. Must be a path when using a unix socket.

*Type:* string or absolute path

*Default:* `if lib.hasSuffix "+unix" cfg.settings.server.PROTOCOL then "/run/gitea/gitea.sock" else "0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.server.HTTP_PORT` {#opt-services.gitea.settings.server.HTTP_PORT}

Listen port. Ignored when using a unix socket.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.server.PROTOCOL` {#opt-services.gitea.settings.server.PROTOCOL}

Listen protocol. `+unix` means "over unix", not "in addition to."

*Type:* one of "http", "https", "fcgi", "http+unix", "fcgi+unix"

*Default:* `"http"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.server.ROOT_URL` {#opt-services.gitea.settings.server.ROOT_URL}

Full public URL of gitea server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.server.SSH_PORT` {#opt-services.gitea.settings.server.SSH_PORT}

SSH port displayed in clone URL.
The option is required to configure a service when the external visible port
differs from the local listening port i.e. if port forwarding is used.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `22`

*Example:* `2222`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.server.STATIC_ROOT_PATH` {#opt-services.gitea.settings.server.STATIC_ROOT_PATH}

Upper level of template and static files path.

*Type:* string or absolute path

*Default:* `config.services.gitea.package.data`

*Example:* `"/var/lib/gitea/data"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.service.DISABLE_REGISTRATION` {#opt-services.gitea.settings.service.DISABLE_REGISTRATION}

By default registration is disabled. It can be enabled by setting this option to `false`.

::: note
This option is required to be set to `false` for the initial installation and the first registered user will be admin.
:::

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.settings.session.COOKIE_SECURE` {#opt-services.gitea.settings.session.COOKIE_SECURE}

Marks session cookies as "secure" as a hint for browsers to only send
them via HTTPS. This option is recommend, if gitea is being served over HTTPS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.stateDir` {#opt-services.gitea.stateDir}

Gitea data directory.

*Type:* string

*Default:* `"/var/lib/gitea"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.gitea.user` {#opt-services.gitea.user}

User account under which gitea runs.

*Type:* string

*Default:* `"gitea"`

*Declared by:* [`nixos/modules/services/misc/gitea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitea.nix)

## `services.github-runners` {#opt-services.github-runners}

Multiple GitHub Runners.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  runner1 = {
    enable = true;
    name = "runner1";
    tokenFile = "/secrets/token1";
    url = "https://github.com/owner/repo";
  };
  runner2 = {
    enable = true;
    name = "runner2";
    tokenFile = "/secrets/token2";
    url = "https://github.com/owner/repo";
  };
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.count` {#opt-services.github-runners._name_.count}

Number of identical runner instances to create.

Without `orgs`, this fans the single entry (using the
entry-level `url`) out into `count` runner services:
`github-runner-<name>` for `count == 1` (unchanged) and
`github-runner-<name>-<n>` for `count > 1`. Each instance
registers under a distinct runner name.

With `orgs`, this is the default replica count for every org
that does not set its own; see `orgs.<name>.count`.

Pairs well with `ephemeral`.

*Type:* positive integer, meaning \>0

*Default:* `1`

*Example:* `4`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.enable` {#opt-services.github-runners._name_.enable}

Whether to enable GitHub Actions runner.

Note: GitHub recommends using self-hosted runners with private repositories only. Learn more here:
[About self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.ephemeral` {#opt-services.github-runners._name_.ephemeral}

If enabled, causes the following behavior:

- Passes the `--ephemeral` flag to the runner configuration script
- De-registers and stops the runner with GitHub after it has processed one job
- On stop, systemd wipes the runtime directory (this always happens, even without using the ephemeral option)
- Restarts the service after its successful exit
- On start, wipes the state directory and configures a new runner

You should only enable this option if `tokenFile` points to a file which contains a
personal access token (PAT). If you're using the option with a registration token, restarting the
service will fail as soon as the registration token expired.

Changing this option triggers a new runner registration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.extraEnvironment` {#opt-services.github-runners._name_.extraEnvironment}

Extra environment variables to set for the runner, as an attrset.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  GIT_CONFIG = "/path/to/git/config";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.extraLabels` {#opt-services.github-runners._name_.extraLabels}

Extra labels in addition to the default (unless disabled through the `noDefaultLabels` option).

Changing this option triggers a new runner registration.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "nixos" ]`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.extraPackages` {#opt-services.github-runners._name_.extraPackages}

Extra packages to add to `PATH` of the service to make them available to workflows.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.githubApp` {#opt-services.github-runners._name_.githubApp}

Authenticate the runner using a GitHub App installation instead
of a `tokenFile`. Exactly one of `tokenFile` and `githubApp` must
be set.

On every start the service derives a short-lived installation
access token from the App's private key, uses it to fetch a fresh
runner registration token and registers the runner with it. This
avoids storing a long-lived personal access token on the host and
pairs well with `ephemeral` runners.

The App needs read and write access to the
"self-hosted runners" administration of the organisation (or
repository) given in `url`, and must be installed on the `login`
below.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  id = 123456;
  login = "my-org";
  privateKeyFile = "/run/secrets/github-app.pem";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.githubApp.id` {#opt-services.github-runners._name_.githubApp.id}

The GitHub App's ID (the numeric `App ID`, not the client ID).

*Type:* signed integer

*Example:* `123456`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.githubApp.login` {#opt-services.github-runners._name_.githubApp.login}

The organisation (or user) login the GitHub App is
installed on. Used to look up the App installation and,
for organisation-wide runners, as the registration scope.

Mandatory unless `orgs` is used, in which case the login
is taken from each `orgs.<name>.login` instead and this
option is ignored.

Changing this option triggers a new runner registration.

*Type:* null or string

*Default:* `null`

*Example:* `"my-org"`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.githubApp.privateKeyFile` {#opt-services.github-runners._name_.githubApp.privateKeyFile}

The full path to a file containing the GitHub App's
PEM-encoded private key. The file should be deployed as a
secret and is never copied into the Nix store.

*Type:* absolute path

*Example:* `"/run/secrets/github-app.pem"`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.group` {#opt-services.github-runners._name_.group}

Group under which to run the service.

The effect of this option depends on the value of the `user` option:

- `group == null` and `user == null`:
  The service runs with a dynamically allocated user and group.
- `group == null` and `user != null`:
  The service runs as the given user and its default group.
- `group != null` and `user == null`:
  This configuration is invalid. In this case, the service would use the given group
  but run as root implicitly. If this is really what you want, set `user = "root"` explicitly.

*Type:* null or string

*Default:* `groupname`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.name` {#opt-services.github-runners._name_.name}

Name of the runner to configure. If null, defaults to the hostname.

Changing this option triggers a new runner registration.

*Type:* null or string

*Default:* `"‹name›"`

*Example:* `"nixos"`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.noDefaultLabels` {#opt-services.github-runners._name_.noDefaultLabels}

Disables adding the default labels. Also see the `extraLabels` option.

Changing this option triggers a new runner registration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.nodeRuntimes` {#opt-services.github-runners._name_.nodeRuntimes}

List of Node.js runtimes the runner should support.

*Type:* non-empty (list of value "node24" (singular enum))

*Default:*

``` nix
[
  "node24"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.orgs` {#opt-services.github-runners._name_.orgs}

Organisations (or repositories) to serve from this entry.

When set, the entry fans out into one systemd service per runner
named `github-runner-<name>-<org>-<n>`, where `<org>` is the
attribute name and `<n>` ranges over the per-org `count`. The
entry-level `githubApp`/`tokenFile` is shared across every org;
only the App `login` changes per org (defaulting to the
attribute name), so a single GitHub App installed on multiple
orgs serves all of them.

Leaving this empty (the default) keeps the single-runner
behaviour: the entry-level `url`, `name` and auth, fanned out by
the entry-level `count`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  org-a.count = 12;
  org-b = {
    count = 2;
    extraLabels = [ "org-b" ];
  };
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.orgs.<name>.count` {#opt-services.github-runners._name_.orgs._name_.count}

Number of identical runner instances to create for this
org. Defaults to the entry-level `count`. Each gets its
own systemd service named `github-runner-<name>-<org>-<n>`
and registers under a distinct runner name. Pairs well
with `ephemeral`.

*Type:* positive integer, meaning \>0

*Default:* the entry-level `count`

*Example:* `4`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.orgs.<name>.extraLabels` {#opt-services.github-runners._name_.orgs._name_.extraLabels}

Extra labels added, on top of the entry-level `extraLabels`,
only to this org's runners.

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "org-a" ]`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.orgs.<name>.login` {#opt-services.github-runners._name_.orgs._name_.login}

GitHub login (org or user) the shared `githubApp` is
installed on. Defaults to the attribute name. Ignored
when authenticating via `tokenFile`.

*Type:* string

*Default:* `${name}`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.orgs.<name>.url` {#opt-services.github-runners._name_.orgs._name_.url}

URL of the organisation (or repository) to connect to.
Defaults to the GitHub URL derived from the attribute name.

*Type:* string

*Default:* `"https://github.com/${name}"`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.package` {#opt-services.github-runners._name_.package}

The github-runner package to use.

*Type:* package

*Default:* `pkgs.github-runner`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.replace` {#opt-services.github-runners._name_.replace}

Replace any existing runner with the same name.

Without this flag, registering a new runner with the same name fails.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.runnerGroup` {#opt-services.github-runners._name_.runnerGroup}

Name of the runner group to add this runner to (defaults to the default runner group).

Changing this option triggers a new runner registration.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.serviceOverrides` {#opt-services.github-runners._name_.serviceOverrides}

Modify the systemd service. Can be used to, e.g., adjust the sandboxing options.
See `systemd.exec(5)` for more options.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  ProtectHome = false;
  RestrictAddressFamilies = [
    "AF_PACKET"
  ];
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.tokenFile` {#opt-services.github-runners._name_.tokenFile}

The full path to a file which contains either

- a fine-grained personal access token (PAT),
- a classic PAT
- or a runner registration token

Exactly one of `tokenFile` and `githubApp` must be set. Use
`githubApp` to authenticate via a GitHub App installation instead
of a token file.

Changing this option or the `tokenFile`’s content triggers a new runner registration.

We suggest using the fine-grained PATs. A runner registration token is valid
only for 1 hour after creation, so the next time the runner configuration changes
this will give you hard-to-debug HTTP 404 errors in the configure step.

The file should contain exactly one line with the token without any newline.
(Use `echo -n '…token…' > …token file…` to make sure no newlines sneak in.)

If the file contains a PAT, the service creates a new registration token
on startup as needed.
If a registration token is given, it can be used to re-register a runner of the same
name but is time-limited as noted above.

For fine-grained PATs:

Give it "Read and Write access to organization/repository self hosted runners",
depending on whether it is organization wide or per-repository. You might have to
experiment a little, fine-grained PATs are a `beta` Github feature and still subject
to change; nonetheless they are the best option at the moment.

For classic PATs:

Make sure the PAT has a scope of `admin:org` for organization-wide registrations
or a scope of `repo` for a single repository.

For runner registration tokens:

Nothing special needs to be done, but updating will break after one hour,
so these are not recommended.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/github-runner/nixos.token"`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.tokenType` {#opt-services.github-runners._name_.tokenType}

Type of token to use for runner registration.

An access token is a personal access token or any other kind of GitHub token that
starts with `ghp_`, `gho_`, etc prefix. It is passed as `--pat` to the runner
config script.

A registration token is an unprefixed string generated by the
"Add new self-hosted runner" page. It is passed as `--token` to runner config
script.

The default `auto` attempts to detect the token type automatically based on its
format.

*Type:* one of "auto", "access", "registration"

*Default:* `"auto"`

*Example:* `"registration"`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.url` {#opt-services.github-runners._name_.url}

Repository to add the runner to.

Changing this option triggers a new runner registration.

IMPORTANT: If your token is org-wide (not per repository), you need to
provide a github org link, not a single repository, so do it like this
`https://github.com/nixos`, not like this
`https://github.com/nixos/nixpkgs`.
Otherwise, you are going to get a `404 NotFound`
from `POST https://api.github.com/actions/runner-registration`
in the configure script.

Mandatory unless `orgs` is used, in which case the URL is taken
from each `orgs.<name>.url` instead and this option is ignored.

*Type:* null or string

*Default:* `null`

*Example:* `"https://github.com/nixos/nixpkgs"`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.user` {#opt-services.github-runners._name_.user}

User under which to run the service.

If this option and the `group` option is set to `null`,
the service runs as a dynamically allocated user.

Also see the `group` option for an overview on the effects of the `user` and `group` settings.

*Type:* null or string

*Default:* `username`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.github-runners.<name>.workDir` {#opt-services.github-runners._name_.workDir}

Working directory, available as `$GITHUB_WORKSPACE` during workflow runs
and used as a default for [repository checkouts](https://github.com/actions/checkout).
The service cleans this directory on every service start.

A value of `null` will default to the systemd `RuntimeDirectory`.

Changing this option triggers a new runner registration.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/github-runner/options.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/github-runner/options.nix)

## `services.gitlab-runner.clear-docker-cache.dates` {#opt-services.gitlab-runner.clear-docker-cache.dates}

Specification (in the format described by
`systemd.time(7)`) of the time at
which the prune will occur.

*Type:* string

*Default:* `"weekly"`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.clear-docker-cache.enable` {#opt-services.gitlab-runner.clear-docker-cache.enable}

Whether to periodically prune gitlab runner's Docker resources. If
enabled, a systemd timer will run `clear-docker-cache` as
specified by the `dates` option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.clear-docker-cache.flags` {#opt-services.gitlab-runner.clear-docker-cache.flags}

Any additional flags passed to `clear-docker-cache`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "prune"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.clear-docker-cache.package` {#opt-services.gitlab-runner.clear-docker-cache.package}

Docker package to use for clearing up docker cache.

*Type:* unspecified value

*Default:* `config.virtualisation.docker.package`

*Example:* `pkgs.docker`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.configFile` {#opt-services.gitlab-runner.configFile}

Configuration file for gitlab-runner.

`configFile` takes precedence over `services`.
`checkInterval` and `concurrent` will be ignored too.

This option is deprecated, please use `services` instead.
You can use `registrationConfigFile` and
`registrationFlags`
for settings not covered by this module.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.enable` {#opt-services.gitlab-runner.enable}

Whether to enable Gitlab Runner.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.extraPackages` {#opt-services.gitlab-runner.extraPackages}

Extra packages to add to `PATH` for the `gitlab-runner` process.
These packages won't be added to the system, use `environment.systemPackages` for that.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.gracefulTermination` {#opt-services.gitlab-runner.gracefulTermination}

Finish all remaining jobs before stopping.
If not set gitlab-runner will stop immediately without waiting
for jobs to finish, which will lead to failed builds.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.gracefulTimeout` {#opt-services.gitlab-runner.gracefulTimeout}

Time to wait until a graceful shutdown is turned into a forceful one.

*Type:* string

*Default:* `"infinity"`

*Example:* `"5min 20s"`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.package` {#opt-services.gitlab-runner.package}

The gitlab-runner package to use.

*Type:* package

*Default:* `pkgs.gitlab-runner`

*Example:* `gitlab-runner_1_11`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services` {#opt-services.gitlab-runner.services}

GitLab Runner services.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  # runner for building in docker via host's nix-daemon
  # nix store will be readable in runner, might be insecure
  nix = {
    # File should contain at least these two variables:
    # - `CI_SERVER_URL`
    # - `REGISTRATION_TOKEN`
    #
    # NOTE: Support for runner registration tokens will be removed in GitLab 18.0.
    # Please migrate to runner authentication tokens soon. For reference, the example
    # runners below this one are configured with authentication tokens instead.
    registrationConfigFile = "/run/secrets/gitlab-runner-registration";

    dockerImage = "alpine";
    dockerVolumes = [
      "/nix/store:/nix/store:ro"
      "/nix/var/nix/db:/nix/var/nix/db:ro"
      "/nix/var/nix/daemon-socket:/nix/var/nix/daemon-socket:ro"
    ];
    dockerDisableCache = true;
    preBuildScript = pkgs.writeScript "setup-container" ''
      mkdir -p -m 0755 /nix/var/log/nix/drvs
      mkdir -p -m 0755 /nix/var/nix/gcroots
      mkdir -p -m 0755 /nix/var/nix/profiles
      mkdir -p -m 0755 /nix/var/nix/temproots
      mkdir -p -m 0755 /nix/var/nix/userpool
      mkdir -p -m 1777 /nix/var/nix/gcroots/per-user
      mkdir -p -m 1777 /nix/var/nix/profiles/per-user
      mkdir -p -m 0755 /nix/var/nix/profiles/per-user/root
      mkdir -p -m 0700 "$HOME/.nix-defexpr"

      . ${pkgs.nix}/etc/profile.d/nix.sh

      ${pkgs.nix}/bin/nix-env -i ${concatStringsSep " " (with pkgs; [ nix cacert git openssh ])}

      ${pkgs.nix}/bin/nix-channel --add https://channels.nixos.org/nixpkgs-unstable
      ${pkgs.nix}/bin/nix-channel --update nixpkgs
    '';
    environmentVariables = {
      ENV = "/etc/profile";
      USER = "root";
      NIX_REMOTE = "daemon";
      PATH = "/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:/bin:/sbin:/usr/bin:/usr/sbin";
      NIX_SSL_CERT_FILE = "/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt";
    };
    tagList = [ "nix" ];
  };
  # runner for building docker images
  docker-images = {
    # File should contain at least these two variables:
    # `CI_SERVER_URL`
    # `CI_SERVER_TOKEN`
    authenticationTokenConfigFile = "/run/secrets/gitlab-runner-docker-images-token-env";

    dockerImage = "docker:stable";
    dockerVolumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
    ];
    tagList = [ "docker-images" ];
  };
  # runner for executing stuff on host system (very insecure!)
  # make sure to add required packages (including git!)
  # to `environment.systemPackages`
  shell = {
    # File should contain at least these two variables:
    # `CI_SERVER_URL`
    # `CI_SERVER_TOKEN`
    authenticationTokenConfigFile = "/run/secrets/gitlab-runner-shell-token-env";

    executor = "shell";
    tagList = [ "shell" ];
  };
  # runner for everything else
  default = {
    # File should contain at least these two variables:
    # `CI_SERVER_URL`
    # `CI_SERVER_TOKEN`
    authenticationTokenConfigFile = "/run/secrets/gitlab-runner-default-token-env";
    dockerImage = "debian:stable";
  };
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.authenticationTokenConfigFile` {#opt-services.gitlab-runner.services._name_.authenticationTokenConfigFile}

Absolute path to a file containing environment variables used for
gitlab-runner registrations with *runner authentication tokens*.
They replace the deprecated *runner registration tokens*, as
outlined in the [GitLab documentation](https://docs.gitlab.com/17.0/ee/ci/runners/new_creation_workflow.html#estimated-time-frame-for-planned-changes).

A list of all supported environment variables can be found with
`gitlab-runner register --help`.

The ones you probably want to set are:

- `CI_SERVER_URL=<CI server URL>`
- `CI_SERVER_TOKEN=<runner authentication token secret>`

::: warning
Make sure to use a quoted absolute path,
or it is going to be copied to Nix Store.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.buildsDir` {#opt-services.gitlab-runner.services._name_.buildsDir}

Absolute path to a directory where builds will be stored
in context of selected executor (Locally, Docker, SSH).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/gitlab-runner/builds"`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.cloneUrl` {#opt-services.gitlab-runner.services._name_.cloneUrl}

Overwrite the URL for the GitLab instance. Used if the Runner can’t connect to GitLab on the URL GitLab exposes itself.

*Type:* null or string

*Default:* `null`

*Example:* `"http://gitlab.example.local"`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.debugTraceDisabled` {#opt-services.gitlab-runner.services._name_.debugTraceDisabled}

When set to true Runner will disable the possibility of
using the `CI_DEBUG_TRACE` feature.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.description` {#opt-services.gitlab-runner.services._name_.description}

Name/description of the runner.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerAllowedImages` {#opt-services.gitlab-runner.services._name_.dockerAllowedImages}

Whitelist allowed images.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ruby:*"
  "python:*"
  "php:*"
  "my.registry.tld:5000/*:*"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerAllowedPrivilegedServices` {#opt-services.gitlab-runner.services._name_.dockerAllowedPrivilegedServices}

Whitelist allowed privileged services.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "docker.io/library/docker:*-dind-rootless"
  "docker.io/library/docker:dind-rootless"
  "docker:*-dind-rootless"
  "docker:dind-rootless"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerAllowedServices` {#opt-services.gitlab-runner.services._name_.dockerAllowedServices}

Whitelist allowed services.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "postgres:9"
  "redis:*"
  "mysql:*"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerDisableCache` {#opt-services.gitlab-runner.services._name_.dockerDisableCache}

Disable all container caching.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerExtraHosts` {#opt-services.gitlab-runner.services._name_.dockerExtraHosts}

Add a custom host-to-IP mapping.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "other-host:127.0.0.1"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerImage` {#opt-services.gitlab-runner.services._name_.dockerImage}

Docker image to be used.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerPrivileged` {#opt-services.gitlab-runner.services._name_.dockerPrivileged}

Give extended privileges to container.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerPullPolicy` {#opt-services.gitlab-runner.services._name_.dockerPullPolicy}

Default pull-policy for Docker images

*Type:* null or one of "always", "never", "if-not-present"

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerServicesPrivileged` {#opt-services.gitlab-runner.services._name_.dockerServicesPrivileged}

Give extended privileges to services.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.dockerVolumes` {#opt-services.gitlab-runner.services._name_.dockerVolumes}

Bind-mount a volume and create it
if it doesn't exist prior to mounting.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/var/run/docker.sock:/var/run/docker.sock"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.environmentVariables` {#opt-services.gitlab-runner.services._name_.environmentVariables}

Custom environment variables injected to build environment.
For secrets you can use `registrationConfigFile`
with `RUNNER_ENV` variable set.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  NAME = "value";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.executor` {#opt-services.gitlab-runner.services._name_.executor}

Select executor, eg. shell, docker, etc.
See [runner executor documentation](https://docs.gitlab.com/runner/executors/) for more information.

*Type:* string

*Default:* `"docker"`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.limit` {#opt-services.gitlab-runner.services._name_.limit}

Limit how many jobs can be handled concurrently by this service.
0 (default) simply means don't limit.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.maximumTimeout` {#opt-services.gitlab-runner.services._name_.maximumTimeout}

What is the maximum timeout (in seconds) that will be set for
job when using this Runner. 0 (default) simply means don't limit.

This option has no effect for runners registered with an runner
authentication tokens and will be ignored.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.postBuildScript` {#opt-services.gitlab-runner.services._name_.postBuildScript}

Runner-specific command script executed after code is pulled
and just after build executes.

*Type:* null or string or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.postGetSourcesScript` {#opt-services.gitlab-runner.services._name_.postGetSourcesScript}

Runner-specific command script executed after code is pulled.

*Type:* null or string or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.preBuildScript` {#opt-services.gitlab-runner.services._name_.preBuildScript}

Runner-specific command script executed after code is pulled,
just before build executes.

*Type:* null or string or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.preGetSourcesScript` {#opt-services.gitlab-runner.services._name_.preGetSourcesScript}

Runner-specific command script executed before code is pulled.

*Type:* null or string or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.protected` {#opt-services.gitlab-runner.services._name_.protected}

When set to true Runner will only run on pipelines
triggered on protected branches.

This option has no effect for runners registered with an runner
authentication tokens and will be ignored.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.registrationConfigFile` {#opt-services.gitlab-runner.services._name_.registrationConfigFile}

Absolute path to a file with environment variables
used for gitlab-runner registration with *runner registration
tokens*.

A list of all supported environment variables can be found in
`gitlab-runner register --help`.

The ones you probably want to set are:

- `CI_SERVER_URL=<CI server URL>`
- `REGISTRATION_TOKEN=<registration secret>`

Support for *runner registration tokens* is deprecated since
GitLab 16.0, has been disabled by default in GitLab 17.0 and
will be removed in GitLab 18.0, as outlined in the
[GitLab documentation](https://docs.gitlab.com/17.0/ee/ci/runners/new_creation_workflow.html#estimated-time-frame-for-planned-changes). Please consider migrating to
[runner authentication tokens](https://docs.gitlab.com/17.0/ee/ci/runners/new_creation_workflow.html#the-new-runner-registration-workflow) and check the documentation on
[`services.gitlab-runner.services.<name>.authenticationTokenConfigFile`](#opt-services.gitlab-runner.services._name_.authenticationTokenConfigFile).

::: warning
Make sure to use a quoted absolute path,
or it is going to be copied to Nix Store.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.registrationFlags` {#opt-services.gitlab-runner.services._name_.registrationFlags}

Extra command-line flags passed to
`gitlab-runner register`.
Execute `gitlab-runner register --help`
for a list of supported flags.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--docker-helper-image my/gitlab-runner-helper"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.requestConcurrency` {#opt-services.gitlab-runner.services._name_.requestConcurrency}

Limit number of concurrent requests for new jobs from GitLab.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.runUntagged` {#opt-services.gitlab-runner.services._name_.runUntagged}

Register to run untagged builds; defaults to
`true` when `tagList` is empty.

This option has no effect for runners registered with an runner
authentication tokens and will be ignored.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.services.<name>.tagList` {#opt-services.gitlab-runner.services._name_.tagList}

Tag list.

This option has no effect for runners registered with an runner
authentication tokens and will be ignored.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab-runner.settings` {#opt-services.gitlab-runner.settings}

Global gitlab-runner configuration. See
[https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-global-section](https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-global-section)
for supported values.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/gitlab-runner/runner.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gitlab-runner/runner.nix)

## `services.gitlab.backup.keepTime` {#opt-services.gitlab.backup.keepTime}

How long to keep the backups around, in
hours. `0` means “keep forever”.

*Type:* signed integer

*Default:* `0`

*Example:* `48`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.backup.path` {#opt-services.gitlab.backup.path}

GitLab path for backups.

*Type:* string

*Default:* `config.services.gitlab.statePath + "/backup"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.backup.skip` {#opt-services.gitlab.backup.skip}

Directories to exclude from the backup. The example excludes
CI artifacts and LFS objects from the backups. The
`tar` option skips the creation of a tar
file.

Refer to [https://docs.gitlab.com/ee/raketasks/backup\_restore.html#excluding-specific-directories-from-the-backup](https://docs.gitlab.com/ee/raketasks/backup_restore.html#excluding-specific-directories-from-the-backup)
for more information.

*Type:* one of "db", "uploads", "builds", "artifacts", "lfs", "registry", "pages", "repositories", "tar" or list of (one of "db", "uploads", "builds", "artifacts", "lfs", "registry", "pages", "repositories", "tar")

*Default:* `[ ]`

*Example:*

``` nix
[
  "artifacts"
  "lfs"
]
```

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.backup.startAt` {#opt-services.gitlab.backup.startAt}

The time(s) to run automatic backup of GitLab
state. Specified in systemd's time format; see
`systemd.time(7)`.

*Type:* string or list of string

*Default:* `[ ]`

*Example:* `"03:00"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.backup.uploadOptions` {#opt-services.gitlab.backup.uploadOptions}

GitLab automatic upload specification. Tells GitLab to
upload the backup to a remote location when done.

Attributes specified here are added under
`production -> backup -> upload` in
`config/gitlab.yml`.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  # Fog storage connection settings, see http://fog.io/storage/
  connection = {
    provider = "AWS";
    region = "eu-north-1";
    aws_access_key_id = "AKIAXXXXXXXXXXXXXXXX";
    aws_secret_access_key = { _secret = config.deployment.keys.aws_access_key.path; };
  };

  # The remote 'directory' to store your backups in.
  # For S3, this would be the bucket name.
  remote_directory = "my-gitlab-backups";

  # Use multipart uploads when file size reaches 100MB, see
  # http://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html
  multipart_chunk_size = 104857600;

  # Turns on AWS Server-Side Encryption with Amazon S3-Managed Keys for backups, this is optional
  encryption = "AES256";

  # Specifies Amazon S3 storage class to use for backups, this is optional
  storage_class = "STANDARD";
};
```

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.databaseCreateLocally` {#opt-services.gitlab.databaseCreateLocally}

Whether a database should be automatically created on the
local host. Set this to `false` if you plan
on provisioning a local database yourself. This has no effect
if [`services.gitlab.databaseHost`](#opt-services.gitlab.databaseHost) is customized.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.databaseHost` {#opt-services.gitlab.databaseHost}

GitLab database hostname. An empty string means
“use local unix socket connection”.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.databaseName` {#opt-services.gitlab.databaseName}

GitLab database name.

*Type:* string

*Default:* `"gitlab"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.databasePasswordFile` {#opt-services.gitlab.databasePasswordFile}

File containing the GitLab database user password.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.databasePool` {#opt-services.gitlab.databasePool}

Database connection pool size.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.databaseUsername` {#opt-services.gitlab.databaseUsername}

GitLab database user.

*Type:* string

*Default:* `"gitlab"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.enable` {#opt-services.gitlab.enable}

Enable the gitlab service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.extraConfig` {#opt-services.gitlab.extraConfig}

Extra options to be added under
`production` in
`config/gitlab.yml`, as a nix attribute
set.

Options containing secret data should be set to an attribute
set containing the attribute `_secret` - a
string pointing to a file containing the value the option
should be set to. See the example to get a better picture of
this: in the resulting
`config/gitlab.yml` file, the
`production.omniauth.providers[0].args.client_options.secret`
key will be set to the contents of the
`/var/keys/gitlab_oidc_secret` file.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  gitlab = {
    default_projects_features = {
      builds = false;
    };
  };
  omniauth = {
    enabled = true;
    auto_sign_in_with_provider = "openid_connect";
    allow_single_sign_on = ["openid_connect"];
    block_auto_created_users = false;
    providers = [
      {
        name = "openid_connect";
        label = "OpenID Connect";
        args = {
          name = "openid_connect";
          scope = ["openid" "profile"];
          response_type = "code";
          issuer = "https://keycloak.example.com/auth/realms/My%20Realm";
          discovery = true;
          client_auth_method = "query";
          uid_field = "preferred_username";
          client_options = {
            identifier = "gitlab";
            secret = { _secret = "/var/keys/gitlab_oidc_secret"; };
            redirect_uri = "https://git.example.com/users/auth/openid_connect/callback";
          };
        };
      }
    ];
  };
};
```

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.extraDatabaseConfig` {#opt-services.gitlab.extraDatabaseConfig}

Extra configuration in config/database.yml.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.extraEnv` {#opt-services.gitlab.extraEnv}

Additional environment variables for the GitLab environment.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.extraGitlabRb` {#opt-services.gitlab.extraGitlabRb}

Extra configuration to be placed in config/extra-gitlab.rb. This can
be used to add configuration not otherwise exposed through this module's
options.

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  if Rails.env.production?
    Rails.application.config.action_mailer.delivery_method = :sendmail
    ActionMailer::Base.delivery_method = :sendmail
    ActionMailer::Base.sendmail_settings = {
      location: "/run/wrappers/bin/sendmail",
      arguments: "-i -t"
    }
  end
''
```

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.extraShellConfig` {#opt-services.gitlab.extraShellConfig}

Extra configuration to merge into shell-config.yml

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.group` {#opt-services.gitlab.group}

Group to run gitlab and all related services.

*Type:* string

*Default:* `"gitlab"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.host` {#opt-services.gitlab.host}

GitLab host name. Used e.g. for copy-paste URLs.

*Type:* string

*Default:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.https` {#opt-services.gitlab.https}

Whether gitlab prints URLs with https as scheme.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.initialRootEmail` {#opt-services.gitlab.initialRootEmail}

Initial email address of the root account if this is a new install.

*Type:* string

*Default:* `"admin@local.host"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.initialRootPasswordFile` {#opt-services.gitlab.initialRootPasswordFile}

File containing the initial password of the root account if
this is a new install.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.logrotate.enable` {#opt-services.gitlab.logrotate.enable}

Enable rotation of log files.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.logrotate.frequency` {#opt-services.gitlab.logrotate.frequency}

How often to rotate the logs.

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.logrotate.keep` {#opt-services.gitlab.logrotate.keep}

How many rotations to keep.

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.packages.gitaly` {#opt-services.gitlab.packages.gitaly}

The gitaly package to use.

*Type:* package

*Default:* `pkgs.gitaly`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.packages.gitlab` {#opt-services.gitlab.packages.gitlab}

The gitlab package to use.

*Type:* package

*Default:* `pkgs.gitlab`

*Example:* `gitlab-ee`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.packages.gitlab-shell` {#opt-services.gitlab.packages.gitlab-shell}

The gitlab-shell package to use.

*Type:* package

*Default:* `pkgs.gitlab-shell`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.packages.gitlab-workhorse` {#opt-services.gitlab.packages.gitlab-workhorse}

The gitlab-workhorse package to use.

*Type:* package

*Default:* `pkgs.gitlab-workhorse`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.packages.pages` {#opt-services.gitlab.packages.pages}

The gitlab-pages package to use.

*Type:* package

*Default:* `pkgs.gitlab-pages`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.enable` {#opt-services.gitlab.pages.enable}

Whether to enable the GitLab Pages service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings` {#opt-services.gitlab.pages.settings}

Configuration options to set in the GitLab Pages config
file.

Options containing secret data should be set to an attribute
set containing the attribute `_secret` - a string pointing
to a file containing the value the option should be set
to. See the example to get a better picture of this: in the
resulting configuration file, the `auth-client-secret` and
`auth-secret` keys will be set to the contents of the
`/var/keys/auth-client-secret` and
`/var/keys/auth-secret` files respectively.

*Type:* open submodule of attribute set of (null or string or signed integer or boolean or (attribute set))

*Example:*

``` nix
{
  pages-domain = "example.com";
  auth-client-id = "generated-id-xxxxxxx";
  auth-client-secret = { _secret = "/var/keys/auth-client-secret"; };
  auth-redirect-uri = "https://projects.example.com/auth";
  auth-secret = { _secret = "/var/keys/auth-secret"; };
  auth-server = "https://gitlab.example.com";
}
```

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings.artifacts-server` {#opt-services.gitlab.pages.settings.artifacts-server}

API URL to proxy artifact requests to.

*Type:* null or string

*Default:* `"http(s)://<services.gitlab.host>/api/v4"`

*Example:* `"https://gitlab.example.com/api/v4"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings.gitlab-server` {#opt-services.gitlab.pages.settings.gitlab-server}

Public GitLab server URL.

*Type:* null or string

*Default:* `"http(s)://<services.gitlab.host>"`

*Example:* `"https://gitlab.example.com"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings.internal-gitlab-server` {#opt-services.gitlab.pages.settings.internal-gitlab-server}

Internal GitLab server used for API requests, useful
if you want to send that traffic over an internal load
balancer. By default, the value of
`services.gitlab.pages.settings.gitlab-server` is
used.

*Type:* null or string

*Default:* `"http(s)://<services.gitlab.host>"`

*Example:* `"https://gitlab.example.internal"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings.listen-http` {#opt-services.gitlab.pages.settings.listen-http}

The address(es) to listen on for HTTP requests.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings.listen-https` {#opt-services.gitlab.pages.settings.listen-https}

The address(es) to listen on for HTTPS requests.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings.listen-proxy` {#opt-services.gitlab.pages.settings.listen-proxy}

The address(es) to listen on for proxy requests.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1:8090"
]
```

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings.pages-domain` {#opt-services.gitlab.pages.settings.pages-domain}

The domain to serve static pages on.

*Type:* null or string

*Default:* `null`

*Example:* `"example.com"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.pages.settings.pages-root` {#opt-services.gitlab.pages.settings.pages-root}

The directory where pages are stored.

*Type:* string

*Default:* `config.services.gitlab.extraConfig.production.shared.path + "/pages"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.port` {#opt-services.gitlab.port}

GitLab server port for copy-paste URLs, e.g. 80 or 443 if you're
service over https.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.puma.threadsMax` {#opt-services.gitlab.puma.threadsMax}

The maximum number of threads Puma should use per
worker. This limits how many threads Puma will automatically
spawn in response to requests. In contrast to workers,
threads will never be able to run Ruby code in parallel, but
give higher IO parallelism.

::: note
Each thread consumes memory and contributes to Global VM
Lock contention, so be careful when increasing this.
:::

*Type:* signed integer

*Default:* `4`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.puma.threadsMin` {#opt-services.gitlab.puma.threadsMin}

The minimum number of threads Puma should use per
worker.

::: note
Each thread consumes memory and contributes to Global VM
Lock contention, so be careful when increasing this.
:::

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.puma.workers` {#opt-services.gitlab.puma.workers}

The number of worker processes Puma should spawn. This
controls the amount of parallel Ruby code can be
executed. GitLab recommends `Number of CPU cores - 1`, but at least two.

::: note
Each worker consumes quite a bit of memory, so
be careful when increasing this.
:::

*Type:* signed integer

*Default:* `2`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.redisUrl` {#opt-services.gitlab.redisUrl}

Redis URL for all GitLab services.

*Type:* string

*Default:* `"unix:/run/gitlab/redis.sock"`

*Example:* `"redis://localhost:6379/"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.registry.certFile` {#opt-services.gitlab.registry.certFile}

Path to GitLab container registry certificate.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.databaseCreateLocally` {#opt-services.gitlab.registry.databaseCreateLocally}

Whether a database should be automatically created on the
local host. Set this to `false` if you plan
to provision a local database yourself. This has no effect
if [`services.gitlab.registry.settings.database.host`](#opt-services.gitlab.registry.settings.database.host) is customized.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.defaultForProjects` {#opt-services.gitlab.registry.defaultForProjects}

If GitLab container registry should be enabled by default for projects.

*Type:* boolean

*Default:* `config.services.gitlab.registry.enable`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.enable` {#opt-services.gitlab.registry.enable}

Whether to enable GitLab container registry.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.enableDelete` {#opt-services.gitlab.registry.enableDelete}

Enable delete for manifests and blobs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.enableRedisCache` {#opt-services.gitlab.registry.enableRedisCache}

Whether to enable redis as blob cache.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.externalAddress` {#opt-services.gitlab.registry.externalAddress}

External address used to access registry from the internet

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.externalPort` {#opt-services.gitlab.registry.externalPort}

External port used to access registry from the internet

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.garbageCollection.dates` {#opt-services.gitlab.registry.garbageCollection.dates}

Specification (in the format described by
`systemd.time(7)`) of the time at
which the garbage collection will occur.

*Type:* string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.garbageCollection.enable` {#opt-services.gitlab.registry.garbageCollection.enable}

Whether to enable garbage collection.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.host` {#opt-services.gitlab.registry.host}

Address of the GitLab instance, Gitlab Contianer Registry connects to.

*Type:* string

*Default:* `config.services.gitlab.host`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.keyFile` {#opt-services.gitlab.registry.keyFile}

Path to GitLab container registry certificate key.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.package` {#opt-services.gitlab.registry.package}

The gitlab-container-registry package to use. External container registries such as `pkgs.distribution` are not supported
anymore since GitLab 16.0.0.

*Type:* package

*Default:* `pkgs.gitlab-container-registry`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.redisPassword` {#opt-services.gitlab.registry.redisPassword}

Set redis password.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.redisUrl` {#opt-services.gitlab.registry.redisUrl}

Set redis host and port.

*Type:* string

*Default:* `"localhost:6379"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings` {#opt-services.gitlab.registry.settings}

GitLab container registry configuration.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.auth.token.issuer` {#opt-services.gitlab.registry.settings.auth.token.issuer}

The name of the token issuer. The issuer inserts this into the token so it must match the value configured for the issuer.

*Type:* string

*Default:* `"gitlab-issuer"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.auth.token.realm` {#opt-services.gitlab.registry.settings.auth.token.realm}

The realm in which the registry server authenticates.

*Type:* string

*Default:*

``` nix
"http${
  lib.optionalString (config.services.gitlab.https == true) "s"
}://${cfg.host}/jwt/auth"
```

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.auth.token.rootcertbundle` {#opt-services.gitlab.registry.settings.auth.token.rootcertbundle}

The absolute path to the root certificate bundle. This bundle contains the public part of the certificates used to sign authentication tokens.

*Type:* absolute path

*Default:* `config.services.gitlab.registry.certFile`

*Read only*

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.auth.token.service` {#opt-services.gitlab.registry.settings.auth.token.service}

The service being authenticated

*Type:* string

*Default:* `"container_registry"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.database.dbname` {#opt-services.gitlab.registry.settings.database.dbname}

The database name that is used.

*Type:* string

*Default:* `"gitlab-container-registry"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.database.enabled` {#opt-services.gitlab.registry.settings.database.enabled}

Whether to enable the database metadata store.

"prefer" is a mode that uses the database as metadata store, but falls back to the filesystem store when it has not been imported yet into the database.

*Type:* boolean or value "prefer" (singular enum)

*Default:* `"prefer"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.database.host` {#opt-services.gitlab.registry.settings.database.host}

The database host GitLab container registry connects to. An empty string means 'use local unix socket connection'

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.health.storagedriver.enabled` {#opt-services.gitlab.registry.settings.health.storagedriver.enabled}

Whether to enable storage driver health checks.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.health.storagedriver.threshold` {#opt-services.gitlab.registry.settings.health.storagedriver.threshold}

The number of times the check must fail before the state is marked as unhealthy

*Type:* unsigned integer, meaning \>=0

*Default:* `3`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.http.addr` {#opt-services.gitlab.registry.settings.http.addr}

Address the contianer registry listens on.

*Type:* string

*Default:* `"127.0.0.1:4567"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.http.headers.X-Content-Type-Options` {#opt-services.gitlab.registry.settings.http.headers.X-Content-Type-Options}

Value the X-Content-Type-Options HTTP header should be set to. 'nosniff' is recommended by GitLab.

*Type:* list of string

*Default:*

``` nix
[
  "nosniff"
]
```

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.log.fields.service` {#opt-services.gitlab.registry.settings.log.fields.service}

The service name added to log messages

*Type:* string

*Default:* `"gitlab-container-registry"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.storage.cache.blobdescriptor` {#opt-services.gitlab.registry.settings.storage.cache.blobdescriptor}

Backend to use for caching.

*Type:* string

*Default:* `if config.services.gitlab.registry.enableRedisCache then "redis" else "inmemory"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.settings.version` {#opt-services.gitlab.registry.settings.version}

Version of the configuration file

*Type:* string

*Default:* `"0.1"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.storagePath` {#opt-services.gitlab.registry.storagePath}

GitLab container registry storage path for the filesystem storage backend. Set to
null to configure another backend via settings.

*Type:* null or absolute path

*Default:*

``` nix
if lib.versionAtLeast config.system.stateVersion "27.05" then
"/var/lib/gitlab-container-registry"
else
"/var/lib/docker-registry"
```

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.registry.user` {#opt-services.gitlab.registry.user}

User the registry runs as

*Type:* string

*Default:* `"gitlab-container-registry"`

*Declared by:* [`nixos/modules/services/misc/gitlab/container-registry.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/container-registry.nix)

## `services.gitlab.secrets.activeRecordDeterministicKeyFile` {#opt-services.gitlab.secrets.activeRecordDeterministicKeyFile}

A file containing the secret used to encrypt some rails data in a deterministic way
in the DB. This should not be the same as `services.gitlab.secrets.activeRecordPrimaryKeyFile`!

Make sure the secret is at ideally 32 characters and all random,
no regular words or you'll be exposed to dictionary attacks.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.secrets.activeRecordPrimaryKeyFile` {#opt-services.gitlab.secrets.activeRecordPrimaryKeyFile}

A file containing the secret used to encrypt some rails data
in the DB. This should not be the same as `services.gitlab.secrets.activeRecordDeterministicKeyFile`!

Make sure the secret is at ideally 32 characters and all random,
no regular words or you'll be exposed to dictionary attacks.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.secrets.activeRecordSaltFile` {#opt-services.gitlab.secrets.activeRecordSaltFile}

A file containing the salt for active record encryption in the DB.

Make sure the secret is at ideally 32 characters and all random,
no regular words or you'll be exposed to dictionary attacks.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.secrets.dbFile` {#opt-services.gitlab.secrets.dbFile}

A file containing the secret used to encrypt variables in
the DB. If you change or lose this key you will be unable to
access variables stored in database.

Make sure the secret is at least 32 characters and all random,
no regular words or you'll be exposed to dictionary attacks.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.secrets.jwsFile` {#opt-services.gitlab.secrets.jwsFile}

A file containing the secret used to encrypt session
keys. If you change or lose this key, users will be
disconnected.

Make sure the secret is an RSA private key in PEM format. You can
generate one with

openssl genrsa 2048

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.secrets.otpFile` {#opt-services.gitlab.secrets.otpFile}

A file containing the secret used to encrypt secrets for OTP
tokens. If you change or lose this key, users which have 2FA
enabled for login won't be able to login anymore.

Make sure the secret is at least 32 characters and all random,
no regular words or you'll be exposed to dictionary attacks.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.secrets.secretFile` {#opt-services.gitlab.secrets.secretFile}

A file containing the secret used to encrypt variables in
the DB. If you change or lose this key you will be unable to
access variables stored in database.

Make sure the secret is at least 32 characters and all random,
no regular words or you'll be exposed to dictionary attacks.

This should be a string, not a nix path, since nix paths are
copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.sidekiq.concurrency` {#opt-services.gitlab.sidekiq.concurrency}

How many processor threads to use for processing sidekiq background job queues. When null, the GitLab default is used.

See [https://docs.gitlab.com/ee/administration/sidekiq/extra\_sidekiq\_processes.html#manage-thread-counts-explicitly](https://docs.gitlab.com/ee/administration/sidekiq/extra_sidekiq_processes.html#manage-thread-counts-explicitly) for details.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.sidekiq.memoryKiller.enable` {#opt-services.gitlab.sidekiq.memoryKiller.enable}

Whether the Sidekiq MemoryKiller should be turned
on. MemoryKiller kills Sidekiq when its memory consumption
exceeds a certain limit.

See [https://docs.gitlab.com/ee/administration/operations/sidekiq\_memory\_killer.html](https://docs.gitlab.com/ee/administration/operations/sidekiq_memory_killer.html)
for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.sidekiq.memoryKiller.graceTime` {#opt-services.gitlab.sidekiq.memoryKiller.graceTime}

The time MemoryKiller waits after noticing excessive memory
consumption before killing Sidekiq.

*Type:* signed integer

*Default:* `900`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.sidekiq.memoryKiller.maxMemory` {#opt-services.gitlab.sidekiq.memoryKiller.maxMemory}

The maximum amount of memory, in MiB, a Sidekiq worker is
allowed to consume before being killed.

*Type:* signed integer

*Default:* `2000`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.sidekiq.memoryKiller.shutdownWait` {#opt-services.gitlab.sidekiq.memoryKiller.shutdownWait}

The time allowed for all jobs to finish before Sidekiq is
killed forcefully.

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.address` {#opt-services.gitlab.smtp.address}

Address of the SMTP server for GitLab.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.authentication` {#opt-services.gitlab.smtp.authentication}

Authentication type to use, see [http://api.rubyonrails.org/classes/ActionMailer/Base.html](http://api.rubyonrails.org/classes/ActionMailer/Base.html)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.domain` {#opt-services.gitlab.smtp.domain}

HELO domain to use for outgoing mail.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.enable` {#opt-services.gitlab.smtp.enable}

Enable gitlab mail delivery over SMTP.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.enableStartTLSAuto` {#opt-services.gitlab.smtp.enableStartTLSAuto}

Whether to try to use StartTLS.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.opensslVerifyMode` {#opt-services.gitlab.smtp.opensslVerifyMode}

How OpenSSL checks the certificate, see [http://api.rubyonrails.org/classes/ActionMailer/Base.html](http://api.rubyonrails.org/classes/ActionMailer/Base.html)

*Type:* string

*Default:* `"peer"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.passwordFile` {#opt-services.gitlab.smtp.passwordFile}

File containing the password of the SMTP server for GitLab.

This should be a string, not a nix path, since nix paths
are copied into the world-readable nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.port` {#opt-services.gitlab.smtp.port}

Port of the SMTP server for GitLab.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `25`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.tls` {#opt-services.gitlab.smtp.tls}

Whether to use TLS wrapper-mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.smtp.username` {#opt-services.gitlab.smtp.username}

Username of the SMTP server for GitLab.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.statePath` {#opt-services.gitlab.statePath}

GitLab state directory. Configuration, repositories and
logs, among other things, are stored here.

The directory will be created automatically if it doesn't
exist already. Its parent directories must be owned by
either `root` or the user set in
[`services.gitlab.user`](#opt-services.gitlab.user).

*Type:* string

*Default:* `"/var/gitlab/state"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.user` {#opt-services.gitlab.user}

User to run gitlab and all related services.

*Type:* string

*Default:* `"gitlab"`

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitlab.workhorse.config` {#opt-services.gitlab.workhorse.config}

Configuration options to add to Workhorse's configuration
file.

See
[https://gitlab.com/gitlab-org/gitlab/-/blob/master/workhorse/config.toml.example](https://gitlab.com/gitlab-org/gitlab/-/blob/master/workhorse/config.toml.example)
and
[https://docs.gitlab.com/ee/development/workhorse/configuration.html](https://docs.gitlab.com/ee/development/workhorse/configuration.html)
for examples and option documentation.

Options containing secret data should be set to an attribute
set containing the attribute `_secret` - a string pointing
to a file containing the value the option should be set
to. See the example to get a better picture of this: in the
resulting configuration file, the
`object_storage.s3.aws_secret_access_key` key will be set to
the contents of the `/var/keys/aws_secret_access_key`
file.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  object_storage.provider = "AWS";
  object_storage.s3 = {
    aws_access_key_id = "AKIAXXXXXXXXXXXXXXXX";
    aws_secret_access_key = { _secret = "/var/keys/aws_secret_access_key"; };
  };
};
```

*Declared by:* [`nixos/modules/services/misc/gitlab/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitlab/default.nix)

## `services.gitolite.adminPubkey` {#opt-services.gitolite.adminPubkey}

Initial administrative public key for Gitolite. This should
be an SSH Public Key. Note that this key will only be used
once, upon the first initialization of the Gitolite user.
The key string cannot have any line breaks in it.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitolite.commonHooks` {#opt-services.gitolite.commonHooks}

A list of custom git hooks that get copied to `~/.gitolite/hooks/common`.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitolite.dataDir` {#opt-services.gitolite.dataDir}

The gitolite home directory used to store all repositories. If left as the default value
this directory will automatically be created before the gitolite server starts, otherwise
the sysadmin is responsible for ensuring the directory exists with appropriate ownership
and permissions.

*Type:* string

*Default:* `"/var/lib/gitolite"`

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitolite.description` {#opt-services.gitolite.description}

Gitolite user account's description.

*Type:* string

*Default:* `"Gitolite user"`

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitolite.enable` {#opt-services.gitolite.enable}

Enable gitolite management under the
`gitolite` user. After
switching to a configuration with Gitolite enabled, you can
then run `git clone gitolite@host:gitolite-admin.git` to manage it further.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitolite.enableGitAnnex` {#opt-services.gitolite.enableGitAnnex}

Enable git-annex support. Uses the `extraGitoliteRc` option
to apply the necessary configuration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitolite.extraGitoliteRc` {#opt-services.gitolite.extraGitoliteRc}

Extra configuration to append to the default `~/.gitolite.rc`.

This should be Perl code that modifies the `%RC`
configuration variable. The default `~/.gitolite.rc`
content is generated by invoking `gitolite print-default-rc`,
and extra configuration from this option is appended to it. The result
is placed to Nix store, and the `~/.gitolite.rc` file
becomes a symlink to it.

If you already have a customized (or otherwise changed)
`~/.gitolite.rc` file, NixOS will refuse to replace
it with a symlink, and the `gitolite-init` initialization service
will fail. In this situation, in order to use this option, you
will need to take any customizations you may have in
`~/.gitolite.rc`, convert them to appropriate Perl
statements, add them to this option, and remove the file.

See also the `enableGitAnnex` option.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  $RC{UMASK} = 0027;
  $RC{SITE_INFO} = 'This is our private repository host';
  push( @{$RC{ENABLE}}, 'Kindergarten' ); # enable the command/feature
  @{$RC{ENABLE}} = grep { $_ ne 'desc' } @{$RC{ENABLE}}; # disable the command/feature
''
```

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitolite.group` {#opt-services.gitolite.group}

Primary group of the Gitolite user account.

*Type:* string

*Default:* `"gitolite"`

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitolite.user` {#opt-services.gitolite.user}

Gitolite user account. This is the username of the gitolite endpoint.

*Type:* string

*Default:* `"gitolite"`

*Declared by:* [`nixos/modules/services/misc/gitolite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitolite.nix)

## `services.gitwatch` {#opt-services.gitwatch}

A set of git repositories to watch for. See
[gitwatch](https://github.com/gitwatch/gitwatch) for more.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  disabled-repo = {
    branch = "autobranch";
    enable = false;
    path = "/home/user/disabled-project";
    remote = "git@github.com:me/my-old-project.git";
    user = "user";
  };
  my-repo = {
    enable = true;
    message = "Auto-commit by gitwatch on %d";
    path = "/home/user/watched-project";
    remote = "git@github.com:me/my-project.git";
    user = "user";
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/gitwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gitwatch.nix)

## `services.gitwatch.<name>.branch` {#opt-services.gitwatch._name_.branch}

Optional branch in remote repository

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/gitwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gitwatch.nix)

## `services.gitwatch.<name>.enable` {#opt-services.gitwatch._name_.enable}

Whether to enable watching for repo.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/gitwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gitwatch.nix)

## `services.gitwatch.<name>.message` {#opt-services.gitwatch._name_.message}

Optional text to use in as commit message; all occurrences of `%d` will be replaced by formatted date/time

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/gitwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gitwatch.nix)

## `services.gitwatch.<name>.path` {#opt-services.gitwatch._name_.path}

The path to repo in local machine

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/gitwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gitwatch.nix)

## `services.gitwatch.<name>.remote` {#opt-services.gitwatch._name_.remote}

Optional url of remote repository

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/gitwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gitwatch.nix)

## `services.gitwatch.<name>.user` {#opt-services.gitwatch._name_.user}

The name of services's user

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/monitoring/gitwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gitwatch.nix)

## `services.gitweb.extraConfig` {#opt-services.gitweb.extraConfig}

Verbatim configuration text appended to the generated gitweb.conf file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  $feature{'highlight'}{'default'} = [1];
  $feature{'ctags'}{'default'} = [1];
  $feature{'avatar'}{'default'} = ['gravatar'];
''
```

*Declared by:* [`nixos/modules/services/misc/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitweb.nix)

## `services.gitweb.gitwebTheme` {#opt-services.gitweb.gitwebTheme}

Use an alternative theme for gitweb, strongly inspired by GitHub.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitweb.nix)

## `services.gitweb.nginx.enable` {#opt-services.gitweb.nginx.enable}

If true, enable gitweb in nginx.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitweb.nix)

## `services.gitweb.nginx.group` {#opt-services.gitweb.nginx.group}

Group that the CGI process will belong to. (Set to `config.services.gitolite.group` if you are using gitolite.)

*Type:* string

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/misc/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitweb.nix)

## `services.gitweb.nginx.location` {#opt-services.gitweb.nginx.location}

Location to serve gitweb on.

*Type:* string

*Default:* `"/gitweb"`

*Declared by:* [`nixos/modules/services/misc/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitweb.nix)

## `services.gitweb.nginx.user` {#opt-services.gitweb.nginx.user}

Existing user that the CGI process will belong to. (Default almost surely will do.)

*Type:* string

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/misc/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitweb.nix)

## `services.gitweb.nginx.virtualHost` {#opt-services.gitweb.nginx.virtualHost}

VirtualHost to serve gitweb on. Default is catch-all.

*Type:* string

*Default:* `"_"`

*Declared by:* [`nixos/modules/services/misc/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitweb.nix)

## `services.gitweb.projectroot` {#opt-services.gitweb.projectroot}

Path to git projects (bare repositories) that should be served by
gitweb. Must not end with a slash.

*Type:* absolute path

*Default:* `"/srv/git"`

*Declared by:* [`nixos/modules/services/misc/gitweb.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gitweb.nix)

## `services.glance.enable` {#opt-services.glance.enable}

Whether to enable glance.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/glance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glance.nix)

## `services.glance.environmentFile` {#opt-services.glance.environmentFile}

Path to an environment file as defined in `systemd.exec(5)`.

See upstream documentation
[https://github.com/glanceapp/glance/blob/main/docs/configuration.md#environment-variables](https://github.com/glanceapp/glance/blob/main/docs/configuration.md#environment-variables).

Example content of the file:

```
TIMEZONE=Europe/Paris
```

Example `services.glance.settings.pages` configuration:

``` nix
  [
    {
      name = "Home";
      columns = [
        {
          size = "full";
          widgets = [
            {
              type = "clock";
              timezone = "\${TIMEZONE}";
              label = "Local Time";
            }
          ];
        }
      ];
    }
  ];
```

Note that when using Glance's `${ENV_VAR}` syntax in Nix,
you need to escape it as follows: use `\${ENV_VAR}` in `"` strings
and `''${ENV_VAR}` in `''` strings.

Alternatively, you can put each secret in it's own file,
see `services.glance.settings`.

*Type:* null or absolute path

*Default:* `"/dev/null"`

*Example:* `"/var/lib/secrets/glance"`

*Declared by:* [`nixos/modules/services/web-apps/glance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glance.nix)

## `services.glance.openFirewall` {#opt-services.glance.openFirewall}

Whether to open the firewall for Glance.
This adds `services.glance.settings.server.port` to `networking.firewall.allowedTCPPorts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/glance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glance.nix)

## `services.glance.package` {#opt-services.glance.package}

The glance package to use.

*Type:* package

*Default:* `pkgs.glance`

*Declared by:* [`nixos/modules/services/web-apps/glance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glance.nix)

## `services.glance.settings` {#opt-services.glance.settings}

Configuration written to a yaml file that is read by glance. See
[https://github.com/glanceapp/glance/blob/main/docs/configuration.md](https://github.com/glanceapp/glance/blob/main/docs/configuration.md)
for more.

Settings containing secret data should be set to an
attribute set with this format: `{ _secret = "/path/to/secret"; }`.
See the example in `services.glance.settings.pages` at the weather widget
with a location secret to get a better picture of this.

Alternatively, you can use a single file with environment variables,
see `services.glance.environmentFile`.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/glance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glance.nix)

## `services.glance.settings.pages` {#opt-services.glance.settings.pages}

List of pages to be present on the dashboard.

See [https://github.com/glanceapp/glance/blob/main/docs/configuration.md#pages--columns](https://github.com/glanceapp/glance/blob/main/docs/configuration.md#pages--columns)

*Type:* YAML 1.1 value

*Default:*

``` nix
[
  {
    columns = [
      {
        size = "full";
        widgets = [
          {
            type = "calendar";
          }
        ];
      }
    ];
    name = "Calendar";
  }
]
```

*Example:*

``` nix
[
  {
    columns = [
      {
        size = "full";
        widgets = [
          {
            type = "calendar";
          }
          {
            location = {
              _secret = "/var/lib/secrets/glance/location";
            };
            type = "weather";
          }
        ];
      }
    ];
    name = "Home";
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/glance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glance.nix)

## `services.glance.settings.server.host` {#opt-services.glance.settings.server.host}

Glance bind address

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/glance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glance.nix)

## `services.glance.settings.server.port` {#opt-services.glance.settings.server.port}

Glance port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `5678`

*Declared by:* [`nixos/modules/services/web-apps/glance.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glance.nix)

## `services.glances.enable` {#opt-services.glances.enable}

Whether to enable Glances.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/glances.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glances.nix)

## `services.glances.extraArgs` {#opt-services.glances.extraArgs}

Extra command-line arguments to pass to glances.

See [https://glances.readthedocs.io/en/latest/cmds.html](https://glances.readthedocs.io/en/latest/cmds.html) for all available options.

*Type:* list of string

*Default:*

``` nix
[
  "--webserver"
]
```

*Example:*

``` nix
[
  "--webserver"
  "--disable-webui"
]
```

*Declared by:* [`nixos/modules/services/monitoring/glances.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glances.nix)

## `services.glances.openFirewall` {#opt-services.glances.openFirewall}

Open port in the firewall for glances.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/glances.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glances.nix)

## `services.glances.package` {#opt-services.glances.package}

The glances package to use.

*Type:* package

*Default:* `pkgs.glances`

*Declared by:* [`nixos/modules/services/monitoring/glances.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glances.nix)

## `services.glances.port` {#opt-services.glances.port}

Port the server will isten on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `61208`

*Declared by:* [`nixos/modules/services/monitoring/glances.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glances.nix)

## `services.glitchtip.database.createLocally` {#opt-services.glitchtip.database.createLocally}

Whether to enable and configure a local PostgreSQL database server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.enable` {#opt-services.glitchtip.enable}

Whether to enable GlitchTip.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.environmentFiles` {#opt-services.glitchtip.environmentFiles}

Files to load environment variables from in addition to [services (G)](#opt-services.glitchtip.settings).
This is useful to avoid putting secrets into the nix store.
See [https://glitchtip.com/documentation/install#configuration](https://glitchtip.com/documentation/install#configuration) for more information.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/secrets/glitchtip.env"
]
```

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.group` {#opt-services.glitchtip.group}

The group under which GlitchTip runs.

*Type:* string

*Default:* `"glitchtip"`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.nginx.createLocally` {#opt-services.glitchtip.nginx.createLocally}

Whether to enable and configure a local Nginx server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.nginx.domain` {#opt-services.glitchtip.nginx.domain}

Domain under which GlitchTip will be reachable.
In contrast to `settings.GLITCHTIP_DOMAIN` this option has no protocol.
It will also set `settings.GLITCHTIP_DOMAIN` with the `https://` protocol.

*Type:* string

*Example:* `"glitchtip.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.package` {#opt-services.glitchtip.package}

The glitchtip package to use.

*Type:* package

*Default:* `pkgs.glitchtip`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.redis.createLocally` {#opt-services.glitchtip.redis.createLocally}

Whether to enable and configure a local Redis instance.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.settings` {#opt-services.glitchtip.settings}

Configuration of GlitchTip. See [https://glitchtip.com/documentation/install#configuration](https://glitchtip.com/documentation/install#configuration) for more information and required settings.

*Type:* open submodule of attribute set of (string or signed integer or boolean)

*Default:*

``` nix
{
  DEBUG = 0;
  DEBUG_TOOLBAR = 0;
  DATABASE_URL = lib.mkIf config.services.glitchtip.database.createLocally "postgresql://@/glitchtip";
  GLITCHTIP_DOMAIN = lib.mkIf config.services.glitchtip.nginx.createLocally "https://${config.services.glitchtip.nginx.domain}";
  GLITCHTIP_VERSION = config.services.glitchtip.package.version;
  GRANIAN_HOST = "127.0.0.1";
  GRANIAN_PORT = 8000;
  GRANIAN_STATIC_PATH_MOUNT = "${config.services.glitchtip.package}/lib/glitchtip/static";
  PYTHONUNBUFFERED = 1;
  VALKEY_URL = lib.mkIf config.services.glitchtip.redis.createLocally "unix://${config.services.redis.servers.glitchtip.unixSocket}";
}
```

*Example:*

``` nix
{
  DATABASE_URL = "postgres://postgres:postgres@postgres/postgres";
  GLITCHTIP_DOMAIN = "https://glitchtip.example.com";
}
```

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.settings.ENABLE_OBSERVABILITY_API` {#opt-services.glitchtip.settings.ENABLE_OBSERVABILITY_API}

Whether to enable the Prometheus metrics endpoint.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.settings.ENABLE_ORGANIZATION_CREATION` {#opt-services.glitchtip.settings.ENABLE_ORGANIZATION_CREATION}

When false, only superusers will be able to create new organizations after the first. When true, any user can create a new organization.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.settings.ENABLE_USER_REGISTRATION` {#opt-services.glitchtip.settings.ENABLE_USER_REGISTRATION}

When true, any user will be able to register. When false, user self-signup is disabled after the first user is registered. Subsequent users must be created by a superuser on the backend and organization invitations may only be sent to existing users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.settings.GLITCHTIP_DOMAIN` {#opt-services.glitchtip.settings.GLITCHTIP_DOMAIN}

The URL under which GlitchTip is externally reachable.

*Type:* null or string

*Default:* `null`

*Example:* `"https://glitchtip.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.settings.GLITCHTIP_ENABLE_MCP` {#opt-services.glitchtip.settings.GLITCHTIP_ENABLE_MCP}

Whether to enable the MCP api.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.settings.GRANIAN_WORKERS` {#opt-services.glitchtip.settings.GRANIAN_WORKERS}

Number of granian workers to start

*Type:* positive integer, meaning \>0

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.stateDir` {#opt-services.glitchtip.stateDir}

State directory of glitchtip.

*Type:* absolute path

*Default:* `"/var/lib/glitchtip"`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glitchtip.user` {#opt-services.glitchtip.user}

The user account under which GlitchTip runs.

*Type:* string

*Default:* `"glitchtip"`

*Declared by:* [`nixos/modules/services/web-apps/glitchtip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/glitchtip.nix)

## `services.glpiAgent.enable` {#opt-services.glpiAgent.enable}

Whether to enable GLPI Agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/glpi-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glpi-agent.nix)

## `services.glpiAgent.package` {#opt-services.glpiAgent.package}

The glpi-agent package to use.

*Type:* package

*Default:* `pkgs.glpi-agent`

*Declared by:* [`nixos/modules/services/monitoring/glpi-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glpi-agent.nix)

## `services.glpiAgent.settings` {#opt-services.glpiAgent.settings}

GLPI Agent configuration options.
See [https://glpi-agent.readthedocs.io/en/latest/configuration.html](https://glpi-agent.readthedocs.io/en/latest/configuration.html) for all available options.

The 'server' option is mandatory and must point to your GLPI server.

*Type:* attribute set of (boolean or signed integer or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  server = [ "https://glpi.example.com/inventory" ];
  delaytime = 3600;
  tag = "production";
  logger = [ "stderr" "file" ];
  debug = 1;
  "no-category" = [ "printer" "software" ];
}
```

*Declared by:* [`nixos/modules/services/monitoring/glpi-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glpi-agent.nix)

## `services.glpiAgent.stateDir` {#opt-services.glpiAgent.stateDir}

Directory where GLPI Agent stores its state.

*Type:* string

*Default:* `"/var/lib/glpi-agent"`

*Declared by:* [`nixos/modules/services/monitoring/glpi-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/glpi-agent.nix)

## `services.glusterfs.enable` {#opt-services.glusterfs.enable}

Whether to enable GlusterFS Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.enableGlustereventsd` {#opt-services.glusterfs.enableGlustereventsd}

Whether to enable the GlusterFS Events Daemon

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.extraFlags` {#opt-services.glusterfs.extraFlags}

Extra flags passed to the GlusterFS daemon

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.killMode` {#opt-services.glusterfs.killMode}

The systemd KillMode to use for glusterd.

glusterd spawns other daemons like gsyncd.
If you want these to stop when glusterd is stopped (e.g. to ensure
that NixOS config changes are reflected even for these sub-daemons),
set this to 'control-group'.
If however you want running volume processes (glusterfsd) and thus
gluster mounts not be interrupted when glusterd is restarted
(for example, when you want to restart them manually at a later time),
set this to 'process'.

*Type:* one of "control-group", "process", "mixed", "none"

*Default:* `"control-group"`

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.logLevel` {#opt-services.glusterfs.logLevel}

Log level used by the GlusterFS daemon

*Type:* one of "DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL", "TRACE", "NONE"

*Default:* `"INFO"`

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.stopKillTimeout` {#opt-services.glusterfs.stopKillTimeout}

The systemd TimeoutStopSec to use.

After this time after having been asked to shut down, glusterd
(and depending on the killMode setting also its child processes)
are killed by systemd.

The default is set low because GlusterFS (as of 3.10) is known to
not tell its children (like gsyncd) to terminate at all.

*Type:* string

*Default:* `"5s"`

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.tlsSettings` {#opt-services.glusterfs.tlsSettings}

Make the server communicate via TLS.
This means it will only connect to other gluster
servers having certificates signed by the same CA.

Enabling this will create a file `/var/lib/glusterd/secure-access`.
Disabling will delete this file again.

See also: [https://gluster.readthedocs.io/en/latest/Administrator%20Guide/SSL/](https://gluster.readthedocs.io/en/latest/Administrator%20Guide/SSL/)

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.tlsSettings.caCert` {#opt-services.glusterfs.tlsSettings.caCert}

Path certificate authority used to sign the cluster certificates.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.tlsSettings.tlsKeyPath` {#opt-services.glusterfs.tlsSettings.tlsKeyPath}

Path to the private key used for TLS.

*Type:* string

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.tlsSettings.tlsPem` {#opt-services.glusterfs.tlsSettings.tlsPem}

Path to the certificate used for TLS.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.glusterfs.useRpcbind` {#opt-services.glusterfs.useRpcbind}

Enable use of rpcbind. This is required for Gluster's NFS functionality.

You may want to turn it off to reduce the attack surface for DDoS reflection attacks.

See [https://davelozier.com/glusterfs-and-rpcbind-portmap-ddos-reflection-attacks/](https://davelozier.com/glusterfs-and-rpcbind-portmap-ddos-reflection-attacks/)
and [https://bugzilla.redhat.com/show\_bug.cgi?id=1426842](https://bugzilla.redhat.com/show_bug.cgi?id=1426842) for details.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/glusterfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/glusterfs.nix)

## `services.gmediarender.audioDevice` {#opt-services.gmediarender.audioDevice}

The audio device to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/gmediarender.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gmediarender.nix)

## `services.gmediarender.audioSink` {#opt-services.gmediarender.audioSink}

The audio sink to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/gmediarender.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gmediarender.nix)

## `services.gmediarender.enable` {#opt-services.gmediarender.enable}

Whether to enable the gmediarender DLNA renderer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/gmediarender.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gmediarender.nix)

## `services.gmediarender.friendlyName` {#opt-services.gmediarender.friendlyName}

A "friendly name" for identifying the endpoint.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/gmediarender.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gmediarender.nix)

## `services.gmediarender.initialVolume` {#opt-services.gmediarender.initialVolume}

A default volume attenuation (in dB) for the endpoint.

*Type:* null or signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/audio/gmediarender.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gmediarender.nix)

## `services.gmediarender.package` {#opt-services.gmediarender.package}

The gmediarender package to use.

*Type:* package

*Default:* `pkgs.gmrender-resurrect`

*Declared by:* [`nixos/modules/services/audio/gmediarender.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gmediarender.nix)

## `services.gmediarender.port` {#opt-services.gmediarender.port}

Port that will be used to accept client connections.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/gmediarender.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gmediarender.nix)

## `services.gmediarender.uuid` {#opt-services.gmediarender.uuid}

A UUID for uniquely identifying the endpoint.  If you have
multiple renderers on your network, you MUST set this.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/gmediarender.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gmediarender.nix)

## `services.gnome.at-spi2-core.enable` {#opt-services.gnome.at-spi2-core.enable}

Whether to enable at-spi2-core, a service for the Assistive Technologies
available on the GNOME platform.

Enable this if you get the error or warning
`The name org.a11y.Bus was not provided by any .service files`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/gnome/at-spi2-core.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/at-spi2-core.nix)

## `services.gnome.core-apps.enable` {#opt-services.gnome.core-apps.enable}

Whether to enable GNOME core apps.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.gnome.core-developer-tools.enable` {#opt-services.gnome.core-developer-tools.enable}

Whether to enable GNOME core developer tools.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.gnome.core-os-services.enable` {#opt-services.gnome.core-os-services.enable}

Whether to enable essential services for GNOME3.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.gnome.core-shell.enable` {#opt-services.gnome.core-shell.enable}

Whether to enable GNOME Shell services.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.gnome.evolution-data-server.enable` {#opt-services.gnome.evolution-data-server.enable}

Whether to enable Evolution Data Server, a collection of services for storing addressbooks and calendars.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/evolution-data-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/evolution-data-server.nix)

## `services.gnome.evolution-data-server.plugins` {#opt-services.gnome.evolution-data-server.plugins}

Plugins for Evolution Data Server.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/desktops/gnome/evolution-data-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/evolution-data-server.nix)

## `services.gnome.games.enable` {#opt-services.gnome.games.enable}

Whether to enable GNOME games.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `services.gnome.gcr-ssh-agent.enable` {#opt-services.gnome.gcr-ssh-agent.enable}

Whether to enable GCR SSH agent.

*Type:* boolean

*Default:* `config.services.gnome.gnome-keyring.enable`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/gcr-ssh-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gcr-ssh-agent.nix)

## `services.gnome.gcr-ssh-agent.package` {#opt-services.gnome.gcr-ssh-agent.package}

The GCR package to use.

*Type:* package

*Default:* `pkgs.gcr_4`

*Declared by:* [`nixos/modules/services/desktops/gnome/gcr-ssh-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gcr-ssh-agent.nix)

## `services.gnome.glib-networking.enable` {#opt-services.gnome.glib-networking.enable}

Whether to enable network extensions for GLib.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/glib-networking.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/glib-networking.nix)

## `services.gnome.gnome-browser-connector.enable` {#opt-services.gnome.gnome-browser-connector.enable}

Whether to enable native host connector for the GNOME Shell browser extension, a DBus service
allowing to install GNOME Shell extensions from a web browser
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/gnome-browser-connector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gnome-browser-connector.nix)

## `services.gnome.gnome-initial-setup.enable` {#opt-services.gnome.gnome-initial-setup.enable}

Whether to enable GNOME Initial Setup, a Simple, easy, and safe way to prepare a new system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/gnome-initial-setup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gnome-initial-setup.nix)

## `services.gnome.gnome-keyring.enable` {#opt-services.gnome.gnome-keyring.enable}

Whether to enable GNOME Keyring daemon, a service designed to
take care of the user's security credentials,
such as user names and passwords
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/gnome-keyring.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gnome-keyring.nix)

## `services.gnome.gnome-online-accounts.enable` {#opt-services.gnome.gnome-online-accounts.enable}

Whether to enable GNOME Online Accounts daemon, a service that provides
a single sign-on framework for the GNOME desktop.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/gnome/gnome-online-accounts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gnome-online-accounts.nix)

## `services.gnome.gnome-remote-desktop.enable` {#opt-services.gnome.gnome-remote-desktop.enable}

Whether to enable Remote Desktop support using Pipewire.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/gnome-remote-desktop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gnome-remote-desktop.nix)

## `services.gnome.gnome-settings-daemon.enable` {#opt-services.gnome.gnome-settings-daemon.enable}

Whether to enable GNOME Settings Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/gnome-settings-daemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gnome-settings-daemon.nix)

## `services.gnome.gnome-software.enable` {#opt-services.gnome.gnome-software.enable}

Whether to enable GNOME Software, package manager for GNOME.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/gnome-software.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gnome-software.nix)

## `services.gnome.gnome-user-share.enable` {#opt-services.gnome.gnome-user-share.enable}

Whether to enable GNOME User Share, a user-level file sharing service for GNOME.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gnome/gnome-user-share.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/gnome-user-share.nix)

## `services.gnome.localsearch.enable` {#opt-services.gnome.localsearch.enable}

Whether to enable LocalSearch, indexing services for TinySPARQL
search engine and metadata storage system.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/gnome/localsearch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/localsearch.nix)

## `services.gnome.rygel.enable` {#opt-services.gnome.rygel.enable}

Whether to enable Rygel UPnP Mediaserver.

You will need to also allow UPnP connections in firewall, see the following [comment](https://github.com/NixOS/nixpkgs/pull/45045#issuecomment-416030795).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/gnome/rygel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/rygel.nix)

## `services.gnome.rygel.package` {#opt-services.gnome.rygel.package}

The rygel package to use.

*Type:* package

*Default:* `pkgs.rygel`

*Declared by:* [`nixos/modules/services/desktops/gnome/rygel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/rygel.nix)

## `services.gnome.sushi.enable` {#opt-services.gnome.sushi.enable}

Whether to enable Sushi, a quick previewer for nautilus.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/gnome/sushi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/sushi.nix)

## `services.gnome.tinysparql.enable` {#opt-services.gnome.tinysparql.enable}

Whether to enable TinySPARQL services, a search engine,
search tool and metadata storage system.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/gnome/tinysparql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gnome/tinysparql.nix)

## `services.gns3-server.auth.enable` {#opt-services.gns3-server.auth.enable}

Whether to enable password based HTTP authentication to access the GNS3 Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.auth.passwordFile` {#opt-services.gns3-server.auth.passwordFile}

A file containing the password to access the GNS3 Server.

::: warning
This should be a string, not a nix path, since nix paths
are copied into the world-readable nix store.
:::

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/gns3-server-password"`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.auth.user` {#opt-services.gns3-server.auth.user}

Username used to access the GNS3 Server.

*Type:* null or string

*Default:* `null`

*Example:* `"gns3"`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.dynamips.enable` {#opt-services.gns3-server.dynamips.enable}

Whether to enable Dynamips support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.dynamips.package` {#opt-services.gns3-server.dynamips.package}

The dynamips package to use.

*Type:* package

*Default:* `pkgs.dynamips`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.enable` {#opt-services.gns3-server.enable}

Whether to enable GNS3 Server daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.log.debug` {#opt-services.gns3-server.log.debug}

Whether to enable debug logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.log.file` {#opt-services.gns3-server.log.file}

Path of the file GNS3 Server should log to.

*Type:* null or absolute path

*Default:* `"/var/log/gns3/server.log"`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.package` {#opt-services.gns3-server.package}

The gns3-server package to use.

*Type:* package

*Default:* `pkgs.gns3-server`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.settings` {#opt-services.gns3-server.settings}

The global options in `config` file in ini format.

Refer to [https://docs.gns3.com/docs/using-gns3/administration/gns3-server-configuration-file/](https://docs.gns3.com/docs/using-gns3/administration/gns3-server-configuration-file/)
for all available options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  host = "127.0.0.1";
  port = 3080;
}
```

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.ssl.certFile` {#opt-services.gns3-server.ssl.certFile}

Path to the SSL certificate file. This certificate will
be offered to, and may be verified by, clients.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/gns3/ssl/server.pem"`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.ssl.enable` {#opt-services.gns3-server.ssl.enable}

Whether to enable SSL encryption.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.ssl.keyFile` {#opt-services.gns3-server.ssl.keyFile}

Private key file for the certificate.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/gns3/ssl/server.key"`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.ubridge.enable` {#opt-services.gns3-server.ubridge.enable}

Whether to enable uBridge support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.ubridge.package` {#opt-services.gns3-server.ubridge.package}

The ubridge package to use.

*Type:* package

*Default:* `pkgs.ubridge`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.vpcs.enable` {#opt-services.gns3-server.vpcs.enable}

Whether to enable VPCS support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gns3-server.vpcs.package` {#opt-services.gns3-server.vpcs.package}

The vpcs package to use.

*Type:* package

*Default:* `pkgs.vpcs`

*Declared by:* [`nixos/modules/services/networking/gns3-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gns3-server.nix)

## `services.gnunet.enable` {#opt-services.gnunet.enable}

Whether to run the GNUnet daemon.  GNUnet is GNU's anonymous
peer-to-peer communication and file sharing framework.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.gnunet.extraOptions` {#opt-services.gnunet.extraOptions}

Additional options that will be copied verbatim in `gnunet.conf`.
See `gnunet.conf(5)` for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.gnunet.fileSharing.quota` {#opt-services.gnunet.fileSharing.quota}

Maximum file system usage (in MiB) for file sharing.

*Type:* signed integer

*Default:* `1024`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.gnunet.load.hardNetUpBandwidth` {#opt-services.gnunet.load.hardNetUpBandwidth}

Hard bandwidth limit (in bits per second) when uploading
data.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.gnunet.load.maxNetDownBandwidth` {#opt-services.gnunet.load.maxNetDownBandwidth}

Maximum bandwidth usage (in bits per second) for GNUnet
when downloading data.

*Type:* signed integer

*Default:* `50000`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.gnunet.load.maxNetUpBandwidth` {#opt-services.gnunet.load.maxNetUpBandwidth}

Maximum bandwidth usage (in bits per second) for GNUnet
when downloading data.

*Type:* signed integer

*Default:* `50000`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.gnunet.package` {#opt-services.gnunet.package}

The gnunet package to use.

*Type:* package

*Default:* `pkgs.gnunet`

*Example:* `gnunet_git`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.gnunet.tcp.port` {#opt-services.gnunet.tcp.port}

The TCP port for use by GNUnet.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2086`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.gnunet.udp.port` {#opt-services.gnunet.udp.port}

The UDP port for use by GNUnet.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2086`

*Declared by:* [`nixos/modules/services/networking/gnunet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gnunet.nix)

## `services.go-autoconfig.enable` {#opt-services.go-autoconfig.enable}

Whether to enable IMAP/SMTP autodiscover feature for mail clients.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/go-autoconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-autoconfig.nix)

## `services.go-autoconfig.settings` {#opt-services.go-autoconfig.settings}

Configuration for go-autoconfig. See
[https://github.com/L11R/go-autoconfig/blob/master/config.yml](https://github.com/L11R/go-autoconfig/blob/master/config.yml)
for more information.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  service_addr = ":1323";
  domain = "autoconfig.example.org";
  imap = {
    server = "example.org";
    port = 993;
  };
  smtp = {
    server = "example.org";
    port = 465;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/go-autoconfig.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-autoconfig.nix)

## `services.go-camo.enable` {#opt-services.go-camo.enable}

Whether to enable go-camo service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/go-camo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-camo.nix)

## `services.go-camo.extraOptions` {#opt-services.go-camo.extraOptions}

Extra options passed to the go-camo command.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/go-camo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-camo.nix)

## `services.go-camo.keyFile` {#opt-services.go-camo.keyFile}

A file containing the HMAC key to use for signing URLs.
The file can contain any string. Can be generated using "openssl rand -base64 18 \> the\_file".

*Type:* absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/go-camo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-camo.nix)

## `services.go-camo.listen` {#opt-services.go-camo.listen}

Address:Port to bind to for HTTP (default: 0.0.0.0:8080).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/go-camo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-camo.nix)

## `services.go-camo.sslCert` {#opt-services.go-camo.sslCert}

Path to TLS certificate.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/go-camo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-camo.nix)

## `services.go-camo.sslKey` {#opt-services.go-camo.sslKey}

Path to TLS private key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/go-camo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-camo.nix)

## `services.go-camo.sslListen` {#opt-services.go-camo.sslListen}

Address:Port to bind to for HTTPS.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/go-camo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-camo.nix)

## `services.go-csp-collector.enable` {#opt-services.go-csp-collector.enable}

Whether to enable go-csp-collector, a content security policy violation collector.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/go-csp-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/go-csp-collector.nix)

## `services.go-csp-collector.package` {#opt-services.go-csp-collector.package}

The go-csp-collector package to use.

*Type:* package

*Default:* `pkgs.go-csp-collector`

*Declared by:* [`nixos/modules/services/monitoring/go-csp-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/go-csp-collector.nix)

## `services.go-csp-collector.settings` {#opt-services.go-csp-collector.settings}

Settings for go-csp-collector. See
[https://github.com/jacobbednarz/go-csp-collector](https://github.com/jacobbednarz/go-csp-collector) for supported options.

*Type:* open submodule of attribute set of (boolean or absolute path or string)

*Default:* `{ }`

*Example:*

``` nix
{
  debug = true;
  health-check-path = "/health";
}
```

*Declared by:* [`nixos/modules/services/monitoring/go-csp-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/go-csp-collector.nix)

## `services.go-csp-collector.settings.output-format` {#opt-services.go-csp-collector.settings.output-format}

Define how the violation reports are formatted for output.

*Type:* one of "text", "json"

*Default:* `"text"`

*Example:* `"text"`

*Declared by:* [`nixos/modules/services/monitoring/go-csp-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/go-csp-collector.nix)

## `services.go-csp-collector.settings.port` {#opt-services.go-csp-collector.settings.port}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `8080`

*Declared by:* [`nixos/modules/services/monitoring/go-csp-collector.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/go-csp-collector.nix)

## `services.go-httpbin.enable` {#opt-services.go-httpbin.enable}

Whether to enable go-httpbin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/go-httpbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/go-httpbin.nix)

## `services.go-httpbin.package` {#opt-services.go-httpbin.package}

The go-httpbin package to use.

*Type:* package

*Default:* `pkgs.go-httpbin`

*Declared by:* [`nixos/modules/services/web-apps/go-httpbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/go-httpbin.nix)

## `services.go-httpbin.settings` {#opt-services.go-httpbin.settings}

Configuration of go-httpbin.
See [https://github.com/mccutchen/go-httpbin#configuration](https://github.com/mccutchen/go-httpbin#configuration) for a list of options.

*Type:* open submodule of attribute set of (string or signed integer or boolean)

*Example:*

``` nix
{
  HOST = "0.0.0.0";
  PORT = 8080;
}
```

*Declared by:* [`nixos/modules/services/web-apps/go-httpbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/go-httpbin.nix)

## `services.go-httpbin.settings.HOST` {#opt-services.go-httpbin.settings.HOST}

The host to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/go-httpbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/go-httpbin.nix)

## `services.go-httpbin.settings.PORT` {#opt-services.go-httpbin.settings.PORT}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/go-httpbin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/go-httpbin.nix)

## `services.go-shadowsocks2.server.enable` {#opt-services.go-shadowsocks2.server.enable}

Whether to enable go-shadowsocks2 server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/go-shadowsocks2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-shadowsocks2.nix)

## `services.go-shadowsocks2.server.listenAddress` {#opt-services.go-shadowsocks2.server.listenAddress}

Server listen address or URL

*Type:* string

*Example:* `"ss://AEAD_CHACHA20_POLY1305:your-password@:8488"`

*Declared by:* [`nixos/modules/services/networking/go-shadowsocks2.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/go-shadowsocks2.nix)

## `services.go2rtc.enable` {#opt-services.go2rtc.enable}

Whether to enable go2rtc streaming server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/go2rtc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/go2rtc/default.nix)

## `services.go2rtc.package` {#opt-services.go2rtc.package}

The go2rtc package to use.

*Type:* package

*Default:* `pkgs.go2rtc`

*Declared by:* [`nixos/modules/services/video/go2rtc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/go2rtc/default.nix)

## `services.go2rtc.settings` {#opt-services.go2rtc.settings}

go2rtc configuration as a Nix attribute set.

See the [wiki](https://github.com/AlexxIT/go2rtc/blob/master/internal/app/README.md) for possible configuration options.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/video/go2rtc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/go2rtc/default.nix)

## `services.go2rtc.settings.api.listen` {#opt-services.go2rtc.settings.api.listen}

API listen address, conforming to a Go address string.

*Type:* string

*Default:* `":1984"`

*Example:* `"127.0.0.1:1984"`

*Declared by:* [`nixos/modules/services/video/go2rtc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/go2rtc/default.nix)

## `services.go2rtc.settings.ffmpeg.bin` {#opt-services.go2rtc.settings.ffmpeg.bin}

The ffmpeg package to use for transcoding.

*Type:* absolute path

*Default:* `lib.getExe pkgs.ffmpeg-headless`

*Declared by:* [`nixos/modules/services/video/go2rtc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/go2rtc/default.nix)

## `services.go2rtc.settings.streams` {#opt-services.go2rtc.settings.streams}

Stream source configuration. Multiple source types are supported.

Check the [configuration reference](https://github.com/AlexxIT/go2rtc/blob/v1.9.15/README.md#module-streams) for possible options.

*Type:* attribute set of (string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  cam1 = "onvif://admin:password@192.168.1.123:2020";
  cam2 = "tcp://192.168.1.123:12345";
}
```

*Declared by:* [`nixos/modules/services/video/go2rtc/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/go2rtc/default.nix)

## `services.goatcounter.address` {#opt-services.goatcounter.address}

Web interface address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/goatcounter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goatcounter.nix)

## `services.goatcounter.enable` {#opt-services.goatcounter.enable}

Whether to enable goatcounter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/goatcounter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goatcounter.nix)

## `services.goatcounter.extraArgs` {#opt-services.goatcounter.extraArgs}

List of extra arguments to be passed to goatcounter cli.
See `goatcounter help serve` for more information.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/goatcounter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goatcounter.nix)

## `services.goatcounter.package` {#opt-services.goatcounter.package}

The goatcounter package to use.

*Type:* package

*Default:* `pkgs.goatcounter`

*Declared by:* [`nixos/modules/services/web-apps/goatcounter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goatcounter.nix)

## `services.goatcounter.port` {#opt-services.goatcounter.port}

Web interface port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8081`

*Declared by:* [`nixos/modules/services/web-apps/goatcounter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goatcounter.nix)

## `services.goatcounter.proxy` {#opt-services.goatcounter.proxy}

Whether Goatcounter service is running behind a reverse proxy. Will listen for HTTPS if `false`.
Refer to [documentation](https://github.com/arp242/goatcounter?tab=readme-ov-file#running) for more details.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/goatcounter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goatcounter.nix)

## `services.gobgpd.enable` {#opt-services.gobgpd.enable}

Whether to enable GoBGP Routing Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gobgpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gobgpd.nix)

## `services.gobgpd.settings` {#opt-services.gobgpd.settings}

GoBGP configuration. Refer to
[https://github.com/osrg/gobgp#documentation](https://github.com/osrg/gobgp#documentation)
for details on supported values.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  global = {
    config = {
      as = 64512;
      router-id = "192.168.255.1";
    };
  };
  neighbors = [
    {
      config = {
        neighbor-address = "10.0.255.1";
        peer-as = 65001;
      };
    }
    {
      config = {
        neighbor-address = "10.0.255.2";
        peer-as = 65002;
      };
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/gobgpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gobgpd.nix)

## `services.gocd-agent.agentConfig` {#opt-services.gocd-agent.agentConfig}

Agent registration configuration.

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  agent.auto.register.resources=ant,java
  agent.auto.register.environments=QA,Performance
  agent.auto.register.hostname=Agent01
''
```

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.enable` {#opt-services.gocd-agent.enable}

Whether to enable gocd-agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.environment` {#opt-services.gocd-agent.environment}

Additional environment variables to be passed to the Go.CD agent process.
As a base environment, Go.CD agent receives NIX\_PATH from
[`environment.sessionVariables`](../../options/environment/index.md#opt-environment.sessionVariables), NIX\_REMOTE is set to
"daemon".

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.extraGroups` {#opt-services.gocd-agent.extraGroups}

List of extra groups that the "gocd-agent" user should be a part of.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "wheel"
  "docker"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.extraOptions` {#opt-services.gocd-agent.extraOptions}

Specifies additional command line arguments to pass to Go.CD agent
java process.  Example contains debug and gcLog arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-X debug"
  "-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5006"
  "-verbose:gc"
  "-Xloggc:go-agent-gc.log"
  "-XX:+PrintGCTimeStamps"
  "-XX:+PrintTenuringDistribution"
  "-XX:+PrintGCDetails"
  "-XX:+PrintGC"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.goServer` {#opt-services.gocd-agent.goServer}

URL of the GoCD Server to attach the Go.CD Agent to.

*Type:* string

*Default:* `"https://127.0.0.1:8154/go"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.group` {#opt-services.gocd-agent.group}

If the default user "gocd-agent" is configured then this is the primary
group of that user.

*Type:* string

*Default:* `"gocd-agent"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.initialJavaHeapSize` {#opt-services.gocd-agent.initialJavaHeapSize}

Specifies the initial java heap memory size for the Go.CD agent java process.

*Type:* string

*Default:* `"128m"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.maxJavaHeapMemory` {#opt-services.gocd-agent.maxJavaHeapMemory}

Specifies the java maximum heap memory size for the Go.CD agent java process.

*Type:* string

*Default:* `"256m"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.packages` {#opt-services.gocd-agent.packages}

Packages to add to PATH for the Go.CD agent process.

*Type:* list of package

*Default:* `[ pkgs.stdenv pkgs.jre pkgs.git config.programs.ssh.package pkgs.nix ]`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.startupOptions` {#opt-services.gocd-agent.startupOptions}

Specifies startup command line arguments to pass to Go.CD agent
java process.

*Type:* list of string

*Default:*

``` nix
[
  "-Xms${config.services.gocd-agent.initialJavaHeapSize}"
  "-Xmx${config.services.gocd-agent.maxJavaHeapMemory}"
  "-Djava.io.tmpdir=/tmp"
  "-Dcruise.console.publish.interval=10"
  "-Djava.security.egd=file:/dev/./urandom"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.user` {#opt-services.gocd-agent.user}

User the Go.CD agent should execute under.

*Type:* string

*Default:* `"gocd-agent"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-agent.workDir` {#opt-services.gocd-agent.workDir}

Specifies the working directory in which the Go.CD agent java archive resides.

*Type:* string

*Default:* `"/var/lib/go-agent"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-agent/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-agent/default.nix)

## `services.gocd-server.enable` {#opt-services.gocd-server.enable}

Whether to enable gocd-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.environment` {#opt-services.gocd-server.environment}

Additional environment variables to be passed to the gocd-server process.
As a base environment, gocd-server receives NIX\_PATH from
[`environment.sessionVariables`](../../options/environment/index.md#opt-environment.sessionVariables), NIX\_REMOTE is set to
"daemon".

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.extraGroups` {#opt-services.gocd-server.extraGroups}

List of extra groups that the "gocd-server" user should be a part of.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "wheel"
  "docker"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.extraOptions` {#opt-services.gocd-server.extraOptions}

Specifies additional command line arguments to pass to Go.CD server's
java process.  Example contains debug and gcLog arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-X debug"
  "-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
  "-verbose:gc"
  "-Xloggc:go-server-gc.log"
  "-XX:+PrintGCTimeStamps"
  "-XX:+PrintTenuringDistribution"
  "-XX:+PrintGCDetails"
  "-XX:+PrintGC"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.group` {#opt-services.gocd-server.group}

If the default user "gocd-server" is configured then this is the primary group of that user.

*Type:* string

*Default:* `"gocd-server"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.initialJavaHeapSize` {#opt-services.gocd-server.initialJavaHeapSize}

Specifies the initial java heap memory size for the Go.CD server's java process.

*Type:* string

*Default:* `"512m"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.listenAddress` {#opt-services.gocd-server.listenAddress}

Specifies the bind address on which the Go.CD server HTTP interface listens.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.maxJavaHeapMemory` {#opt-services.gocd-server.maxJavaHeapMemory}

Specifies the java maximum heap memory size for the Go.CD server's java process.

*Type:* string

*Default:* `"1024m"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.packages` {#opt-services.gocd-server.packages}

Packages to add to PATH for the Go.CD server's process.

*Type:* list of package

*Default:* `[ pkgs.stdenv pkgs.jre pkgs.git config.programs.ssh.package pkgs.nix ]`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.port` {#opt-services.gocd-server.port}

Specifies port number on which the Go.CD server HTTP interface listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8153`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.sslPort` {#opt-services.gocd-server.sslPort}

Specifies port number on which the Go.CD server HTTPS interface listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8154`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.startupOptions` {#opt-services.gocd-server.startupOptions}

Specifies startup command line arguments to pass to Go.CD server
java process.

*Type:* list of string

*Default:*

``` nix
[
  "-Xms${config.services.gocd-server.initialJavaHeapSize}"
  "-Xmx${config.services.gocd-server.maxJavaHeapMemory}"
  "-Dcruise.listen.host=${config.services.gocd-server.listenAddress}"
  "-Duser.language=en"
  "-Djruby.rack.request.size.threshold.bytes=30000000"
  "-Duser.country=US"
  "-Dcruise.config.dir=${config.services.gocd-server.workDir}/conf"
  "-Dcruise.config.file=${config.services.gocd-server.workDir}/conf/cruise-config.xml"
  "-Dcruise.server.port=${toString config.services.gocd-server.port}"
  "-Dcruise.server.ssl.port=${toString config.services.gocd-server.sslPort}"
  "--add-opens=java.base/java.lang=ALL-UNNAMED"
  "--add-opens=java.base/java.util=ALL-UNNAMED"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.user` {#opt-services.gocd-server.user}

User the Go.CD server should execute under.

*Type:* string

*Default:* `"gocd-server"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocd-server.workDir` {#opt-services.gocd-server.workDir}

Specifies the working directory in which the Go.CD server java archive resides.

*Type:* string

*Default:* `"/var/lib/go-server"`

*Declared by:* [`nixos/modules/services/continuous-integration/gocd-server/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gocd-server/default.nix)

## `services.gocron.enable` {#opt-services.gocron.enable}

Whether to enable gocron, a task scheduler.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.extraGroups` {#opt-services.gocron.extraGroups}

Additional groups for the systemd service.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "backup"
]
```

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.group` {#opt-services.gocron.group}

Unix Group to run the server under

*Type:* string

*Default:* `"gocron"`

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.hardening` {#opt-services.gocron.hardening}

Configuration for hardening the systemd service.

*Type:* submodule

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.hardening.ProtectHome` {#opt-services.gocron.hardening.ProtectHome}

Whether to make the home directories inaccessible to the service.
See <link xlink:href="https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#ProtectHome="/> for more details.

*Type:* string or boolean

*Default:* `true`

*Example:* `"read-only"`

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.hardening.ProtectSystem` {#opt-services.gocron.hardening.ProtectSystem}

Whether to make several system directories inaccessible to the service.
See <link xlink:href="https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#ProtectSystem="/> for more details.

*Type:* string or boolean

*Default:* `true`

*Example:* `"full"`

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.openFirewall` {#opt-services.gocron.openFirewall}

Whether to open the firewall port to access the web ui.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.package` {#opt-services.gocron.package}

gocron package to use.

*Type:* package

*Default:* `pkgs.gocron`

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.settings` {#opt-services.gocron.settings}

Configuration for gocron, see

<link xlink:href="https://github.com/flohoss/gocron/blob/main/config/config.yaml"/>
for supported settings.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.gocron.user` {#opt-services.gocron.user}

Unix User to run the server under

*Type:* string

*Default:* `"gocron"`

*Declared by:* [`nixos/modules/services/scheduling/gocron.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/scheduling/gocron.nix)

## `services.godns.enable` {#opt-services.godns.enable}

Whether to enable GoDNS service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/godns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/godns.nix)

## `services.godns.loadCredential` {#opt-services.godns.loadCredential}

This can be used to pass secrets to the systemd service without adding
them to the nix store.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "login_token:/path/to/login_token"
]
```

*Declared by:* [`nixos/modules/services/networking/godns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/godns.nix)

## `services.godns.package` {#opt-services.godns.package}

The godns package to use.

*Type:* package

*Default:* `pkgs.godns`

*Declared by:* [`nixos/modules/services/networking/godns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/godns.nix)

## `services.godns.settings` {#opt-services.godns.settings}

Configuration for GoDNS. Refer to the [configuration section](https://github.com/TimothyYe/godns?tab=readme-ov-file#configuration) in the
GoDNS GitHub repository for details.

*Type:* open submodule of (YAML 1.1 value)

*Example:*

``` nix
{
  domains = [
    {
      domain_name = "example.com";
      sub_domains = [
        "foo"
      ];
    }
  ];
  interval = 300;
  ip_type = "IPv6";
  ipv6_urls = [
    "https://api6.ipify.org"
    "https://ip2location.io/ip"
    "https://v6.ipinfo.io/ip"
  ];
  login_token_file = "$CREDENTIALS_DIRECTORY/login_token";
  provider = "Cloudflare";
}
```

*Declared by:* [`nixos/modules/services/networking/godns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/godns.nix)

## `services.goeland.enable` {#opt-services.goeland.enable}

Whether to enable goeland, an alternative to rss2email.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/goeland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/goeland.nix)

## `services.goeland.schedule` {#opt-services.goeland.schedule}

How often to run goeland, in systemd time format.

*Type:* string

*Default:* `"12h"`

*Example:* `"Mon, 00:00:00"`

*Declared by:* [`nixos/modules/services/mail/goeland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/goeland.nix)

## `services.goeland.settings` {#opt-services.goeland.settings}

Configuration of goeland.
See the [example config file](https://github.com/slurdge/goeland/blob/master/cmd/asset/config.default.toml) for the available options.

*Type:* TOML value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/goeland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/goeland.nix)

## `services.goeland.stateDir` {#opt-services.goeland.stateDir}

The data directory for goeland where the database will reside if using the unseen filter.
If left as the default value this directory will automatically be created before the goeland
server starts, otherwise you are responsible for ensuring the directory exists with
appropriate ownership and permissions.

*Type:* absolute path

*Default:* `"/var/lib/goeland"`

*Declared by:* [`nixos/modules/services/mail/goeland.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/goeland.nix)

## `services.gokapi.enable` {#opt-services.gokapi.enable}

Whether to enable Lightweight selfhosted Firefox Send alternative without public upload.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.environment` {#opt-services.gokapi.environment}

Environment variables to be set for the gokapi service. Can use systemd specifiers.
For full list see [https://gokapi.readthedocs.io/en/latest/advanced.html#environment-variables](https://gokapi.readthedocs.io/en/latest/advanced.html#environment-variables).

*Type:* open submodule of attribute set of (string or signed integer)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.environment.GOKAPI_CONFIG_DIR` {#opt-services.gokapi.environment.GOKAPI_CONFIG_DIR}

Sets the directory for the config file.

*Type:* string

*Default:* `"%S/gokapi/config"`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.environment.GOKAPI_CONFIG_FILE` {#opt-services.gokapi.environment.GOKAPI_CONFIG_FILE}

Sets the filename for the config file.

*Type:* string

*Default:* `"config.json"`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.environment.GOKAPI_DATA_DIR` {#opt-services.gokapi.environment.GOKAPI_DATA_DIR}

Sets the directory for the data.

*Type:* string

*Default:* `"%S/gokapi/data"`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.environment.GOKAPI_PORT` {#opt-services.gokapi.environment.GOKAPI_PORT}

Sets the port of the service.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53842`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.mutableSettings` {#opt-services.gokapi.mutableSettings}

Allow changes to the program config made by the program to persist between restarts.
If disabled all required values must be set using nix, and all changes to config format over application updates must be resolved by user.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.package` {#opt-services.gokapi.package}

The gokapi package to use.

*Type:* package

*Default:* `pkgs.gokapi`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.settings` {#opt-services.gokapi.settings}

Configuration settings for the generated config json file.
See [https://gokapi.readthedocs.io/en/latest/advanced.html#config-json](https://gokapi.readthedocs.io/en/latest/advanced.html#config-json) for more information

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gokapi.settingsFile` {#opt-services.gokapi.settingsFile}

Path to config file to parse and append to settings.
Largely useful for loading secrets from a file not in the nix store. Can use systemd specifiers.
See [https://gokapi.readthedocs.io/en/latest/advanced.html#config-json](https://gokapi.readthedocs.io/en/latest/advanced.html#config-json) for more information

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/gokapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gokapi.nix)

## `services.gollum.address` {#opt-services.gollum.address}

IP address on which the web server will listen.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.allowUploads` {#opt-services.gollum.allowUploads}

Enable uploads of external files

*Type:* null or one of "dir", "page"

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.branch` {#opt-services.gollum.branch}

Git branch to serve

*Type:* string

*Default:* `"master"`

*Example:* `"develop"`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.emoji` {#opt-services.gollum.emoji}

Parse and interpret emoji tags

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.enable` {#opt-services.gollum.enable}

Whether to enable Gollum, a git-powered wiki service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.extraConfig` {#opt-services.gollum.extraConfig}

Content of the configuration file

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  wiki_options = {
    show_local_time: true
  }
  
  Precious::App.set(:wiki_options, wiki_options)
''
```

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.group` {#opt-services.gollum.group}

Specifies the owner group of the wiki directory

*Type:* string

*Default:* `"gollum"`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.h1-title` {#opt-services.gollum.h1-title}

Use the first h1 as page title

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.math` {#opt-services.gollum.math}

Enable support for math rendering using KaTeX

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.no-edit` {#opt-services.gollum.no-edit}

Disable editing pages

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.package` {#opt-services.gollum.package}

The gollum package to use.

*Type:* package

*Default:* `pkgs.gollum`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.port` {#opt-services.gollum.port}

Port on which the web server will run.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4567`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.stateDir` {#opt-services.gollum.stateDir}

Specifies the path of the repository directory. If it does not exist, Gollum will create it on startup.

*Type:* absolute path

*Default:* `"/var/lib/gollum"`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.user` {#opt-services.gollum.user}

Specifies the owner of the wiki directory

*Type:* string

*Default:* `"gollum"`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gollum.user-icons` {#opt-services.gollum.user-icons}

Enable specific user icons for history view

*Type:* null or one of "gravatar", "identicon"

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gollum.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gollum.nix)

## `services.gonic.enable` {#opt-services.gonic.enable}

Whether to enable Gonic music server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/gonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gonic.nix)

## `services.gonic.package` {#opt-services.gonic.package}

The gonic package to use.

*Type:* package

*Default:* `pkgs.gonic`

*Declared by:* [`nixos/modules/services/audio/gonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gonic.nix)

## `services.gonic.settings` {#opt-services.gonic.settings}

Configuration for Gonic, see [https://github.com/sentriz/gonic#configuration-options](https://github.com/sentriz/gonic#configuration-options) for supported values.

*Type:* attribute set of (atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:*

``` nix
{
  cache-path = "/var/cache/gonic";
  listen-addr = "127.0.0.1:4747";
  tls-cert = null;
  tls-key = null;
}
```

*Example:*

``` nix
{
  music-path = [
    "/mnt/music"
  ];
  playlists-path = "/mnt/playlists";
  podcast-path = "/mnt/podcasts";
}
```

*Declared by:* [`nixos/modules/services/audio/gonic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/gonic.nix)

## `services.gophernicus.domain` {#opt-services.gophernicus.domain}

A DNS-resolvable domain pointing to this machine or a reverse proxy redirecting here.

*Type:* string

*Example:* `"gopher.example.com"`

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.enable` {#opt-services.gophernicus.enable}

Whether to enable gophernicus, a modern gopher daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.enableDefaultRootIndex` {#opt-services.gophernicus.enableDefaultRootIndex}

Whether to enable the example gophermap shipped with gophernicus as the default root index.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.enableUserDirs` {#opt-services.gophernicus.enableUserDirs}

Whether to host content from `~/public_gopher` in user home directories.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.extraArgs` {#opt-services.gophernicus.extraArgs}

Extra commandline arguments to pass to `gophernicus`.

See `gophernicus(8)` for available arguments.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  np = true;
  nx = true;
  u = "gopher_stuff";
  w = 80;
}
```

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.filters` {#opt-services.gophernicus.filters}

Executables that should be registered as preprocessing filters.

*Type:* attribute set of path in the Nix store

*Default:* `{ }`

*Example:*

``` nix
{
  # Files with the `.txt` extension should be preprocessed with `my-filter`
  txt = pkgs.writeShellScript "my-filter" ''
    echo "To whom it may concern..."
    # First argument is the path of the file being filtered
    cat "$1"
    echo "Best regards, server owner"
  '';
  # Files with the `.php` extension should automatically be rendered by php
  php = "${pkgs.php}/bin/php";
}
```

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.listenStreams` {#opt-services.gophernicus.listenStreams}

Which sockets to bind to.

See `systemd.sockets.«name».listenStreams`.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1:70"
]
```

*Example:*

``` nix
[
  "/run/gophernicus/gophernicus.sock"
]
```

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.package` {#opt-services.gophernicus.package}

The gophernicus package to use.

*Type:* package

*Default:* `pkgs.gophernicus`

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.path` {#opt-services.gophernicus.path}

Packages with content in `/bin` that should be available to gophernicus.

This will be provided as `PATH` to both gophermaps, cgi scripts and filters.

*Type:* list of package

*Default:*

``` nix
with pkgs; [
  coreutils
  gnused
  whoami
  bash
  php
  perl
]
```

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.gophernicus.rootDir` {#opt-services.gophernicus.rootDir}

The directory which contains the root of your gopher content.

Note that you might want to disable [`services.gophernicus.enableDefaultRootIndex`](#opt-services.gophernicus.enableDefaultRootIndex) if you are
modifying the contents of your root directory.

*Type:* absolute path

*Default:* `"/var/lib/gophernicus/gopher"`

*Example:*

``` nix
pkgs.symlinkJoin {
  name = "gophernicus-root-dir";
  paths = [
    (pkgs.writeTextDir "gophermap" ''
      iHello!

      1Misc\tmisc
    '')
    (pkgs.writeTextDir "misc/info.txt" ''
      World
    '')
  ];
}
```

*Declared by:* [`nixos/modules/services/misc/gophernicus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gophernicus.nix)

## `services.goss.enable` {#opt-services.goss.enable}

Whether to enable Goss daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/goss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/goss.nix)

## `services.goss.environment` {#opt-services.goss.environment}

Environment variables to set for the goss service.

See [https://github.com/goss-org/goss/blob/master/docs/manual.md](https://github.com/goss-org/goss/blob/master/docs/manual.md)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  GOSS_FMT = "json";
  GOSS_LISTEN = ":8080";
  GOSS_LOGLEVEL = "FATAL";
}
```

*Declared by:* [`nixos/modules/services/monitoring/goss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/goss.nix)

## `services.goss.package` {#opt-services.goss.package}

The goss package to use.

*Type:* package

*Default:* `pkgs.goss`

*Declared by:* [`nixos/modules/services/monitoring/goss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/goss.nix)

## `services.goss.settings` {#opt-services.goss.settings}

The global options in `config` file in yaml format.

Refer to [https://github.com/goss-org/goss/blob/master/docs/goss-json-schema.yaml](https://github.com/goss-org/goss/blob/master/docs/goss-json-schema.yaml) for schema.

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Example:*

``` nix
{
  addr = {
    "tcp://localhost:8080" = {
      local-address = "127.0.0.1";
      reachable = true;
    };
  };
  service = {
    goss = {
      enabled = true;
      running = true;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/goss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/goss.nix)

## `services.gotenberg.bindIP` {#opt-services.gotenberg.bindIP}

Port the API listener should bind to. Set to 0.0.0.0 to listen on all available IPs.

*Type:* null or string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.bodyLimit` {#opt-services.gotenberg.bodyLimit}

Sets the max limit for `multipart/form-data` requests. Accepts values like '5M', '20G', etc.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.chromium.autoStart` {#opt-services.gotenberg.chromium.autoStart}

Automatically start Chromium when Gotenberg starts. If false, Chromium will start on the first conversion request that uses it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.chromium.disableJavascript` {#opt-services.gotenberg.chromium.disableJavascript}

Disable Javascript execution.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.chromium.disableRoutes` {#opt-services.gotenberg.chromium.disableRoutes}

Disable all routes allowing Chromium-based conversion.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.chromium.maxQueueSize` {#opt-services.gotenberg.chromium.maxQueueSize}

Maximum queue size for chromium-based conversions. Setting to 0 disables the limit.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.chromium.package` {#opt-services.gotenberg.chromium.package}

The chromium package to use.

*Type:* package

*Default:* `pkgs.chromium`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.downloadFrom.allowList` {#opt-services.gotenberg.downloadFrom.allowList}

Restrict URLs accepted in the `downloadFrom` API field. Accepts a regular expression.
Matching URLs bypass the private and public IP checks.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.downloadFrom.denyList` {#opt-services.gotenberg.downloadFrom.denyList}

Deny accepting URLs from these domains in the `downloadFrom` API field. Accepts a regular expression.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.downloadFrom.denyPrivateIPs` {#opt-services.gotenberg.downloadFrom.denyPrivateIPs}

Reject `downloadFrom` URLs resolving to private or otherwise non-public IP addresses.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.downloadFrom.denyPublicIPs` {#opt-services.gotenberg.downloadFrom.denyPublicIPs}

Reject `downloadFrom` URLs resolving to public IP addresses.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.downloadFrom.disable` {#opt-services.gotenberg.downloadFrom.disable}

Whether to disable the ability to download files for conversion from outside sources.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.downloadFrom.maxRetries` {#opt-services.gotenberg.downloadFrom.maxRetries}

The maximum amount of times to retry downloading a file specified with `downloadFrom`.

*Type:* unsigned integer, meaning \>=0

*Default:* `4`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.enable` {#opt-services.gotenberg.enable}

Whether to enable Gotenberg, a stateless API for PDF files.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.enableBasicAuth` {#opt-services.gotenberg.enableBasicAuth}

HTTP Basic Authentication.

If you set this, be sure to set `GOTENBERG_API_BASIC_AUTH_USERNAME`and `GOTENBERG_API_BASIC_AUTH_PASSWORD`
in your `services.gotenberg.environmentFile` file.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.environmentFile` {#opt-services.gotenberg.environmentFile}

Environment file to load extra environment variables from.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.extraArgs` {#opt-services.gotenberg.extraArgs}

Any extra command-line flags to pass to the Gotenberg service.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.extraFontPackages` {#opt-services.gotenberg.extraFontPackages}

Extra fonts to make available.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.libreoffice.autoStart` {#opt-services.gotenberg.libreoffice.autoStart}

Automatically start LibreOffice when Gotenberg starts. If false, LibreOffice will start on the first conversion request that uses it.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.libreoffice.disableRoutes` {#opt-services.gotenberg.libreoffice.disableRoutes}

Disable all routes allowing LibreOffice-based conversion.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.libreoffice.maxQueueSize` {#opt-services.gotenberg.libreoffice.maxQueueSize}

Maximum queue size for LibreOffice-based conversions. Setting to 0 disables the limit.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.libreoffice.package` {#opt-services.gotenberg.libreoffice.package}

The libreoffice-unwrapped package to use.

*Type:* package

*Default:* `pkgs.libreoffice-unwrapped`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.libreoffice.restartAfter` {#opt-services.gotenberg.libreoffice.restartAfter}

Restart LibreOffice after this many conversions. Setting to 0 disables this feature.

*Type:* unsigned integer, meaning \>=0

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.logLevel` {#opt-services.gotenberg.logLevel}

The logging level for Gotenberg.

*Type:* one of "error", "warn", "info", "debug"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.package` {#opt-services.gotenberg.package}

The gotenberg package to use.

*Type:* package

*Default:* `pkgs.gotenberg`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.pdf.disableRoutes` {#opt-services.gotenberg.pdf.disableRoutes}

Disable PDF processing routes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.port` {#opt-services.gotenberg.port}

Port on which the API should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.rootPath` {#opt-services.gotenberg.rootPath}

Root path for the Gotenberg API.

*Type:* string

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotenberg.timeout` {#opt-services.gotenberg.timeout}

Timeout for API requests.

*Type:* null or string

*Default:* `"30s"`

*Declared by:* [`nixos/modules/services/misc/gotenberg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gotenberg.nix)

## `services.gotify.enable` {#opt-services.gotify.enable}

Whether to enable Gotify webserver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gotify-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotify-server.nix)

## `services.gotify.environment` {#opt-services.gotify.environment}

Config environment variables for the gotify-server.
See [https://gotify.net/docs/config](https://gotify.net/docs/config) for more details.

*Type:* attribute set of (string or signed integer)

*Default:* `{ }`

*Example:*

``` nix
{
  GOTIFY_DATABASE_DIALECT = "sqlite3";
  GOTIFY_SERVER_PORT = 8080;
}
```

*Declared by:* [`nixos/modules/services/web-apps/gotify-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotify-server.nix)

## `services.gotify.environmentFiles` {#opt-services.gotify.environmentFiles}

Files containing additional config environment variables for gotify-server.
Secrets should be set in environmentFiles instead of environment.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/gotify-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotify-server.nix)

## `services.gotify.package` {#opt-services.gotify.package}

The gotify-server package to use.

*Type:* package

*Default:* `pkgs.gotify-server`

*Declared by:* [`nixos/modules/services/web-apps/gotify-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotify-server.nix)

## `services.gotify.stateDirectoryName` {#opt-services.gotify.stateDirectoryName}

The name of the directory below `/var/lib` where
gotify stores its runtime data.

*Type:* string

*Default:* `"gotify-server"`

*Declared by:* [`nixos/modules/services/web-apps/gotify-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotify-server.nix)

## `services.gotosocial.enable` {#opt-services.gotosocial.enable}

Whether to enable ActivityPub social network server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/gotosocial.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotosocial.nix)

## `services.gotosocial.environmentFile` {#opt-services.gotosocial.environmentFile}

File path containing environment variables for configuring the GoToSocial service
in the format of an EnvironmentFile as described by `systemd.exec(5)`.

This option could be used to pass sensitive configuration to the GoToSocial daemon.

Please refer to the Environment Variables section in the
[documentation](https://docs.gotosocial.org/en/latest/configuration/).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/root/nixos/secrets/gotosocial.env"`

*Declared by:* [`nixos/modules/services/web-apps/gotosocial.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotosocial.nix)

## `services.gotosocial.openFirewall` {#opt-services.gotosocial.openFirewall}

Open the configured port in the firewall.
Using a reverse proxy instead is highly recommended.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gotosocial.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotosocial.nix)

## `services.gotosocial.package` {#opt-services.gotosocial.package}

The gotosocial package to use.

*Type:* package

*Default:* `pkgs.gotosocial`

*Declared by:* [`nixos/modules/services/web-apps/gotosocial.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotosocial.nix)

## `services.gotosocial.settings` {#opt-services.gotosocial.settings}

Contents of the GoToSocial YAML config.

Please refer to the
[documentation](https://docs.gotosocial.org/en/latest/configuration/)
and
[example config](https://github.com/superseriousbusiness/gotosocial/blob/main/example/config.yaml).

Please note that the `host` option cannot be changed later so it is important to configure this correctly before you start GoToSocial.

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  application-name = "gotosocial";
  bind-address = "127.0.0.1";
  db-address = "/var/lib/gotosocial/database.sqlite";
  db-type = "sqlite";
  port = 8080;
  protocol = "https";
  storage-local-base-path = "/var/lib/gotosocial/storage";
}
```

*Example:*

``` nix
{
  application-name = "My GoToSocial";
  host = "gotosocial.example.com";
}
```

*Declared by:* [`nixos/modules/services/web-apps/gotosocial.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotosocial.nix)

## `services.gotosocial.setupPostgresqlDB` {#opt-services.gotosocial.setupPostgresqlDB}

Whether to setup a local postgres database and populate the
`db-type` fields in `services.gotosocial.settings`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/gotosocial.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/gotosocial.nix)

## `services.goupile.configFile` {#opt-services.goupile.configFile}

The configuration file to be passed to goupile server.

By default the configuration file is created from `services.goupile.settings`.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/goupile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goupile.nix)

## `services.goupile.enable` {#opt-services.goupile.enable}

Whether to enable Goupile server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/goupile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goupile.nix)

## `services.goupile.enableSandbox` {#opt-services.goupile.enableSandbox}

Enable the sandbox option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/goupile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goupile.nix)

## `services.goupile.hostName` {#opt-services.goupile.hostName}

Nginx service name for goupile service.

*Type:* string

*Default:* `config.networking.fqdnOrHostName`

*Declared by:* [`nixos/modules/services/web-apps/goupile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goupile.nix)

## `services.goupile.package` {#opt-services.goupile.package}

The goupile package to use.

*Type:* package

*Default:* `pkgs.goupile`

*Declared by:* [`nixos/modules/services/web-apps/goupile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goupile.nix)

## `services.goupile.settings` {#opt-services.goupile.settings}

The options for `systemd.services.goupile` in ini format.

The configuration options available can be found here
https://github.com/Koromix/rygel/blob/goupile/3.11.1/src/goupile/server/admin.cc#L41

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  HTTP.Port = 8888;
}
```

*Declared by:* [`nixos/modules/services/web-apps/goupile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goupile.nix)

## `services.goupile.settings.Data.RootDirectory` {#opt-services.goupile.settings.Data.RootDirectory}

Goupile's data directory.

*Type:* string

*Default:* `"/var/lib/goupile"`

*Declared by:* [`nixos/modules/services/web-apps/goupile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goupile.nix)

## `services.goupile.settings.HTTP.Port` {#opt-services.goupile.settings.HTTP.Port}

The port goupile runs on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8889`

*Declared by:* [`nixos/modules/services/web-apps/goupile.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/goupile.nix)

## `services.govee2mqtt.enable` {#opt-services.govee2mqtt.enable}

Whether to enable Govee2MQTT.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/home-automation/govee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/govee2mqtt.nix)

## `services.govee2mqtt.environmentFile` {#opt-services.govee2mqtt.environmentFile}

Environment file as defined in `systemd.exec(5)`.

See upstream documentation [https://github.com/wez/govee2mqtt/blob/main/docs/CONFIG.md](https://github.com/wez/govee2mqtt/blob/main/docs/CONFIG.md).

*Type:* absolute path

*Example:* `"/var/lib/govee2mqtt/govee2mqtt.env"`

*Declared by:* [`nixos/modules/services/home-automation/govee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/govee2mqtt.nix)

## `services.govee2mqtt.extraArgs` {#opt-services.govee2mqtt.extraArgs}

Extra arguments to pass to `govee serve`.
See `govee serve --help` for available arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--http-port=9876"
]
```

*Declared by:* [`nixos/modules/services/home-automation/govee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/govee2mqtt.nix)

## `services.govee2mqtt.group` {#opt-services.govee2mqtt.group}

Group under which Govee2MQTT should run.

*Type:* string

*Default:* `"govee2mqtt"`

*Declared by:* [`nixos/modules/services/home-automation/govee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/govee2mqtt.nix)

## `services.govee2mqtt.package` {#opt-services.govee2mqtt.package}

The govee2mqtt package to use.

*Type:* package

*Default:* `pkgs.govee2mqtt`

*Declared by:* [`nixos/modules/services/home-automation/govee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/govee2mqtt.nix)

## `services.govee2mqtt.user` {#opt-services.govee2mqtt.user}

User under which Govee2MQTT should run.

*Type:* string

*Default:* `"govee2mqtt"`

*Declared by:* [`nixos/modules/services/home-automation/govee2mqtt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/home-automation/govee2mqtt.nix)

## `services.goxlr-utility.autoStart.xdg` {#opt-services.goxlr-utility.autoStart.xdg}

Start the daemon automatically using XDG autostart.
Sets `xdg.autostart.enable = true` if not already enabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/audio/goxlr-utility.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/goxlr-utility.nix)

## `services.goxlr-utility.enable` {#opt-services.goxlr-utility.enable}

Whether to enable goxlr-utility for controlling your TC-Helicon GoXLR or GoXLR Mini

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/goxlr-utility.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/goxlr-utility.nix)

## `services.goxlr-utility.package` {#opt-services.goxlr-utility.package}

The goxlr-utility package to use.

*Type:* package

*Default:* `pkgs.goxlr-utility`

*Declared by:* [`nixos/modules/services/audio/goxlr-utility.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/goxlr-utility.nix)

## `services.gpm.enable` {#opt-services.gpm.enable}

Whether to enable GPM, the General Purpose Mouse daemon,
which enables mouse support in virtual consoles.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/ttys/gpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/gpm.nix)

## `services.gpm.protocol` {#opt-services.gpm.protocol}

Mouse protocol to use.

*Type:* string

*Default:* `"ps/2"`

*Declared by:* [`nixos/modules/services/ttys/gpm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/gpm.nix)

## `services.gpsd.debugLevel` {#opt-services.gpsd.debugLevel}

The debugging level.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/gpsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gpsd.nix)

## `services.gpsd.devices` {#opt-services.gpsd.devices}

List of devices that `gpsd` should subscribe to.

A device may be a local serial device for GPS input, or a
URL of the form:
`[{dgpsip|ntrip}://][user:passwd@]host[:port][/stream]` in
which case it specifies an input source for DGPS or ntrip
data.

*Type:* list of string

*Default:*

``` nix
[
  "/dev/ttyUSB0"
]
```

*Declared by:* [`nixos/modules/services/misc/gpsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gpsd.nix)

## `services.gpsd.enable` {#opt-services.gpsd.enable}

Whether to enable `gpsd`, a GPS service daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gpsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gpsd.nix)

## `services.gpsd.extraArgs` {#opt-services.gpsd.extraArgs}

A list of extra command line arguments to pass to gpsd.
Check `gpsd(8)` mangpage for possible arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-r"
  "-s"
  "19200"
]
```

*Declared by:* [`nixos/modules/services/misc/gpsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gpsd.nix)

## `services.gpsd.listenany` {#opt-services.gpsd.listenany}

Listen on all addresses rather than just loopback.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gpsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gpsd.nix)

## `services.gpsd.nowait` {#opt-services.gpsd.nowait}

don't wait for client connects to poll GPS

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/gpsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gpsd.nix)

## `services.gpsd.port` {#opt-services.gpsd.port}

The port where to listen for TCP connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2947`

*Declared by:* [`nixos/modules/services/misc/gpsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gpsd.nix)

## `services.gpsd.readonly` {#opt-services.gpsd.readonly}

Whether to enable the broken-device-safety, otherwise
known as read-only mode.  Some popular bluetooth and USB
receivers lock up or become totally inaccessible when
probed or reconfigured.  This switch prevents gpsd from
writing to a receiver.  This means that gpsd cannot
configure the receiver for optimal performance, but it
also means that gpsd cannot break the receiver.  A better
solution would be for Bluetooth to not be so fragile.  A
platform independent method to identify
serial-over-Bluetooth devices would also be nice.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/gpsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/gpsd.nix)

## `services.gradient.domain` {#opt-services.gradient.domain}

Domain under which Gradient is reachable.

*Type:* string

*Example:* `"gradient.example.com"`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.enable` {#opt-services.gradient.enable}

Whether to enable Gradient, a Nix-CI for Teams.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.environmentVariables` {#opt-services.gradient.environmentVariables}

Environment variables of the Gradient server.
The [configuration reference](https://wavelens.github.io/gradient/reference/configuration) lists every variable and its default.
Set a variable to `null` to unset it.
Secrets belong into `services.gradient.secrets`.

*Type:* lazy attribute set of (null or boolean or signed integer or string or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{
  GRADIENT_GC_INTERVAL_SECS = 600;
  GRADIENT_OIDC_CLIENT_ID = "gradient";
  GRADIENT_OIDC_DISCOVERY_URL = "https://id.example.com/.well-known/openid-configuration";
  GRADIENT_OIDC_ENABLE = true;
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.localWorker` {#opt-services.gradient.localWorker}

Whether to register the `services.gradient.worker` on this host automatically,
with an ID from the hostname and a token and peers file from the first start.
The state-declared team `server` is part of every new project.

*Type:* boolean

*Default:* `config.services.gradient.worker.enable`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.nginx.enable` {#opt-services.gradient.nginx.enable}

Whether to enable an nginx virtual host for Gradient.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.nginx.exposeProto` {#opt-services.gradient.nginx.exposeProto}

Whether to enable `/proto` for remote workers and federation.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.nginx.frontend` {#opt-services.gradient.nginx.frontend}

Whether to enable serving the Gradient web frontend.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.packages.frontend` {#opt-services.gradient.packages.frontend}

The gradient-frontend package to use.

*Type:* package

*Default:* `pkgs.gradient-frontend`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.packages.server` {#opt-services.gradient.packages.server}

The gradient package to use.

*Type:* package

*Default:* `pkgs.gradient`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.postgres.enable` {#opt-services.gradient.postgres.enable}

Whether to enable a local PostgreSQL database for Gradient.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.cryptFile` {#opt-services.gradient.secrets.cryptFile}

File containing the key used to encrypt secrets in the database.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.databaseUrlFile` {#opt-services.gradient.secrets.databaseUrlFile}

File containing the secret behind `GRADIENT_DATABASE_URL_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.githubAppPrivateKeyFile` {#opt-services.gradient.secrets.githubAppPrivateKeyFile}

File containing the secret behind `GRADIENT_GITHUB_APP_PRIVATE_KEY_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.githubAppWebhookSecretFile` {#opt-services.gradient.secrets.githubAppWebhookSecretFile}

File containing the secret behind `GRADIENT_GITHUB_APP_WEBHOOK_SECRET_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.jwtFile` {#opt-services.gradient.secrets.jwtFile}

File containing the secret used to sign JWTs.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.metricsTokenFile` {#opt-services.gradient.secrets.metricsTokenFile}

File containing the secret behind `GRADIENT_METRICS_TOKEN_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.oidcClientSecretFile` {#opt-services.gradient.secrets.oidcClientSecretFile}

File containing the secret behind `GRADIENT_OIDC_CLIENT_SECRET_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.s3SecretAccessKeyFile` {#opt-services.gradient.secrets.s3SecretAccessKeyFile}

File containing the secret behind `GRADIENT_S3_SECRET_ACCESS_KEY_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.scimTokenFile` {#opt-services.gradient.secrets.scimTokenFile}

File containing the secret behind `GRADIENT_SCIM_TOKEN_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.smtpPasswordFile` {#opt-services.gradient.secrets.smtpPasswordFile}

File containing the secret behind `GRADIENT_EMAIL_SMTP_PASSWORD_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.secrets.sshHostKeyFile` {#opt-services.gradient.secrets.sshHostKeyFile}

File containing the secret behind `GRADIENT_SSH_HOST_KEY_FILE`, loaded as a systemd credential.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.state` {#opt-services.gradient.state}

Declarative Gradient state, written as JSON to the server's state file.
The [state reference](https://wavelens.github.io/gradient/reference/state) documents the available fields.
Fields naming an entry, such as `name`, `username` and `display_name`, default to its attribute name.
Files in `password_file`, `private_key_file`, `signing_key_file`, `key_file`,
`token_file`, `secret_file`, `access_token_file` and the secret files of task
actions become systemd credentials of the server.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  users.alice = {
    email = "alice@example.com";
    password_file = "/etc/gradient/secrets/alice_password";
    superuser = true;
  };
  projects.acme-corp = {
    private_key_file = "/etc/gradient/secrets/acme_ssh_key";
    created_by = "alice";
  };
  tasks.web-app = {
    project = "acme-corp";
    repository = "https://github.com/acme-corp/web-app.git";
    wildcard = "nixosConfigurations.*.config.system.build.toplevel";
    created_by = "alice";
    triggers = [
      {
        type = "polling";
        config.interval_secs = 300;
      }
    ];
  };
  caches.main-cache = {
    signing_key_file = "/etc/gradient/secrets/main_cache_key";
    projects = [ "acme-corp" ];
    created_by = "alice";
  };
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.state.validate` {#opt-services.gradient.state.validate}

Whether to check the state option with the server's `--state-validate` flag at
build time. Schema and reference errors then fail at build time instead of at
runtime.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/default.nix)

## `services.gradient.worker.enable` {#opt-services.gradient.worker.enable}

Whether to enable the Gradient worker.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.gradient.worker.environmentVariables` {#opt-services.gradient.worker.environmentVariables}

Environment variables of the Gradient worker.
The [configuration reference](https://wavelens.github.io/gradient/reference/configuration) lists every variable and its default.
Set a variable to `null` to unset it.

*Type:* lazy attribute set of (null or boolean or signed integer or string or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{
  GRADIENT_WORKER_BUILD_MAX_CONCURRENT = 8;
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.gradient.worker.id` {#opt-services.gradient.worker.id}

UUID identifying the worker to the Gradient server.

*Type:* null or string

*Default:* `null`

*Example:* `"00000000-0000-0000-0000-000000000000"`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.gradient.worker.packages.git` {#opt-services.gradient.worker.packages.git}

Git package available to the worker for cloning repositories.

*Type:* package

*Default:* `config.programs.git.package`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.gradient.worker.packages.gradient` {#opt-services.gradient.worker.packages.gradient}

The gradient package to use.

*Type:* package

*Default:* `pkgs.gradient`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.gradient.worker.packages.nix` {#opt-services.gradient.worker.packages.nix}

Nix package providing the `nix` for system feature detection.
The default is Gradient's Nix fork, matching the worker's embedded evaluator.

*Type:* package

*Default:* `config.services.gradient.worker.packages.gradient.nix`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.gradient.worker.packages.ssh` {#opt-services.gradient.worker.packages.ssh}

OpenSSH package used as `GIT_SSH_COMMAND` to fetch private flake inputs.

*Type:* package

*Default:* `config.programs.ssh.package`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.gradient.worker.peersFile` {#opt-services.gradient.worker.peersFile}

File of peer tokens for challenge-response authentication with the server,
with `peer_id:token` per line and `#` starting a comment.

```
<uuid>:<token>
*:<token>
```

Use peer ID `*` to match any UUID in the server's challenge.
Tokens are 48 byte random secrets, for example from `openssl rand -base64 48`.
Register them via the API through `POST /api/v1/projects/{project}/workers`.
Set it to `null` for open mode without authentication; avoid that in a production setup.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.gradient.worker.serverUrl` {#opt-services.gradient.worker.serverUrl}

WebSocket URL of the Gradient server the worker connects to.

*Type:* null or string

*Default:* `null`

*Example:* `"wss://gradient.example.com/proto"`

*Declared by:* [`nixos/modules/services/continuous-integration/gradient/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/gradient/worker.nix)

## `services.grafana-image-renderer.enable` {#opt-services.grafana-image-renderer.enable}

Whether to enable grafana-image-renderer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana-image-renderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-image-renderer.nix)

## `services.grafana-image-renderer.provisionGrafana` {#opt-services.grafana-image-renderer.provisionGrafana}

Whether to enable Grafana configuration for grafana-image-renderer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana-image-renderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-image-renderer.nix)

## `services.grafana-image-renderer.settings` {#opt-services.grafana-image-renderer.settings}

Configuration attributes for `grafana-image-renderer`.

*Type:* open submodule of attribute set of attribute set of (string or signed integer or boolean or list of (string or signed integer))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/grafana-image-renderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-image-renderer.nix)

## `services.grafana-image-renderer.settings.browser.path` {#opt-services.grafana-image-renderer.settings.browser.path}

Path to the executable of the chromium to use.

*Type:* absolute path

*Default:* `lib.getExe pkgs.chromium`

*Declared by:* [`nixos/modules/services/monitoring/grafana-image-renderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-image-renderer.nix)

## `services.grafana-image-renderer.settings.server.addr` {#opt-services.grafana-image-renderer.settings.server.addr}

Listen address of the service.

*Type:* string

*Default:* `"localhost:8081"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-image-renderer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-image-renderer.nix)

## `services.grafana-to-ntfy.enable` {#opt-services.grafana-to-ntfy.enable}

Whether to enable grafana-to-ntfy, a Grafana/Alertmanager to ntfy.sh bridge.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.package` {#opt-services.grafana-to-ntfy.package}

The grafana-to-ntfy package to use.

*Type:* package

*Default:* `pkgs.grafana-to-ntfy`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.settings.address` {#opt-services.grafana-to-ntfy.settings.address}

Address to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.settings.bauthPass` {#opt-services.grafana-to-ntfy.settings.bauthPass}

Path to the password file for Basic Auth on incoming webhook requests.
When set together with `bauthUser`, incoming requests require Basic Auth.
When both are null, the endpoint is open (unauthenticated).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/grafana-to-ntfy-bauth-pass"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.settings.bauthUser` {#opt-services.grafana-to-ntfy.settings.bauthUser}

The user for Basic Auth on incoming webhook requests from Grafana or Alertmanager.
When set together with `bauthPass`, incoming requests require Basic Auth.
When both are null, the endpoint is open (unauthenticated).

*Type:* null or string

*Default:* `null`

*Example:* `"admin"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.settings.markdown` {#opt-services.grafana-to-ntfy.settings.markdown}

Enable Markdown formatting in ntfy notifications. Sets the X-Markdown header.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.settings.ntfyBAuthPass` {#opt-services.grafana-to-ntfy.settings.ntfyBAuthPass}

The path to the password for the specified ntfy-sh user.
Setting this option is required when using a ntfy-sh instance with access control enabled.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/grafana-to-ntfy-ntfy-pass"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.settings.ntfyBAuthUser` {#opt-services.grafana-to-ntfy.settings.ntfyBAuthUser}

The ntfy-sh user to use for authenticating with the ntfy-sh instance.
Setting this option is required when using a ntfy-sh instance with access control enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"grafana"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.settings.ntfyUrl` {#opt-services.grafana-to-ntfy.settings.ntfyUrl}

The URL to the ntfy-sh topic.

*Type:* string

*Example:* `"https://push.example.com/grafana"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana-to-ntfy.settings.port` {#opt-services.grafana-to-ntfy.settings.port}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/monitoring/grafana-to-ntfy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-to-ntfy.nix)

## `services.grafana.dataDir` {#opt-services.grafana.dataDir}

Data directory.

*Type:* absolute path

*Default:* `"/var/lib/grafana"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.declarativePlugins` {#opt-services.grafana.declarativePlugins}

If non-null, then a list of packages containing Grafana plugins to install. If set, plugins cannot
be manually installed.

Keep in mind that this overrides any app that Grafana might preinstall.
This affects for instance Grafana Drilldown (`grafana-metricsdrilldown-app`,
`grafana-lokiexplore-app`, `grafana-exploretraces-app` and `grafana-pyroscope-app`),
but also data-sources like `prometheus`, `loki`, `tempo` and `jaeger`.

*Type:* null or (list of absolute path)

*Default:* `null`

*Example:* `with pkgs.grafanaPlugins; [ grafana-piechart-panel prometheus loki tempo ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.enable` {#opt-services.grafana.enable}

Whether to enable grafana.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.openFirewall` {#opt-services.grafana.openFirewall}

Open the ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.package` {#opt-services.grafana.package}

The grafana package to use.

*Type:* package

*Default:* `pkgs.grafana`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.contactPoints.path` {#opt-services.grafana.provision.alerting.contactPoints.path}

Path to YAML contact points configuration. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.contactPoints.settings) simultaneously.
Can be either a directory or a single YAML file. Will end up in the store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.contactPoints.settings` {#opt-services.grafana.provision.alerting.contactPoints.settings}

Grafana contact points configuration in Nix. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.contactPoints.path) simultaneously. See
[https://grafana.com/docs/grafana/latest/administration/provisioning/#contact-points](https://grafana.com/docs/grafana/latest/administration/provisioning/#contact-points)
for supported options.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  apiVersion = 1;

  contactPoints = [{
    orgId = 1;
    name = "cp_1";
    receivers = [{
      uid = "first_uid";
      type = "prometheus-alertmanager";
      settings.url = "http://test:9000";
    }];
  }];

  deleteContactPoints = [{
    orgId = 1;
    uid = "first_uid";
  }];
}
```

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.contactPoints.settings.apiVersion` {#opt-services.grafana.provision.alerting.contactPoints.settings.apiVersion}

Config file version.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.contactPoints.settings.contactPoints` {#opt-services.grafana.provision.alerting.contactPoints.settings.contactPoints}

List of contact points to import or update.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.contactPoints.settings.contactPoints.*.name` {#opt-services.grafana.provision.alerting.contactPoints.settings.contactPoints._.name}

Name of the contact point. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.contactPoints.settings.deleteContactPoints` {#opt-services.grafana.provision.alerting.contactPoints.settings.deleteContactPoints}

List of receivers that should be deleted.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.contactPoints.settings.deleteContactPoints.*.orgId` {#opt-services.grafana.provision.alerting.contactPoints.settings.deleteContactPoints._.orgId}

Organization ID, default = 1.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.contactPoints.settings.deleteContactPoints.*.uid` {#opt-services.grafana.provision.alerting.contactPoints.settings.deleteContactPoints._.uid}

Unique identifier for the receiver. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.muteTimings.path` {#opt-services.grafana.provision.alerting.muteTimings.path}

Path to YAML mute timings configuration. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.muteTimings.settings) simultaneously.
Can be either a directory or a single YAML file. Will end up in the store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.muteTimings.settings` {#opt-services.grafana.provision.alerting.muteTimings.settings}

Grafana mute timings configuration in Nix. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.muteTimings.path) simultaneously. See
[https://grafana.com/docs/grafana/latest/administration/provisioning/#mute-timings](https://grafana.com/docs/grafana/latest/administration/provisioning/#mute-timings)
for supported options.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  apiVersion = 1;

  muteTimes = [{
    orgId = 1;
    name = "mti_1";
    time_intervals = [{
      times = [{
        start_time = "06:00";
        end_time = "23:59";
      }];
      weekdays = [
        "monday:wednesday"
        "saturday"
        "sunday"
      ];
      months = [
        "1:3"
        "may:august"
        "december"
      ];
      years = [
        "2020:2022"
        "2030"
      ];
      days_of_month = [
        "1:5"
        "-3:-1"
      ];
    }];
  }];

  deleteMuteTimes = [{
    orgId = 1;
    name = "mti_1";
  }];
}
```

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.muteTimings.settings.apiVersion` {#opt-services.grafana.provision.alerting.muteTimings.settings.apiVersion}

Config file version.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.muteTimings.settings.deleteMuteTimes` {#opt-services.grafana.provision.alerting.muteTimings.settings.deleteMuteTimes}

List of mute time intervals that should be deleted.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.muteTimings.settings.deleteMuteTimes.*.name` {#opt-services.grafana.provision.alerting.muteTimings.settings.deleteMuteTimes._.name}

Name of the mute time interval, must be unique. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.muteTimings.settings.deleteMuteTimes.*.orgId` {#opt-services.grafana.provision.alerting.muteTimings.settings.deleteMuteTimes._.orgId}

Organization ID, default = 1.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.muteTimings.settings.muteTimes` {#opt-services.grafana.provision.alerting.muteTimings.settings.muteTimes}

List of mute time intervals to import or update.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.muteTimings.settings.muteTimes.*.name` {#opt-services.grafana.provision.alerting.muteTimings.settings.muteTimes._.name}

Name of the mute time interval, must be unique. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.policies.path` {#opt-services.grafana.provision.alerting.policies.path}

Path to YAML notification policies configuration. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.policies.settings) simultaneously.
Can be either a directory or a single YAML file. Will end up in the store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.policies.settings` {#opt-services.grafana.provision.alerting.policies.settings}

Grafana notification policies configuration in Nix. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.policies.path) simultaneously. See
[https://grafana.com/docs/grafana/latest/administration/provisioning/#notification-policies](https://grafana.com/docs/grafana/latest/administration/provisioning/#notification-policies)
for supported options.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  apiVersion = 1;

  policies = [{
    orgId = 1;
    receiver = "grafana-default-email";
    group_by = [ "..." ];
    matchers = [
      "alertname = Watchdog"
      "severity =~ \"warning|critical\""
    ];
    mute_time_intervals = [
      "abc"
    ];
    group_wait = "30s";
    group_interval = "5m";
    repeat_interval = "4h";
  }];

  resetPolicies = [
    1
  ];
}
```

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.policies.settings.apiVersion` {#opt-services.grafana.provision.alerting.policies.settings.apiVersion}

Config file version.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.policies.settings.policies` {#opt-services.grafana.provision.alerting.policies.settings.policies}

List of contact points to import or update.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.policies.settings.resetPolicies` {#opt-services.grafana.provision.alerting.policies.settings.resetPolicies}

List of orgIds that should be reset to the default policy.

*Type:* list of signed integer

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.path` {#opt-services.grafana.provision.alerting.rules.path}

Path to YAML rules configuration. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.rules.settings) simultaneously.
Can be either a directory or a single YAML file. Will end up in the store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings` {#opt-services.grafana.provision.alerting.rules.settings}

Grafana rules configuration in Nix. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.rules.path) simultaneously. See
[https://grafana.com/docs/grafana/latest/administration/provisioning/#rules](https://grafana.com/docs/grafana/latest/administration/provisioning/#rules)
for supported options.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  apiVersion = 1;

  groups = [{
    orgId = 1;
    name = "my_rule_group";
    folder = "my_first_folder";
    interval = "60s";
    rules = [{
      uid = "my_id_1";
      title = "my_first_rule";
      condition = "A";
      data = [{
        refId = "A";
        datasourceUid = "-100";
        model = {
          conditions = [{
            evaluator = {
              params = [ 3 ];
              type = "git";
            };
            operator.type = "and";
            query.params = [ "A" ];
            reducer.type = "last";
            type = "query";
          }];
          datasource = {
            type = "__expr__";
            uid = "-100";
          };
          expression = "1==0";
          intervalMs = 1000;
          maxDataPoints = 43200;
          refId = "A";
          type = "math";
        };
      }];
      dashboardUid = "my_dashboard";
      panelId = 123;
      noDataState = "Alerting";
      for = "60s";
      annotations.some_key = "some_value";
      labels.team = "sre_team1";
    }];
  }];

  deleteRules = [{
    orgId = 1;
    uid = "my_id_1";
  }];
}
```

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings.apiVersion` {#opt-services.grafana.provision.alerting.rules.settings.apiVersion}

Config file version.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings.deleteRules` {#opt-services.grafana.provision.alerting.rules.settings.deleteRules}

List of alert rule UIDs that should be deleted.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings.deleteRules.*.orgId` {#opt-services.grafana.provision.alerting.rules.settings.deleteRules._.orgId}

Organization ID, default = 1

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings.deleteRules.*.uid` {#opt-services.grafana.provision.alerting.rules.settings.deleteRules._.uid}

Unique identifier for the rule. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings.groups` {#opt-services.grafana.provision.alerting.rules.settings.groups}

List of rule groups to import or update.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings.groups.*.folder` {#opt-services.grafana.provision.alerting.rules.settings.groups._.folder}

Name of the folder the rule group will be stored in. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings.groups.*.interval` {#opt-services.grafana.provision.alerting.rules.settings.groups._.interval}

Interval that the rule group should be evaluated at. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.rules.settings.groups.*.name` {#opt-services.grafana.provision.alerting.rules.settings.groups._.name}

Name of the rule group. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.path` {#opt-services.grafana.provision.alerting.templates.path}

Path to YAML templates configuration. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.templates.settings) simultaneously.
Can be either a directory or a single YAML file. Will end up in the store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.settings` {#opt-services.grafana.provision.alerting.templates.settings}

Grafana templates configuration in Nix. Can't be used with
[services (G)](#opt-services.grafana.provision.alerting.templates.path) simultaneously. See
[https://grafana.com/docs/grafana/latest/administration/provisioning/#templates](https://grafana.com/docs/grafana/latest/administration/provisioning/#templates)
for supported options.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  apiVersion = 1;

  templates = [{
    orgId = 1;
    name = "my_first_template";
    template = "Alerting with a custom text template";
  }];

  deleteTemplates = [{
    orgId = 1;
    name = "my_first_template";
  }];
}
```

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.settings.apiVersion` {#opt-services.grafana.provision.alerting.templates.settings.apiVersion}

Config file version.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.settings.deleteTemplates` {#opt-services.grafana.provision.alerting.templates.settings.deleteTemplates}

List of alert rule UIDs that should be deleted.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.settings.deleteTemplates.*.name` {#opt-services.grafana.provision.alerting.templates.settings.deleteTemplates._.name}

Name of the template, must be unique. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.settings.deleteTemplates.*.orgId` {#opt-services.grafana.provision.alerting.templates.settings.deleteTemplates._.orgId}

Organization ID, default = 1.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.settings.templates` {#opt-services.grafana.provision.alerting.templates.settings.templates}

List of templates to import or update.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.settings.templates.*.name` {#opt-services.grafana.provision.alerting.templates.settings.templates._.name}

Name of the template, must be unique. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.alerting.templates.settings.templates.*.template` {#opt-services.grafana.provision.alerting.templates.settings.templates._.template}

Alerting with a custom text template

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.dashboards` {#opt-services.grafana.provision.dashboards}

Declaratively provision Grafana's dashboards.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.dashboards.path` {#opt-services.grafana.provision.dashboards.path}

Path to YAML dashboard configuration. Can't be used with
[services (G)](#opt-services.grafana.provision.dashboards.settings) simultaneously.
Can be either a directory or a single YAML file. Will end up in the store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.dashboards.settings` {#opt-services.grafana.provision.dashboards.settings}

Grafana dashboard configuration in Nix. Can't be used with
[services (G)](#opt-services.grafana.provision.dashboards.path) simultaneously. See
[https://grafana.com/docs/grafana/latest/administration/provisioning/#dashboards](https://grafana.com/docs/grafana/latest/administration/provisioning/#dashboards)
for supported options.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  apiVersion = 1;

  providers = [{
      name = "default";
      options.path = "/var/lib/grafana/dashboards";
  }];
}
```

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.dashboards.settings.apiVersion` {#opt-services.grafana.provision.dashboards.settings.apiVersion}

Config file version.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.dashboards.settings.providers` {#opt-services.grafana.provision.dashboards.settings.providers}

List of dashboards to insert/update.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.dashboards.settings.providers.*.name` {#opt-services.grafana.provision.dashboards.settings.providers._.name}

A unique provider name.

*Type:* string

*Default:* `"default"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.dashboards.settings.providers.*.options.path` {#opt-services.grafana.provision.dashboards.settings.providers._.options.path}

Path grafana will watch for dashboards. Required when using the 'file' type.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.dashboards.settings.providers.*.type` {#opt-services.grafana.provision.dashboards.settings.providers._.type}

Dashboard provider type.

*Type:* string

*Default:* `"file"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources` {#opt-services.grafana.provision.datasources}

Declaratively provision Grafana's datasources.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.path` {#opt-services.grafana.provision.datasources.path}

Path to YAML datasource configuration. Can't be used with
[services (G)](#opt-services.grafana.provision.datasources.settings) simultaneously.
Can be either a directory or a single YAML file. Will end up in the store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings` {#opt-services.grafana.provision.datasources.settings}

Grafana datasource configuration in Nix. Can't be used with
[services (G)](#opt-services.grafana.provision.datasources.path) simultaneously. See
[https://grafana.com/docs/grafana/latest/administration/provisioning/#data-sources](https://grafana.com/docs/grafana/latest/administration/provisioning/#data-sources)
for supported options.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  apiVersion = 1;

  datasources = [{
    name = "Graphite";
    type = "graphite";
  }];

  deleteDatasources = [{
    name = "Graphite";
    orgId = 1;
  }];
}
```

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.apiVersion` {#opt-services.grafana.provision.datasources.settings.apiVersion}

Config file version.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources` {#opt-services.grafana.provision.datasources.settings.datasources}

List of datasources to insert/update.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources.*.access` {#opt-services.grafana.provision.datasources.settings.datasources._.access}

Access mode. proxy or direct (Server or Browser in the UI). Required.

*Type:* one of "proxy", "direct"

*Default:* `"proxy"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources.*.editable` {#opt-services.grafana.provision.datasources.settings.datasources._.editable}

Allow users to edit datasources from the UI.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources.*.jsonData` {#opt-services.grafana.provision.datasources.settings.datasources._.jsonData}

Extra data for datasource plugins.

*Type:* null or (attribute set)

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources.*.name` {#opt-services.grafana.provision.datasources.settings.datasources._.name}

Name of the datasource. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources.*.secureJsonData` {#opt-services.grafana.provision.datasources.settings.datasources._.secureJsonData}

Datasource specific secure configuration. Please note that the contents of this option
will end up in a world-readable Nix store. Use the file provider
pointing at a reasonably secured file in the local filesystem
to work around that. Look at the documentation for details:
[https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider)

*Type:* null or (attribute set)

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources.*.type` {#opt-services.grafana.provision.datasources.settings.datasources._.type}

Datasource type. Required.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources.*.uid` {#opt-services.grafana.provision.datasources.settings.datasources._.uid}

Custom UID which can be used to reference this datasource in other parts of the configuration, if not specified will be generated automatically.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.datasources.*.url` {#opt-services.grafana.provision.datasources.settings.datasources._.url}

Url of the datasource.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.deleteDatasources` {#opt-services.grafana.provision.datasources.settings.deleteDatasources}

List of datasources that should be deleted from the database.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.deleteDatasources.*.name` {#opt-services.grafana.provision.datasources.settings.deleteDatasources._.name}

Name of the datasource to delete.

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.deleteDatasources.*.orgId` {#opt-services.grafana.provision.datasources.settings.deleteDatasources._.orgId}

Organization ID of the datasource to delete.

*Type:* signed integer

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.datasources.settings.prune` {#opt-services.grafana.provision.datasources.settings.prune}

When `true`, provisioned datasources from this file will be deleted
automatically when removed from
[`services.grafana.provision.datasources.settings.datasources`](#opt-services.grafana.provision.datasources.settings.datasources).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.provision.enable` {#opt-services.grafana.provision.enable}

Whether to enable provision.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings` {#opt-services.grafana.settings}

Grafana settings. See [https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/)
for available options. INI format is used.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.analytics.check_for_plugin_updates` {#opt-services.grafana.settings.analytics.check_for_plugin_updates}

When set to `false`, disables checking for new versions of installed plugins from https://grafana.com.
When enabled, the check for a new plugin runs every 10 minutes.
It will notify, via the UI, when a new plugin update exists.
The check itself will not prompt any auto-updates of the plugin, nor will it send any sensitive information.

*Type:* boolean

*Default:* `cfg.declarativePlugins == null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.analytics.check_for_updates` {#opt-services.grafana.settings.analytics.check_for_updates}

When set to `false`, disables checking for new versions of Grafana from Grafana's GitHub repository.
When enabled, the check for a new version runs every 10 minutes.
It will notify, via the UI, when a new version is available.
The check itself will not prompt any auto-updates of the Grafana software, nor will it send any sensitive information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.analytics.feedback_links_enabled` {#opt-services.grafana.settings.analytics.feedback_links_enabled}

Set to `false` to remove all feedback links from the UI.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.analytics.reporting_enabled` {#opt-services.grafana.settings.analytics.reporting_enabled}

When enabled Grafana will send anonymous usage statistics to `stats.grafana.org`.
No IP addresses are being tracked, only simple counters to track running instances, versions, dashboard and error counts.
Counters are sent every 24 hours.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.ca_cert_path` {#opt-services.grafana.settings.database.ca_cert_path}

The path to the CA certificate to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.cache_mode` {#opt-services.grafana.settings.database.cache_mode}

For `sqlite3` only.
[Shared cache](https://www.sqlite.org/sharedcache.html) setting used for connecting to the database.

*Type:* one of "private", "shared"

*Default:* `"private"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.client_cert_path` {#opt-services.grafana.settings.database.client_cert_path}

The path to the client cert. Only if server requires client authentication.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.client_key_path` {#opt-services.grafana.settings.database.client_key_path}

The path to the client key. Only if server requires client authentication.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.conn_max_lifetime` {#opt-services.grafana.settings.database.conn_max_lifetime}

Sets the maximum amount of time a connection may be reused.
The default is 14400 (which means 14400 seconds or 4 hours).
For MySQL, this setting should be shorter than the `wait_timeout` variable.

*Type:* signed integer

*Default:* `14400`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.host` {#opt-services.grafana.settings.database.host}

Only applicable to MySQL or Postgres.
Includes IP or hostname and port or in case of Unix sockets the path to it.
For example, for MySQL running on the same host as Grafana: `host = "127.0.0.1:3306"`
or with Unix sockets: `host = "/var/run/mysqld/mysqld.sock"`

*Type:* string

*Default:* `"127.0.0.1:3306"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.isolation_level` {#opt-services.grafana.settings.database.isolation_level}

Only the MySQL driver supports isolation levels in Grafana.
In case the value is empty, the driver's default isolation level is applied.

*Type:* null or one of "READ-UNCOMMITTED", "READ-COMMITTED", "REPEATABLE-READ", "SERIALIZABLE"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.locking_attempt_timeout_sec` {#opt-services.grafana.settings.database.locking_attempt_timeout_sec}

For `mysql`, if the `migrationLocking` feature toggle is set,
specify the time (in seconds) to wait before failing to lock the database for the migrations.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.log_queries` {#opt-services.grafana.settings.database.log_queries}

Set to `true` to log the sql calls and execution times

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.max_idle_conn` {#opt-services.grafana.settings.database.max_idle_conn}

The maximum number of connections in the idle connection pool.

*Type:* signed integer

*Default:* `2`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.max_open_conn` {#opt-services.grafana.settings.database.max_open_conn}

The maximum number of open connections to the database.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.name` {#opt-services.grafana.settings.database.name}

The name of the Grafana database.

*Type:* string

*Default:* `"grafana"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.password` {#opt-services.grafana.settings.database.password}

The database user's password (not applicable for `sqlite3`).

Please note that the contents of this option
will end up in a world-readable Nix store. Use the file provider
pointing at a reasonably secured file in the local filesystem
to work around that. Look at the documentation for details:
[https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider)

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.path` {#opt-services.grafana.settings.database.path}

Only applicable to `sqlite3` database. The file path where the database will be stored.

*Type:* absolute path

*Default:* `"${config.services.grafana.dataDir}/data/grafana.db"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.query_retries` {#opt-services.grafana.settings.database.query_retries}

This setting applies to `sqlite3` only and controls the number of times the system retries a query when the database is locked.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.server_cert_name` {#opt-services.grafana.settings.database.server_cert_name}

The common name field of the certificate used by the `mysql` or `postgres` server.
Not necessary if `ssl_mode` is set to `skip-verify`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.ssl_mode` {#opt-services.grafana.settings.database.ssl_mode}

For Postgres, use either `disable`, `require` or `verify-full`.
For MySQL, use either `true`, `false`, or `skip-verify`.

*Type:* one of "disable", "require", "verify-full", "true", "false", "skip-verify"

*Default:* `"disable"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.transaction_retries` {#opt-services.grafana.settings.database.transaction_retries}

This setting applies to `sqlite3` only and controls the number of times the system retries a transaction when the database is locked.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.type` {#opt-services.grafana.settings.database.type}

Database type.

*Type:* one of "mysql", "sqlite3", "postgres"

*Default:* `"sqlite3"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.user` {#opt-services.grafana.settings.database.user}

The database user (not applicable for `sqlite3`).

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.database.wal` {#opt-services.grafana.settings.database.wal}

For `sqlite3` only.
Setting to enable/disable [Write-Ahead Logging](https://sqlite.org/wal.html).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.paths.plugins` {#opt-services.grafana.settings.paths.plugins}

Directory where grafana will automatically scan and look for plugins

*Type:* absolute path

*Default:* `if (cfg.declarativePlugins == null) then "${cfg.dataDir}/plugins" else declarativePlugins`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.paths.provisioning` {#opt-services.grafana.settings.paths.provisioning}

Folder that contains provisioning config files that grafana will apply on startup and while running.
Don't change the value of this option if you are planning to use `services.grafana.provision` options.

*Type:* absolute path

*Default:* `"directory with links to files generated from services.grafana.provision"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.plugins.preinstall_disabled` {#opt-services.grafana.settings.plugins.preinstall_disabled}

When set to `true`, disables the Background Plugin Installer, which runs before Grafana starts.
This component causes issues with `declarativePlugins` and is disabled by default if those are used.

*Type:* boolean

*Default:* `cfg.declarativePlugins != null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.admin_email` {#opt-services.grafana.settings.security.admin_email}

The email of the default Grafana Admin, created on startup.

*Type:* string

*Default:* `"admin@localhost"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.admin_password` {#opt-services.grafana.settings.security.admin_password}

Default admin password. Please note that the contents of this option
will end up in a world-readable Nix store. Use the file provider
pointing at a reasonably secured file in the local filesystem
to work around that. Look at the documentation for details:
[https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider)

*Type:* string

*Default:* `"admin"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.admin_user` {#opt-services.grafana.settings.security.admin_user}

Default admin username.

*Type:* string

*Default:* `"admin"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.allow_embedding` {#opt-services.grafana.settings.security.allow_embedding}

When `false`, the HTTP header `X-Frame-Options: deny` will be set in Grafana HTTP responses
which will instruct browsers to not allow rendering Grafana in a `<frame>`, `<iframe>`, `<embed>` or `<object>`.
The main goal is to mitigate the risk of [Clickjacking](https://owasp.org/www-community/attacks/Clickjacking).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.content_security_policy` {#opt-services.grafana.settings.security.content_security_policy}

Set to `true` to add the `Content-Security-Policy` header to your requests.
CSP allows to control resources that the user agent can load and helps prevent XSS attacks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.content_security_policy_report_only` {#opt-services.grafana.settings.security.content_security_policy_report_only}

Set to `true` to add the `Content-Security-Policy-Report-Only` header to your requests.
CSP in Report Only mode enables you to experiment with policies by monitoring their effects without enforcing them.
You can enable both policies simultaneously.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.cookie_samesite` {#opt-services.grafana.settings.security.cookie_samesite}

Sets the `SameSite` cookie attribute and prevents the browser from sending this cookie along with cross-site requests.
The main goal is to mitigate the risk of cross-origin information leakage.
This setting also provides some protection against cross-site request forgery attacks (CSRF),
[read more about SameSite here](https://owasp.org/www-community/SameSite).
Using value `disabled` does not add any `SameSite` attribute to cookies.

*Type:* one of "lax", "strict", "none", "disabled"

*Default:* `"lax"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.cookie_secure` {#opt-services.grafana.settings.security.cookie_secure}

Set to `true` if you host Grafana behind HTTPS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.csrf_additional_headers` {#opt-services.grafana.settings.security.csrf_additional_headers}

List of allowed headers to be set by the user.
Suggested to use for if authentication lives behind reverse proxies.

*Type:* string or list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.csrf_trusted_origins` {#opt-services.grafana.settings.security.csrf_trusted_origins}

List of additional allowed URLs to pass by the CSRF check.
Suggested when authentication comes from an IdP.

*Type:* string or list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.data_source_proxy_whitelist` {#opt-services.grafana.settings.security.data_source_proxy_whitelist}

Define a whitelist of allowed IP addresses or domains, with ports,
to be used in data source URLs with the Grafana data source proxy.
Format: `ip_or_domain:port` separated by spaces.
PostgreSQL, MySQL, and MSSQL data sources do not use the proxy and are therefore unaffected by this setting.

*Type:* string or list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.disable_brute_force_login_protection` {#opt-services.grafana.settings.security.disable_brute_force_login_protection}

Set to `true` to disable [brute force login protection](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html#account-lockout).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.disable_gravatar` {#opt-services.grafana.settings.security.disable_gravatar}

Set to `true` to disable the use of Gravatar for user profile images.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.disable_initial_admin_creation` {#opt-services.grafana.settings.security.disable_initial_admin_creation}

Disable creation of admin user on first start of Grafana.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.secret_key` {#opt-services.grafana.settings.security.secret_key}

Secret key used for signing data source settings like secrets and passwords.
Set this to a unique, random string in production, generated for example by running `openssl rand -hex 32`.

If you change this later you will need to update data source settings to re-encode them.

[https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#secret\_key](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#secret_key)

Please note that the contents of this option
will end up in a world-readable Nix store. Use the file provider
pointing at a reasonably secured file in the local filesystem
to work around that. Look at the documentation for details:
[https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.strict_transport_security` {#opt-services.grafana.settings.security.strict_transport_security}

Set to `true` if you want to enable HTTP `Strict-Transport-Security` (HSTS) response header.
Only use this when HTTPS is enabled in your configuration,
or when there is another upstream system that ensures your application does HTTPS (like a frontend load balancer).
HSTS tells browsers that the site should only be accessed using HTTPS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.strict_transport_security_max_age_seconds` {#opt-services.grafana.settings.security.strict_transport_security_max_age_seconds}

Sets how long a browser should cache HSTS in seconds.
Only applied if `strict_transport_security` is enabled.

*Type:* signed integer

*Default:* `86400`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.strict_transport_security_preload` {#opt-services.grafana.settings.security.strict_transport_security_preload}

Set to `true` to enable HSTS `preloading` option.
Only applied if `strict_transport_security` is enabled.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.strict_transport_security_subdomains` {#opt-services.grafana.settings.security.strict_transport_security_subdomains}

Set to `true` to enable HSTS `includeSubDomains` option.
Only applied if `strict_transport_security` is enabled.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.x_content_type_options` {#opt-services.grafana.settings.security.x_content_type_options}

Set to `false` to disable the `X-Content-Type-Options` response header.
The `X-Content-Type-Options` response HTTP header is a marker used by the server
to indicate that the MIME types advertised in the `Content-Type` headers should not be changed and be followed.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.security.x_xss_protection` {#opt-services.grafana.settings.security.x_xss_protection}

Set to `true` to enable the `X-XSS-Protection` header,
which tells browsers to stop pages from loading when they detect reflected cross-site scripting (XSS) attacks.

**Note:** this is the default in Grafana, it's turned off here
since it's [recommended to not use this header anymore](https://owasp.org/www-project-secure-headers/#x-xss-protection).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.cdn_url` {#opt-services.grafana.settings.server.cdn_url}

Specify a full HTTP URL address to the root of your Grafana CDN assets.
Grafana will add edition and version paths.

For example, given a cdn url like `https://cdn.myserver.com`
grafana will try to load a javascript file from `http://cdn.myserver.com/grafana-oss/7.4.0/public/build/app.<hash>.js`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.cert_file` {#opt-services.grafana.settings.server.cert_file}

Path to the certificate file (if `protocol` is set to `https` or `h2`).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.cert_key` {#opt-services.grafana.settings.server.cert_key}

Path to the certificate key file (if `protocol` is set to `https` or `h2`).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.domain` {#opt-services.grafana.settings.server.domain}

The public facing domain name used to access grafana from a browser.

This setting is only used in the default value of the `root_url` setting.
If you set the latter manually, this option does not have to be specified.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.enable_gzip` {#opt-services.grafana.settings.server.enable_gzip}

Set this option to `true` to enable HTTP compression, this can improve transfer speed and bandwidth utilization.
It is recommended that most users set it to `true`. By default it is set to `false` for compatibility reasons.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.enforce_domain` {#opt-services.grafana.settings.server.enforce_domain}

Redirect to correct domain if the host header does not match the domain.
Prevents DNS rebinding attacks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.http_addr` {#opt-services.grafana.settings.server.http_addr}

Listening address.

::: note
This setting intentionally varies from upstream's default to be a bit more secure by default.
:::

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.http_port` {#opt-services.grafana.settings.server.http_port}

Listening port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.protocol` {#opt-services.grafana.settings.server.protocol}

Which protocol to listen.

*Type:* one of "http", "https", "h2", "socket"

*Default:* `"http"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.read_timeout` {#opt-services.grafana.settings.server.read_timeout}

Sets the maximum time using a duration format (5s/5m/5ms)
before timing out read of an incoming request and closing idle connections.
0 means there is no timeout for reading the request.

*Type:* string

*Default:* `"0"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.root_url` {#opt-services.grafana.settings.server.root_url}

This is the full URL used to access Grafana from a web browser.
This is important if you use Google or GitHub OAuth authentication (for the callback URL to be correct).

This setting is also important if you have a reverse proxy in front of Grafana that exposes it through a subpath.
In that case add the subpath to the end of this URL setting.

*Type:* string

*Default:* `"%(protocol)s://%(domain)s:%(http_port)s/"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.router_logging` {#opt-services.grafana.settings.server.router_logging}

Set to `true` for Grafana to log all HTTP requests (not just errors).
These are logged as Info level events to the Grafana log.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.serve_from_sub_path` {#opt-services.grafana.settings.server.serve_from_sub_path}

Serve Grafana from subpath specified in the `root_url` setting.
By default it is set to `false` for compatibility reasons.

By enabling this setting and using a subpath in `root_url` above,
e.g. `root_url = "http://localhost:3000/grafana"`,
Grafana is accessible on `http://localhost:3000/grafana`.
If accessed without subpath, Grafana will redirect to an URL with the subpath.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.socket` {#opt-services.grafana.settings.server.socket}

Path where the socket should be created when `protocol=socket`.
Make sure that Grafana has appropriate permissions before you change this setting.

*Type:* string

*Default:* `"/run/grafana/grafana.sock"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.socket_gid` {#opt-services.grafana.settings.server.socket_gid}

GID where the socket should be set when `protocol=socket`.
Make sure that the target group is in the group of Grafana process and that Grafana process is the file owner before you change this setting.
It is recommended to set the gid as http server user gid.
Not set when the value is -1.

*Type:* signed integer

*Default:* `-1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.socket_mode` {#opt-services.grafana.settings.server.socket_mode}

Mode where the socket should be set when `protocol=socket`.
Make sure that Grafana process is the file owner before you change this setting.

*Type:* string

*Default:* `"0660"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.server.static_root_path` {#opt-services.grafana.settings.server.static_root_path}

Root path for static assets.

*Type:* string

*Default:* `"${package}/share/grafana/public"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.cert_file` {#opt-services.grafana.settings.smtp.cert_file}

File path to a cert file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.ehlo_identity` {#opt-services.grafana.settings.smtp.ehlo_identity}

Name to be used as client identity for EHLO in SMTP dialog.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.enabled` {#opt-services.grafana.settings.smtp.enabled}

Whether to enable SMTP.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.from_address` {#opt-services.grafana.settings.smtp.from_address}

Address used when sending out emails.

*Type:* string

*Default:* `"admin@grafana.localhost"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.from_name` {#opt-services.grafana.settings.smtp.from_name}

Name to be used as client identity for EHLO in SMTP dialog.

*Type:* string

*Default:* `"Grafana"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.host` {#opt-services.grafana.settings.smtp.host}

Host to connect to.

*Type:* string

*Default:* `"localhost:25"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.key_file` {#opt-services.grafana.settings.smtp.key_file}

File path to a key file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.password` {#opt-services.grafana.settings.smtp.password}

Password used for authentication. Please note that the contents of this option
will end up in a world-readable Nix store. Use the file provider
pointing at a reasonably secured file in the local filesystem
to work around that. Look at the documentation for details:
[https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#file-provider)

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.skip_verify` {#opt-services.grafana.settings.smtp.skip_verify}

Verify SSL for SMTP server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.startTLS_policy` {#opt-services.grafana.settings.smtp.startTLS_policy}

StartTLS policy when connecting to server.

*Type:* null or one of "OpportunisticStartTLS", "MandatoryStartTLS", "NoStartTLS"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.smtp.user` {#opt-services.grafana.settings.smtp.user}

User used for authentication.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.allow_org_create` {#opt-services.grafana.settings.users.allow_org_create}

Set to `false` to prohibit users from creating new organizations.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.allow_sign_up` {#opt-services.grafana.settings.users.allow_sign_up}

Set to false to prohibit users from being able to sign up / create user accounts.
The admin user can still create users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.auto_assign_org` {#opt-services.grafana.settings.users.auto_assign_org}

Set to `true` to automatically add new users to the main organization (id 1).
When set to `false,` new users automatically cause a new organization to be created for that new user.
The organization will be created even if the `allow_org_create` setting is set to `false`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.auto_assign_org_id` {#opt-services.grafana.settings.users.auto_assign_org_id}

Set this value to automatically add new users to the provided org.
This requires `auto_assign_org` to be set to `true`.
Please make sure that this organization already exists.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.auto_assign_org_role` {#opt-services.grafana.settings.users.auto_assign_org_role}

The role new users will be assigned for the main organization (if the `auto_assign_org` setting is set to `true`).

*Type:* one of "Viewer", "Editor", "Admin"

*Default:* `"Viewer"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.default_language` {#opt-services.grafana.settings.users.default_language}

This setting configures the default UI language, which must be a supported IETF language tag, such as `en-US`.

*Type:* string

*Default:* `"en-US"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.default_theme` {#opt-services.grafana.settings.users.default_theme}

Sets the default UI theme. `system` matches the user's system theme.

*Type:* one of "dark", "light", "system"

*Default:* `"dark"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.hidden_users` {#opt-services.grafana.settings.users.hidden_users}

This is a comma-separated list of usernames.
Users specified here are hidden in the Grafana UI.
They are still visible to Grafana administrators and to themselves.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.home_page` {#opt-services.grafana.settings.users.home_page}

Path to a custom home page.
Users are only redirected to this if the default home dashboard is used.
It should match a frontend route and contain a leading slash.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.login_hint` {#opt-services.grafana.settings.users.login_hint}

Text used as placeholder text on login page for login/username input.

*Type:* string

*Default:* `"email or username"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.password_hint` {#opt-services.grafana.settings.users.password_hint}

Text used as placeholder text on login page for password input.

*Type:* string

*Default:* `"password"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.user_invite_max_lifetime_duration` {#opt-services.grafana.settings.users.user_invite_max_lifetime_duration}

The duration in time a user invitation remains valid before expiring.
This setting should be expressed as a duration.
Examples: `6h` (hours), `2d` (days), `1w` (week).
The minimum supported duration is `15m` (15 minutes).

*Type:* string

*Default:* `"24h"`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.verify_email_enabled` {#opt-services.grafana.settings.users.verify_email_enabled}

Require email validation before sign up completes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana.settings.users.viewers_can_edit` {#opt-services.grafana.settings.users.viewers_can_edit}

Viewers can access and use Explore and perform temporary edits on panels in dashboards they have access to.
They cannot save their changes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/grafana.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana.nix)

## `services.grafana_reporter.addr` {#opt-services.grafana_reporter.addr}

Listening address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-reporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-reporter.nix)

## `services.grafana_reporter.enable` {#opt-services.grafana_reporter.enable}

Whether to enable grafana\_reporter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/grafana-reporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-reporter.nix)

## `services.grafana_reporter.grafana.addr` {#opt-services.grafana_reporter.grafana.addr}

Grafana address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-reporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-reporter.nix)

## `services.grafana_reporter.grafana.port` {#opt-services.grafana_reporter.grafana.port}

Grafana port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/monitoring/grafana-reporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-reporter.nix)

## `services.grafana_reporter.grafana.protocol` {#opt-services.grafana_reporter.grafana.protocol}

Grafana protocol.

*Type:* one of "http", "https"

*Default:* `"http"`

*Declared by:* [`nixos/modules/services/monitoring/grafana-reporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-reporter.nix)

## `services.grafana_reporter.port` {#opt-services.grafana_reporter.port}

Listening port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8686`

*Declared by:* [`nixos/modules/services/monitoring/grafana-reporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-reporter.nix)

## `services.grafana_reporter.templateDir` {#opt-services.grafana_reporter.templateDir}

Optional template directory to use custom tex templates

*Type:* string or absolute path

*Default:* `pkgs.grafana_reporter`

*Declared by:* [`nixos/modules/services/monitoring/grafana-reporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/grafana-reporter.nix)

## `services.graphite.carbon.aggregationRules` {#opt-services.graphite.carbon.aggregationRules}

Defines if and how received metrics will be aggregated.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  <env>.applications.<app>.all.requests (60) = sum <env>.applications.<app>.*.requests
  <env>.applications.<app>.all.latency (60) = avg <env>.applications.<app>.*.latency
''
```

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.blacklist` {#opt-services.graphite.carbon.blacklist}

Any metrics received which match one of the expressions will be dropped.

*Type:* null or string

*Default:* `null`

*Example:* `"^some\\.noisy\\.metric\\.prefix\\..*"`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.config` {#opt-services.graphite.carbon.config}

Content of carbon configuration file.

*Type:* string

*Default:*

``` nix
''
  [cache]
  # Listen on localhost by default for security reasons
  UDP_RECEIVER_INTERFACE = 127.0.0.1
  PICKLE_RECEIVER_INTERFACE = 127.0.0.1
  LINE_RECEIVER_INTERFACE = 127.0.0.1
  CACHE_QUERY_INTERFACE = 127.0.0.1
  # Do not log every update
  LOG_UPDATES = False
  LOG_CACHE_HITS = False
''
```

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.enableAggregator` {#opt-services.graphite.carbon.enableAggregator}

Whether to enable carbon aggregator, the carbon buffering service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.enableCache` {#opt-services.graphite.carbon.enableCache}

Whether to enable carbon cache, the graphite storage daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.enableRelay` {#opt-services.graphite.carbon.enableRelay}

Whether to enable carbon relay, the carbon replication and sharding service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.relayRules` {#opt-services.graphite.carbon.relayRules}

Relay rules are used to send certain metrics to a certain backend.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  [example]
  pattern = ^mydata\.foo\..+
  servers = 10.1.2.3, 10.1.2.4:2004, myserver.mydomain.com
''
```

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.rewriteRules` {#opt-services.graphite.carbon.rewriteRules}

Regular expression patterns that can be used to rewrite metric names
in a search and replace fashion.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  [post]
  _sum$ =
  _avg$ =
''
```

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.storageAggregation` {#opt-services.graphite.carbon.storageAggregation}

Defines how to aggregate data to lower-precision retentions.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  [all_min]
  pattern = \.min$
  xFilesFactor = 0.1
  aggregationMethod = min
''
```

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.storageSchemas` {#opt-services.graphite.carbon.storageSchemas}

Defines retention rates for storing metrics.

*Type:* null or string

*Default:* `""`

*Example:*

``` nix
''
  [apache_busyWorkers]
  pattern = ^servers\.www.*\.workers\.busyWorkers$
  retentions = 15s:7d,1m:21d,15m:5y
''
```

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.carbon.whitelist` {#opt-services.graphite.carbon.whitelist}

Only metrics received which match one of the expressions will be persisted.

*Type:* null or string

*Default:* `null`

*Example:* `".*"`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.dataDir` {#opt-services.graphite.dataDir}

Data directory for graphite.

*Type:* absolute path

*Default:* `"/var/db/graphite"`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.seyren.enable` {#opt-services.graphite.seyren.enable}

Whether to enable seyren service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.seyren.extraConfig` {#opt-services.graphite.seyren.extraConfig}

Extra seyren configuration. See
[https://github.com/scobal/seyren#config](https://github.com/scobal/seyren#config)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  GRAPHITE_USERNAME = "user";
  GRAPHITE_PASSWORD = "pass";
}
```

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.seyren.graphiteUrl` {#opt-services.graphite.seyren.graphiteUrl}

Host where graphite service runs.

*Type:* string

*Default:* `"http://${config.services.graphite.web.listenAddress}:${toString config.services.graphite.web.port}"`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.seyren.mongoUrl` {#opt-services.graphite.seyren.mongoUrl}

Mongodb connection string.

*Type:* string

*Default:* `"mongodb://${config.services.mongodb.bind_ip}:27017/seyren"`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.seyren.port` {#opt-services.graphite.seyren.port}

Seyren listening port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8081`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.seyren.seyrenUrl` {#opt-services.graphite.seyren.seyrenUrl}

Host where seyren is accessible.

*Type:* string

*Default:* `"http://localhost:${toString config.services.graphite.seyren.port}/"`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.web.enable` {#opt-services.graphite.web.enable}

Whether to enable graphite web frontend.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.web.extraConfig` {#opt-services.graphite.web.extraConfig}

Graphite webapp settings. See:
[https://graphite.readthedocs.io/en/latest/config-local-settings.html](https://graphite.readthedocs.io/en/latest/config-local-settings.html)

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.web.listenAddress` {#opt-services.graphite.web.listenAddress}

Graphite web frontend listen address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.graphite.web.port` {#opt-services.graphite.web.port}

Graphite web frontend port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/monitoring/graphite.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/graphite.nix)

## `services.grav.enable` {#opt-services.grav.enable}

Whether to enable grav.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grav.nix)

## `services.grav.maxUploadSize` {#opt-services.grav.maxUploadSize}

The upload limit for files. This changes the relevant options in
`php.ini` and nginx if enabled.

*Type:* string

*Default:* `"128M"`

*Declared by:* [`nixos/modules/services/web-apps/grav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grav.nix)

## `services.grav.package` {#opt-services.grav.package}

The grav package to use.

*Type:* package

*Default:*

``` nix
if versionAtLeast config.system.stateVersion "26.11" then
  pkgs.grav_2
else
  pkgs.grav
```

*Declared by:* [`nixos/modules/services/web-apps/grav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grav.nix)

## `services.grav.phpPackage` {#opt-services.grav.phpPackage}

The php83 package to use.

*Type:* package

*Default:* `pkgs.php83`

*Declared by:* [`nixos/modules/services/web-apps/grav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grav.nix)

## `services.grav.pool` {#opt-services.grav.pool}

Name of existing phpfpm pool that is used to run web-application.
If not specified a pool will be created automatically with
default values.

*Type:* string

*Default:* `"grav"`

*Declared by:* [`nixos/modules/services/web-apps/grav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grav.nix)

## `services.grav.root` {#opt-services.grav.root}

Root of the application.

*Type:* absolute path

*Default:* `"/var/lib/grav"`

*Declared by:* [`nixos/modules/services/web-apps/grav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grav.nix)

## `services.grav.systemSettings` {#opt-services.grav.systemSettings}

Settings written to `user/config/system.yaml`.

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  log = {
    handler = "syslog";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/grav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grav.nix)

## `services.grav.virtualHost` {#opt-services.grav.virtualHost}

Name of the nginx virtualhost to use and setup. If null, do not setup
any virtualhost.

*Type:* null or string

*Default:* `"grav"`

*Declared by:* [`nixos/modules/services/web-apps/grav.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grav.nix)

## `services.graylog.dataDir` {#opt-services.graylog.dataDir}

Directory used to store Graylog server state.

*Type:* string

*Default:* `"/var/lib/graylog/data"`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.elasticsearchHosts` {#opt-services.graylog.elasticsearchHosts}

List of valid URIs of the http ports of your elastic nodes. If one or more of your elasticsearch hosts require authentication, include the credentials in each node URI that requires authentication

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "http://node1:9200" "http://user:password@node2:19200" ]`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.enable` {#opt-services.graylog.enable}

Whether to enable Graylog, a log management solution.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.extraConfig` {#opt-services.graylog.extraConfig}

Any other configuration options you might want to add

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.isMaster` {#opt-services.graylog.isMaster}

Whether this is the master instance of your Graylog cluster

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.messageJournalDir` {#opt-services.graylog.messageJournalDir}

The directory which will be used to store the message journal. The directory must be exclusively used by Graylog and must not contain any other files than the ones created by Graylog itself

*Type:* string

*Default:* `"/var/lib/graylog/data/journal"`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.mongodbUri` {#opt-services.graylog.mongodbUri}

MongoDB connection string. See http://docs.mongodb.org/manual/reference/connection-string/ for details

*Type:* string

*Default:* `"mongodb://localhost/graylog"`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.nodeIdFile` {#opt-services.graylog.nodeIdFile}

Path of the file containing the graylog node-id

*Type:* string

*Default:* `"/var/lib/graylog/server/node-id"`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.package` {#opt-services.graylog.package}

The graylog package to use.

*Type:* package

*Default:* `pkgs.graylog`

*Example:* `graylog-6_0`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.passwordSecret` {#opt-services.graylog.passwordSecret}

You MUST set a secret to secure/pepper the stored user passwords here. Use at least 64 characters.
Generate one by using for example: pwgen -N 1 -s 96

*Type:* string

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.plugins` {#opt-services.graylog.plugins}

Extra graylog plugins

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.rootPasswordSha2` {#opt-services.graylog.rootPasswordSha2}

You MUST specify a hash password for the root user (which you only need to initially set up the
system and in case you lose connectivity to your authentication backend)
This password cannot be changed using the API or via the web interface. If you need to change it,
modify it here.
Create one by using for example: echo -n yourpassword | shasum -a 256
and use the resulting hash value as string for the option

*Type:* string

*Example:* `"e3c652f0ba0b4801205814f8b6bc49672c4c74e25b497770bb89b22cdeb4e952"`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.rootUsername` {#opt-services.graylog.rootUsername}

Name of the default administrator user

*Type:* string

*Default:* `"admin"`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.graylog.user` {#opt-services.graylog.user}

User account under which graylog runs

*Type:* string

*Default:* `"graylog"`

*Declared by:* [`nixos/modules/services/logging/graylog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/graylog.nix)

## `services.greenclip.enable` {#opt-services.greenclip.enable}

Whether to enable Greenclip, a clipboard manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/greenclip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/greenclip.nix)

## `services.greenclip.package` {#opt-services.greenclip.package}

The greenclip package to use.

*Type:* package

*Default:* `pkgs.haskellPackages.greenclip`

*Declared by:* [`nixos/modules/services/misc/greenclip.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/greenclip.nix)

## `services.greenlight.configureNginx` {#opt-services.greenlight.configureNginx}

Configure nginx as a reverse proxy for Greenlight.
Alternatively you can configure a reverse-proxy of your choice to serve specific
paths. Take a look at Greenlight's provided reverse proxy configurations at
`https://github.com/bigbluebutton/greenlight/blob/master/greenlight-v3.nginx`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.database.createLocally` {#opt-services.greenlight.database.createLocally}

Whether to configure a local PostgreSQL server and database for Greenlight.
The connection is performed via Unix sockets.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.database.host` {#opt-services.greenlight.database.host}

Hostname or address of the postgresql server. If an absolute path is given here, it will be interpreted as a unix socket path.

*Type:* string

*Default:* `"/run/postgresql"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.database.name` {#opt-services.greenlight.database.name}

The name of the Greenlight database.

*Type:* string

*Default:* `"greenlight"`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.database.passwordFile` {#opt-services.greenlight.database.passwordFile}

A file containing the password corresponding to [`services.greenlight.database.user`](#opt-services.greenlight.database.user).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/greenlight-db-password"`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.database.port` {#opt-services.greenlight.database.port}

Port of the postgresql server.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5432`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.database.user` {#opt-services.greenlight.database.user}

The database user for Greenlight.

*Type:* string

*Default:* `"greenlight"`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.enable` {#opt-services.greenlight.enable}

Whether to enable Greenlight web interface for BigBlueButton.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.group` {#opt-services.greenlight.group}

Group under which Greenlight runs.

*Type:* string

*Default:* `"greenlight"`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.package` {#opt-services.greenlight.package}

The greenlight package to use.

*Type:* package

*Default:* `pkgs.greenlight`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.redis.createLocally` {#opt-services.greenlight.redis.createLocally}

Whether to configure a local Redis server for Greenlight.
The connection is performed via Unix sockets by default,
but that can be changed by configuring [`services.greenlight.redis.host`](#opt-services.greenlight.redis.host) and [`services.greenlight.redis.port`](#opt-services.greenlight.redis.port).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.redis.host` {#opt-services.greenlight.redis.host}

The redis host Greenlight will connect to.

*Type:* string

*Default:* `config.services.redis.servers.greenlight.unixSocket`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.redis.port` {#opt-services.greenlight.redis.port}

The port of the redis server Greenlight will connect to. Set to zero to disable TCP and use Unix sockets instead.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.secretKeyBaseFile` {#opt-services.greenlight.secretKeyBaseFile}

Path to file containing the secret key base.
The content of the file will be sourced into `SECRET_KEY_BASE` environment
variable. The secret has a minimum length requirement of 64 bytes.

One way to generate such a secret is to use `openssl rand -hex 64`.

This file is loaded using systemd credentials, and therefore does not need to be
owned by the greenlight user.

If this option is null, it will be created at /var/lib/greenlight/secrets/secret-key-base
with a new secret key base.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.settings` {#opt-services.greenlight.settings}

Extra configuration options to append or override.
For available and default option values see
[upstream configuration file](https://github.com/bigbluebutton/greenlight/blob/master/sample.env).

*Type:* open submodule of attribute set of (null or string or boolean or signed integer or 16 bit unsigned integer; between 0 and 65535 (both inclusive) or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.settings.BINDING` {#opt-services.greenlight.settings.BINDING}

Address for the puma daemon to bind to.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.settings.PORT` {#opt-services.greenlight.settings.PORT}

Port for the puma daemon to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6346`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.settings.URL_HOST` {#opt-services.greenlight.settings.URL_HOST}

Hostname to use

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greenlight.user` {#opt-services.greenlight.user}

User under which Greenlight runs. If it is set to "greenlight",
that user will be created, otherwise it should be set to the
name of a user created elsewhere.

*Type:* string

*Default:* `"greenlight"`

*Declared by:* [`nixos/modules/services/web-apps/greenlight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/greenlight.nix)

## `services.greetd.enable` {#opt-services.greetd.enable}

Whether to enable greetd, a minimal and flexible login manager daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/display-managers/greetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/greetd.nix)

## `services.greetd.package` {#opt-services.greetd.package}

The greetd package to use.

*Type:* package

*Default:* `pkgs.greetd`

*Declared by:* [`nixos/modules/services/display-managers/greetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/greetd.nix)

## `services.greetd.restart` {#opt-services.greetd.restart}

Whether to restart greetd when it terminates (e.g. on failure).
This is usually desirable so a user can always log in, but should be disabled when using 'settings.initial\_session' (autologin),
because every greetd restart will trigger the autologin again.

*Type:* boolean

*Default:* `!(config.services.greetd.settings ? initial_session)`

*Declared by:* [`nixos/modules/services/display-managers/greetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/greetd.nix)

## `services.greetd.settings` {#opt-services.greetd.settings}

greetd configuration ([documentation](https://man.sr.ht/~kennylevinsen/greetd/))
as a Nix attribute set.

*Type:* TOML value

*Example:*

``` nix
{
  default_session = {
    command = "${pkgs.greetd}/bin/agreety --cmd sway";
  };
}
```

*Declared by:* [`nixos/modules/services/display-managers/greetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/greetd.nix)

## `services.greetd.useTextGreeter` {#opt-services.greetd.useTextGreeter}

Whether the greeter uses text-based user interfaces (For example, tuigreet).

When set to true, some systemd service configuration will be adjusted to avoid systemd boot messages interrupt TUI.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/display-managers/greetd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/display-managers/greetd.nix)

## `services.grimmory.bookdropDir` {#opt-services.grimmory.bookdropDir}

Path to directory where Grimmory watches for books to import. (`APP_BOOKDROP_FOLDER`)

*Type:* string

*Default:* `"\${cfg.stateDir}/bookdrop"`

*Example:* `"/bookdrop"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.booksDir` {#opt-services.grimmory.booksDir}

Path to root directory of book library.

*Type:* string

*Default:* `"\${cfg.stateDir}/books"`

*Example:* `"/books"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.caddy.enable` {#opt-services.grimmory.caddy.enable}

Whether to enable a virtualhost to serve Grimmory through caddy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.caddy.virtualHost` {#opt-services.grimmory.caddy.virtualHost}

Extra configuration for the caddy virtualhost for Grimmory.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [ "grimmory.${config.networking.domain}" ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.caddy.virtualHost.extraConfig` {#opt-services.grimmory.caddy.virtualHost.extraConfig}

Additional lines of configuration appended to this virtual host in the
automatically generated `Caddyfile`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.caddy.virtualHost.hostName` {#opt-services.grimmory.caddy.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.caddy.virtualHost.listenAddresses` {#opt-services.grimmory.caddy.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.caddy.virtualHost.logFormat` {#opt-services.grimmory.caddy.virtualHost.logFormat}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.caddy.virtualHost.serverAliases` {#opt-services.grimmory.caddy.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.caddy.virtualHost.useACMEHost` {#opt-services.grimmory.caddy.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is mostly useful if you use DNS challenges but Caddy does not
currently support your provider.

*Note that this option does not create any certificates, nor
does it add subdomains to existing ones – you will need to create them
manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.database.createLocally` {#opt-services.grimmory.database.createLocally}

Create a local MariaDB database and user for Grimmory via `services.mysql`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.database.host` {#opt-services.grimmory.database.host}

MySQL Database host (`DATABASE_HOST`)

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.database.name` {#opt-services.grimmory.database.name}

MySQL database name that holds Grimmory's data. (`DATABASE_NAME`)

*Type:* string

*Default:* `"grimmory"`

*Example:* `"booklore"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.database.passwordFile` {#opt-services.grimmory.database.passwordFile}

A file containing the password for the database named `database.name`.

> A password file is currently required, but should be avoidable in a future release

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/grimmory-db-password"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.database.port` {#opt-services.grimmory.database.port}

MySQL Database port (`DATABASE_PORT`)

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.database.user` {#opt-services.grimmory.database.user}

Name of the user with all permissions to the Grimmory MySQL database. (`DATABASE_USERNAME`)

*Type:* string

*Default:* `"grimmory"`

*Example:* `"booklore"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.domain` {#opt-services.grimmory.domain}

Domain to use for the virtualhost to serve Grimmory at.

*Type:* string

*Example:* `grimmory.${config.networking.domain}`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.enable` {#opt-services.grimmory.enable}

Whether to enable Whether to enable Grimmory Server..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.environment` {#opt-services.grimmory.environment}

Environment variables passed passed into the backend server.

Some variables are defined here: [https://grimmory.org/docs/installation](https://grimmory.org/docs/installation)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  FORCE_DISABLE_OIDC = "true";
}
```

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.environmentFile` {#opt-services.grimmory.environmentFile}

Optional path to an `EnvironmentFile` to configure or add secrets to Grimmory service.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.extraArgs` {#opt-services.grimmory.extraArgs}

Additional command-line arguments passed verbatim to grimmory after -jar grimmory.jar

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.group` {#opt-services.grimmory.group}

Group under which Grimmory runs.

*Type:* string

*Default:* `"grimmory"`

*Example:* `"media"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.host` {#opt-services.grimmory.host}

Listen address which Grimmory should listen on. (`SERVER_ADDRESS`)

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.enable` {#opt-services.grimmory.nginx.enable}

Whether to enable a virtualhost to serve Grimmory through nginx.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost` {#opt-services.grimmory.nginx.virtualHost}

Extra configuration for the nginx virtualhost for Grimmory.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [ "grimmory.${config.networking.domain}" ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.acmeFallbackHost` {#opt-services.grimmory.nginx.virtualHost.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.acmeRoot` {#opt-services.grimmory.nginx.virtualHost.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.addSSL` {#opt-services.grimmory.nginx.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.basicAuth` {#opt-services.grimmory.nginx.virtualHost.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.basicAuthFile` {#opt-services.grimmory.nginx.virtualHost.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.default` {#opt-services.grimmory.nginx.virtualHost.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.enableACME` {#opt-services.grimmory.nginx.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.extraConfig` {#opt-services.grimmory.nginx.virtualHost.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.forceSSL` {#opt-services.grimmory.nginx.virtualHost.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.globalRedirect` {#opt-services.grimmory.nginx.virtualHost.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.http2` {#opt-services.grimmory.nginx.virtualHost.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.http3` {#opt-services.grimmory.nginx.virtualHost.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.http3_hq` {#opt-services.grimmory.nginx.virtualHost.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.kTLS` {#opt-services.grimmory.nginx.virtualHost.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.listen` {#opt-services.grimmory.nginx.virtualHost.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.listen.*.addr` {#opt-services.grimmory.nginx.virtualHost.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.listen.*.extraParameters` {#opt-services.grimmory.nginx.virtualHost.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.listen.*.port` {#opt-services.grimmory.nginx.virtualHost.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.listen.*.proxyProtocol` {#opt-services.grimmory.nginx.virtualHost.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.listen.*.ssl` {#opt-services.grimmory.nginx.virtualHost.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.listenAddresses` {#opt-services.grimmory.nginx.virtualHost.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations` {#opt-services.grimmory.nginx.virtualHost.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.alias` {#opt-services.grimmory.nginx.virtualHost.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.basicAuth` {#opt-services.grimmory.nginx.virtualHost.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.basicAuthFile` {#opt-services.grimmory.nginx.virtualHost.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.extraConfig` {#opt-services.grimmory.nginx.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.fastcgiParams` {#opt-services.grimmory.nginx.virtualHost.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.index` {#opt-services.grimmory.nginx.virtualHost.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.priority` {#opt-services.grimmory.nginx.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.proxyPass` {#opt-services.grimmory.nginx.virtualHost.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.proxyWebsockets` {#opt-services.grimmory.nginx.virtualHost.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.recommendedProxySettings` {#opt-services.grimmory.nginx.virtualHost.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.recommendedUwsgiSettings` {#opt-services.grimmory.nginx.virtualHost.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.return` {#opt-services.grimmory.nginx.virtualHost.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.root` {#opt-services.grimmory.nginx.virtualHost.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.tryFiles` {#opt-services.grimmory.nginx.virtualHost.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.useGrpcErrorPages` {#opt-services.grimmory.nginx.virtualHost.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.locations.<name>.uwsgiPass` {#opt-services.grimmory.nginx.virtualHost.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.onlySSL` {#opt-services.grimmory.nginx.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.quic` {#opt-services.grimmory.nginx.virtualHost.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.redirectCode` {#opt-services.grimmory.nginx.virtualHost.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.rejectSSL` {#opt-services.grimmory.nginx.virtualHost.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.reuseport` {#opt-services.grimmory.nginx.virtualHost.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.root` {#opt-services.grimmory.nginx.virtualHost.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.serverAliases` {#opt-services.grimmory.nginx.virtualHost.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.serverName` {#opt-services.grimmory.nginx.virtualHost.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.sslCertificate` {#opt-services.grimmory.nginx.virtualHost.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.sslCertificateKey` {#opt-services.grimmory.nginx.virtualHost.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.sslTrustedCertificate` {#opt-services.grimmory.nginx.virtualHost.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.nginx.virtualHost.useACMEHost` {#opt-services.grimmory.nginx.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.package` {#opt-services.grimmory.package}

The grimmory package to use.

*Type:* package

*Default:* `pkgs.grimmory`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.port` {#opt-services.grimmory.port}

Port on which Grimmory should listen on. (`BOOKLORE_PORT`)

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6060`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.stateDir` {#opt-services.grimmory.stateDir}

State and configuration directory Grimmory will use. (`APP_PATH_CONFIG`)

*Type:* string

*Default:* `"/var/lib/grimmory"`

*Example:* `"/grimmory"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grimmory.user` {#opt-services.grimmory.user}

User account under which Grimmory runs.

*Type:* string

*Default:* `"grimmory"`

*Example:* `"media"`

*Declared by:* [`nixos/modules/services/web-apps/grimmory.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grimmory.nix)

## `services.grist.enable` {#opt-services.grist.enable}

Whether to enable Grist.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.enableEnterprise` {#opt-services.grist.enableEnterprise}

Whether to enable Grist enterprise code.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.enableRedis` {#opt-services.grist.enableRedis}

Whether to enable Grist redis data store.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment` {#opt-services.grist.environment}

Environment variables used for Grist.

See [](https://github.com/gristlabs/grist-core/#environment-variables)
for available environment variables.

*Type:* open submodule of attribute set of (null or string)

*Default:* `{ }`

*Example:*

``` nix
{
  GRIST_DEFAULT_EMAIL = "example@example.com";
}
```

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GRIST_BOOT_KEY` {#opt-services.grist.environment.GRIST_BOOT_KEY}

Grist password for first time configuration of your instance. You must remove it when your instance is configured.

If null, this will be unset.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GRIST_DATA_DIR` {#opt-services.grist.environment.GRIST_DATA_DIR}

Directory in which to store documents.

*Type:* absolute path

*Default:* `"/var/lib/grist-core/docs"`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GRIST_DEFAULT_EMAIL` {#opt-services.grist.environment.GRIST_DEFAULT_EMAIL}

The user who logs in with the email defined by
GRIST\_DEFAULT\_EMAIL is the administrator of this Grist
installation. When Grist runs for the first time, it will create
an account set to the value of GRIST\_DEFAULT\_EMAIL.

If null, this will be unset.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GRIST_HOST` {#opt-services.grist.environment.GRIST_HOST}

Address to listen on

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GRIST_INST_DIR` {#opt-services.grist.environment.GRIST_INST_DIR}

Path to Grist instance configuration files, for Grist server.

*Type:* absolute path

*Default:* `"/var/lib/grist-core"`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GRIST_SANDBOX_FLAVOR` {#opt-services.grist.environment.GRIST_SANDBOX_FLAVOR}

Sandbox to use for grist documents. Only "gvisor" is supported.

*Type:* null or string

*Default:* `"gvisor"`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GRIST_USER_ROOT` {#opt-services.grist.environment.GRIST_USER_ROOT}

An extra path to look for plugins in - Grist will scan for plugins in $GRIST\_USER\_ROOT/plugins.

*Type:* absolute path

*Default:* `"/var/lib/grist-core"`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GVISOR_AVAILABLE` {#opt-services.grist.environment.GVISOR_AVAILABLE}

Whether gvisor is available for Grist.

*Type:* string

*Default:* `"1"`

*Read only*

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.GVISOR_FLAGS` {#opt-services.grist.environment.GVISOR_FLAGS}

The flags that are passed on to gVisor when creating a sandbox.

*Type:* list of string

*Default:*

``` nix
[
  "-rootless"
]
```

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.TYPEORM_DATABASE` {#opt-services.grist.environment.TYPEORM_DATABASE}

Database filename for sqlite or database name for other db types.

*Type:* string

*Default:* `"/var/lib/grist-core/db.sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environment.TYPEORM_TYPE` {#opt-services.grist.environment.TYPEORM_TYPE}

Which database type to use for storage.

*Type:* one of "sqlite", "postgres"

*Default:* `"sqlite"`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.environmentFiles` {#opt-services.grist.environmentFiles}

Environment files for secrets.

You must at least set GRIST\_SESSION\_KEY there.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grist.package` {#opt-services.grist.package}

The grist-core package to use.

*Type:* package

*Default:* `pkgs.grist-core`

*Declared by:* [`nixos/modules/services/web-apps/grist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grist.nix)

## `services.grocy.dataDir` {#opt-services.grocy.dataDir}

Home directory of the `grocy` user which contains
the application's state.

*Type:* string

*Default:* `"/var/lib/grocy"`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.enable` {#opt-services.grocy.enable}

Whether to enable grocy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.extraConfig` {#opt-services.grocy.extraConfig}

These lines go at the end of config.php verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Setting('FEATURE_FLAG_RECIPES', false);
  Setting('FEATURE_FLAG_STOCK_PRODUCT_FREEZING', false);
''
```

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.hostName` {#opt-services.grocy.hostName}

FQDN for the grocy instance.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.nginx.enableSSL` {#opt-services.grocy.nginx.enableSSL}

Whether or not to enable SSL (with ACME and let's encrypt)
for the grocy vhost.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.package` {#opt-services.grocy.package}

The grocy package to use.

*Type:* package

*Default:* `pkgs.grocy`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.phpfpm.settings` {#opt-services.grocy.phpfpm.settings}

Options for grocy's PHPFPM pool.

*Type:* attribute set of (signed integer or string or boolean)

*Default:*

``` nix
{
  "pm" = "dynamic";
  "php_admin_value[error_log]" = "stderr";
  "php_admin_flag[log_errors]" = true;
  "listen.owner" = config.services.nginx.user;
  "catch_workers_output" = true;
  "pm.max_children" = "32";
  "pm.start_servers" = "2";
  "pm.min_spare_servers" = "2";
  "pm.max_spare_servers" = "4";
  "pm.max_requests" = "500";
}
```

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.settings.calendar.firstDayOfWeek` {#opt-services.grocy.settings.calendar.firstDayOfWeek}

Which day of the week (0=Sunday, 1=Monday etc.) should be the
first day.

*Type:* null or one of 0, 1, 2, 3, 4, 5, 6

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.settings.calendar.showWeekNumber` {#opt-services.grocy.settings.calendar.showWeekNumber}

Show the number of the weeks in the calendar views.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.settings.culture` {#opt-services.grocy.settings.culture}

Display language of the frontend.

*Type:* one of "bg\_BG", "ca", "cs", "da", "de", "el\_GR", "en", "en\_GB", "es", "et\_EE", "fi", "fr", "he\_IL", "hu", "it", "ja", "ko\_KR", "lt", "nl", "no", "pl", "pt\_BR", "pt\_PT", "ro\_RO", "ru", "sk\_SK", "sl", "sv\_SE", "ta", "tr", "uk", "zh\_CN", "zh\_TW"

*Default:* `"en"`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.settings.currency` {#opt-services.grocy.settings.currency}

ISO 4217 code for the currency to display.

*Type:* string

*Default:* `"USD"`

*Example:* `"EUR"`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.grocy.settings.entryPage` {#opt-services.grocy.settings.entryPage}

Specify an custom homepage if desired.

*Type:* one of "stock", "shoppinglist", "recipes", "chores", "tasks", "batteries", "equipment", "calendar", "mealplan"

*Default:* `"stock"`

*Declared by:* [`nixos/modules/services/web-apps/grocy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/grocy.nix)

## `services.gs1200-exporter.address` {#opt-services.gs1200-exporter.address}

IP address or hostname of the GS1200 switch.

*Type:* string

*Example:* `"192.168.1.3"`

*Declared by:* [`nixos/modules/services/monitoring/gs1200-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gs1200-exporter.nix)

## `services.gs1200-exporter.debug` {#opt-services.gs1200-exporter.debug}

Enable debug logging. Logs are accessible via journalctl -u gs1200-exporter.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/gs1200-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gs1200-exporter.nix)

## `services.gs1200-exporter.enable` {#opt-services.gs1200-exporter.enable}

Whether to enable gs1200-exporter.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/gs1200-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gs1200-exporter.nix)

## `services.gs1200-exporter.json` {#opt-services.gs1200-exporter.json}

Output logs in JSON format. Logs are accessible via journalctl -u gs1200-exporter.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/gs1200-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gs1200-exporter.nix)

## `services.gs1200-exporter.passwordFile` {#opt-services.gs1200-exporter.passwordFile}

Path to a file containing the password to log in to the GS1200 web interface.
This is the recommended option as it avoids storing the password in the Nix store.
Compatible with sops-nix and agenix.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/gs1200-password"`

*Declared by:* [`nixos/modules/services/monitoring/gs1200-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gs1200-exporter.nix)

## `services.gs1200-exporter.port` {#opt-services.gs1200-exporter.port}

Port on which to expose Prometheus metrics.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9934`

*Declared by:* [`nixos/modules/services/monitoring/gs1200-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gs1200-exporter.nix)

## `services.gs1200-exporter.verbose` {#opt-services.gs1200-exporter.verbose}

Enable verbose logging. Logs are accessible via journalctl -u gs1200-exporter.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/gs1200-exporter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/gs1200-exporter.nix)

## `services.guacamole-client.enable` {#opt-services.guacamole-client.enable}

Whether to enable Apache Guacamole Client (Tomcat).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-client.nix)

## `services.guacamole-client.enableWebserver` {#opt-services.guacamole-client.enableWebserver}

Enable the Guacamole web application in a Tomcat webserver.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-client.nix)

## `services.guacamole-client.logbackXml` {#opt-services.guacamole-client.logbackXml}

Configuration file that correspond to `logback.xml`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/logback.xml"`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-client.nix)

## `services.guacamole-client.package` {#opt-services.guacamole-client.package}

The guacamole-client package to use.

*Type:* package

*Default:* `pkgs.guacamole-client`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-client.nix)

## `services.guacamole-client.settings` {#opt-services.guacamole-client.settings}

Configuration written to `guacamole.properties`.

::: note
The Guacamole web application uses one main configuration file called
`guacamole.properties`. This file is the common location for all
configuration properties read by Guacamole or any extension of
Guacamole, including authentication providers.
:::

*Type:* open submodule of attribute set of (string, package, bool, int or float)

*Default:*

``` nix
{
  guacd-hostname = "localhost";
  guacd-port = 4822;
}
```

*Declared by:* [`nixos/modules/services/web-apps/guacamole-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-client.nix)

## `services.guacamole-client.userMappingXml` {#opt-services.guacamole-client.userMappingXml}

Configuration file that correspond to `user-mapping.xml`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/user-mapping.xml"`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-client.nix)

## `services.guacamole-server.enable` {#opt-services.guacamole-server.enable}

Whether to enable Apache Guacamole Server (guacd).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-server.nix)

## `services.guacamole-server.extraEnvironment` {#opt-services.guacamole-server.extraEnvironment}

Environment variables to pass to guacd.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  ENVIRONMENT = "production";
}
```

*Declared by:* [`nixos/modules/services/web-apps/guacamole-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-server.nix)

## `services.guacamole-server.host` {#opt-services.guacamole-server.host}

The host name or IP address the server should listen to.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-server.nix)

## `services.guacamole-server.package` {#opt-services.guacamole-server.package}

The guacamole-server package to use.

*Type:* package

*Default:* `pkgs.guacamole-server`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-server.nix)

## `services.guacamole-server.port` {#opt-services.guacamole-server.port}

The port the guacd server should listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4822`

*Declared by:* [`nixos/modules/services/web-apps/guacamole-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/guacamole-server.nix)

## `services.guix.enable` {#opt-services.guix.enable}

Whether to enable Guix build daemon service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.extraArgs` {#opt-services.guix.extraArgs}

Extra flags to pass to the Guix daemon service.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--max-jobs=4"
  "--debug"
]
```

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.gc.dates` {#opt-services.guix.gc.dates}

How often the garbage collection occurs. This takes the time format
from `systemd.time(7)`.

*Type:* string

*Default:* `"03:15"`

*Example:* `"weekly"`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.gc.enable` {#opt-services.guix.gc.enable}

Whether to enable automatic garbage collection service for Guix.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.gc.extraArgs` {#opt-services.guix.gc.extraArgs}

List of arguments to be passed to `guix gc`.

When given no option, it will try to collect all garbage which is
often inconvenient so it is recommended to set [some
options](https://guix.gnu.org/en/manual/en/html_node/Invoking-guix-gc.html).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--delete-generations=1m"
  "--free-space=10G"
  "--optimize"
]
```

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.group` {#opt-services.guix.group}

The group of the Guix build user pool.

*Type:* string

*Default:* `"guixbuild"`

*Example:* `"guixbuild"`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.nrBuildUsers` {#opt-services.guix.nrBuildUsers}

Number of Guix build users to be used in the build pool.

*Type:* unsigned integer, meaning \>=0

*Default:* `10`

*Example:* `20`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.package` {#opt-services.guix.package}

The guix package to use. It should contain `guix-daemon` and `guix`
executable.

*Type:* package

*Default:* `pkgs.guix`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.publish.enable` {#opt-services.guix.publish.enable}

Whether to enable substitute server for your Guix store directory.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.publish.extraArgs` {#opt-services.guix.publish.extraArgs}

Extra flags to pass to the substitute server.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--compression=zstd:6"
  "--discover=no"
]
```

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.publish.generateKeyPair` {#opt-services.guix.publish.generateKeyPair}

Whether to generate signing keys in `/etc/guix` which are
required to initialize a substitute server. Otherwise,
`--public-key=$FILE` and `--private-key=$FILE` can be passed in
[`services.guix.publish.extraArgs`](#opt-services.guix.publish.extraArgs).

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.publish.port` {#opt-services.guix.publish.port}

Port of the substitute server to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8181`

*Example:* `8200`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.publish.user` {#opt-services.guix.publish.user}

Name of the user to change once the server is up.

*Type:* string

*Default:* `"guix-publish"`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.stateDir` {#opt-services.guix.stateDir}

The state directory where Guix service will store its data such as its
user-specific profiles, cache, and state files.

::: warning
Changing it to something other than the default will rebuild the
package.
:::

*Type:* absolute path

*Default:* `"/var"`

*Example:* `"/gnu/var"`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.storeDir` {#opt-services.guix.storeDir}

The store directory where the Guix service will serve to/from. Take
note Guix cannot take advantage of substitutes if you set it something
other than `/gnu/store` since most of the cached builds are
assumed to be in there.

::: warning
This will also recompile all packages because the normal cache no
longer applies.
:::

*Type:* absolute path

*Default:* `"/gnu/store"`

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.substituters.authorizedKeys` {#opt-services.guix.substituters.authorizedKeys}

A list of signing keys for each substitute server to be authorized as
a source of substitutes. Without this, the listed substitute servers
from [`services.guix.substituters.urls`](#opt-services.guix.substituters.urls) would be ignored [with
some
exceptions](https://guix.gnu.org/manual/en/html_node/Substitute-Authentication.html).

*Type:* list of absolute path

*Default:*

``` nix
''
  The packaged signing keys from {option}`services.guix.package`.
''
```

*Example:*

``` nix
options.services.guix.substituters.authorizedKeys.default ++ [
  (builtins.fetchurl {
    url = "https://guix.example.com/signing-key.pub";
  })

  (builtins.fetchurl {
    url = "https://guix.example.org/static/signing-key.pub";
  })
]
```

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.guix.substituters.urls` {#opt-services.guix.substituters.urls}

A list of substitute servers' URLs for the Guix daemon to download
substitutes from.

*Type:* list of string

*Default:*

``` nix
[
  "https://ci.guix.gnu.org"
  "https://bordeaux.guix.gnu.org"
  "https://berlin.guix.gnu.org"
]
```

*Example:*

``` nix
options.services.guix.substituters.urls.default ++ [
  "https://guix.example.com"
  "https://guix.example.org"
]
```

*Declared by:* [`nixos/modules/services/misc/guix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/guix)

## `services.gvfs.enable` {#opt-services.gvfs.enable}

Whether to enable GVfs, a userspace virtual filesystem.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/gvfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gvfs.nix)

## `services.gvfs.package` {#opt-services.gvfs.package}

The gvfs package to use.

*Type:* package

*Default:* `pkgs.gnome.gvfs`

*Declared by:* [`nixos/modules/services/desktops/gvfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/gvfs.nix)

## `services.gvpe.configFile` {#opt-services.gvpe.configFile}

GVPE config file, if already present

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/root/my-gvpe-conf"`

*Declared by:* [`nixos/modules/services/networking/gvpe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gvpe.nix)

## `services.gvpe.configText` {#opt-services.gvpe.configText}

GVPE config contents

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Example:*

``` nix
''
  tcp-port = 655
  udp-port = 655
  mtu = 1480
  ifname = vpn0
  
  node = alpha
  hostname = alpha.example.org
  connect = always
  enable-udp = true
  enable-tcp = true
  on alpha if-up = if-up-0
  on alpha pid-file = /var/gvpe/gvpe.pid
''
```

*Declared by:* [`nixos/modules/services/networking/gvpe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gvpe.nix)

## `services.gvpe.customIFSetup` {#opt-services.gvpe.customIFSetup}

Additional commands to apply in ifup script

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/gvpe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gvpe.nix)

## `services.gvpe.enable` {#opt-services.gvpe.enable}

Whether to enable gvpe.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/gvpe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gvpe.nix)

## `services.gvpe.ipAddress` {#opt-services.gvpe.ipAddress}

IP address to assign to GVPE interface

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/gvpe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gvpe.nix)

## `services.gvpe.nodename` {#opt-services.gvpe.nodename}

GVPE node name

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/gvpe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gvpe.nix)

## `services.gvpe.subnet` {#opt-services.gvpe.subnet}

IP subnet assigned to GVPE network

*Type:* null or string

*Default:* `null`

*Example:* `"10.0.0.0/8"`

*Declared by:* [`nixos/modules/services/networking/gvpe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/gvpe.nix)
