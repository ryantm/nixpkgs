# services (J) {#sec-options-services-j}

## `services.jack.alsa.enable` {#opt-services.jack.alsa.enable}

Route audio to/from generic ALSA-using applications using ALSA JACK PCM plugin.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.alsa.support32Bit` {#opt-services.jack.alsa.support32Bit}

Whether to support sound for 32-bit ALSA applications on 64-bit system.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.jackd.enable` {#opt-services.jack.jackd.enable}

Whether to enable JACK Audio Connection Kit. You need to add yourself to the "jackaudio" group
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.jackd.extraOptions` {#opt-services.jack.jackd.extraOptions}

Specifies startup command line arguments to pass to JACK server.

*Type:* list of string

*Default:*

``` nix
[
  "-dalsa"
]
```

*Example:*

``` nix
[ "-dalsa" "--device" "hw:1" ];
```

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.jackd.session` {#opt-services.jack.jackd.session}

Commands to run after JACK is started.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.loopback.config` {#opt-services.jack.loopback.config}

ALSA config for loopback device.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.loopback.dmixConfig` {#opt-services.jack.loopback.dmixConfig}

For music production software that still doesn't support JACK natively you
would like to put buffer/period adjustments here
to decrease dmix device latency.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  period_size 2048
  periods 2
''
```

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.loopback.enable` {#opt-services.jack.loopback.enable}

Create ALSA loopback device, instead of using PCM plugin. Has broader
application support (things like Steam will work), but may need fine-tuning
for concrete hardware.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.loopback.index` {#opt-services.jack.loopback.index}

Index of an ALSA loopback device.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jack.loopback.session` {#opt-services.jack.loopback.session}

Additional commands to run to setup loopback device.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/audio/jack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jack.nix)

## `services.jackett.dataDir` {#opt-services.jackett.dataDir}

The directory where Jackett stores its data files.

*Type:* string

*Default:* `"/var/lib/jackett/.config/Jackett"`

*Declared by:* [`nixos/modules/services/misc/jackett.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jackett.nix)

## `services.jackett.enable` {#opt-services.jackett.enable}

Whether to enable Jackett, API support for your favorite torrent trackers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/jackett.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jackett.nix)

## `services.jackett.group` {#opt-services.jackett.group}

Group under which Jackett runs.

*Type:* string

*Default:* `"jackett"`

*Declared by:* [`nixos/modules/services/misc/jackett.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jackett.nix)

## `services.jackett.openFirewall` {#opt-services.jackett.openFirewall}

Open ports in the firewall for the Jackett web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jackett.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jackett.nix)

## `services.jackett.package` {#opt-services.jackett.package}

The jackett package to use.

*Type:* package

*Default:* `pkgs.jackett`

*Declared by:* [`nixos/modules/services/misc/jackett.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jackett.nix)

## `services.jackett.port` {#opt-services.jackett.port}

Port serving the web interface

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9117`

*Declared by:* [`nixos/modules/services/misc/jackett.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jackett.nix)

## `services.jackett.user` {#opt-services.jackett.user}

User account under which Jackett runs.

*Type:* string

*Default:* `"jackett"`

*Declared by:* [`nixos/modules/services/misc/jackett.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jackett.nix)

## `services.jboss.deployDir` {#opt-services.jboss.deployDir}

Location of the deployment files

*Type:* string

*Default:* `"/nix/var/nix/profiles/default/server/default/deploy/"`

*Declared by:* [`nixos/modules/services/web-servers/jboss/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/jboss/default.nix)

## `services.jboss.enable` {#opt-services.jboss.enable}

Whether to enable JBoss. WARNING : this package is outdated and is known to have vulnerabilities.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/jboss/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/jboss/default.nix)

## `services.jboss.libUrl` {#opt-services.jboss.libUrl}

Location where the shared library JARs are stored

*Type:* string

*Default:* `"file:///nix/var/nix/profiles/default/server/default/lib"`

*Declared by:* [`nixos/modules/services/web-servers/jboss/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/jboss/default.nix)

## `services.jboss.logDir` {#opt-services.jboss.logDir}

Location of the logfile directory of JBoss

*Type:* string

*Default:* `"/var/log/jboss"`

*Declared by:* [`nixos/modules/services/web-servers/jboss/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/jboss/default.nix)

## `services.jboss.serverDir` {#opt-services.jboss.serverDir}

Location of the server instance files

*Type:* string

*Default:* `"/var/jboss/server"`

*Declared by:* [`nixos/modules/services/web-servers/jboss/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/jboss/default.nix)

## `services.jboss.tempDir` {#opt-services.jboss.tempDir}

Location where JBoss stores its temp files

*Type:* string

*Default:* `"/tmp"`

*Declared by:* [`nixos/modules/services/web-servers/jboss/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/jboss/default.nix)

## `services.jboss.useJK` {#opt-services.jboss.useJK}

Whether to use to connector to the Apache HTTP server

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/jboss/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/jboss/default.nix)

## `services.jboss.user` {#opt-services.jboss.user}

User account under which jboss runs.

*Type:* string

*Default:* `"nobody"`

*Declared by:* [`nixos/modules/services/web-servers/jboss/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/jboss/default.nix)

## `services.jellyfin.cacheDir` {#opt-services.jellyfin.cacheDir}

Directory containing the jellyfin server cache,
passed with `--cachedir` see [#cache-directory](https://jellyfin.org/docs/general/administration/configuration/#cache-directory)

*Type:* absolute path

*Default:* `"/var/cache/jellyfin"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.configDir` {#opt-services.jellyfin.configDir}

Directory containing the server configuration files,
passed with `--configdir` see [configuration-directory](https://jellyfin.org/docs/general/administration/configuration/#configuration-directory)

*Type:* absolute path

*Default:* `"${cfg.dataDir}/config"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.dataDir` {#opt-services.jellyfin.dataDir}

Base data directory,
passed with `--datadir` see [#data-directory](https://jellyfin.org/docs/general/administration/configuration/#data-directory)

*Type:* absolute path

*Default:* `"/var/lib/jellyfin"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.enable` {#opt-services.jellyfin.enable}

Whether to enable Jellyfin Media Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.forceEncodingConfig` {#opt-services.jellyfin.forceEncodingConfig}

Whether to overwrite Jellyfin's `encoding.xml` configuration file on each service start.

When enabled, the encoding configuration specified in `services.jellyfin.transcoding`
and `services.jellyfin.hardwareAcceleration` will be applied on every service restart.
A backup of the existing `encoding.xml` will be created at `encoding.xml.backup-$timestamp`.

::: warning
Enabling this option means that any changes made to transcoding settings through
Jellyfin's web dashboard will be lost on the next service restart. The NixOS configuration
becomes the single source of truth for encoding settings.
:::

When disabled (the default), the encoding configuration is only written if no `encoding.xml`
exists yet. This allows settings to be changed through Jellyfin's web dashboard and persist
across restarts, but means the NixOS configuration options will be ignored after the initial setup.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.group` {#opt-services.jellyfin.group}

Group under which jellyfin runs.

*Type:* string

*Default:* `"jellyfin"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.hardwareAcceleration.device` {#opt-services.jellyfin.hardwareAcceleration.device}

Path to the hardware acceleration device that Jellyfin should use.
For obscure configurations, additional devices can be added via
`systemd.services.jellyfin.serviceConfig.DeviceAllow`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/dev/dri/renderD128"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.hardwareAcceleration.enable` {#opt-services.jellyfin.hardwareAcceleration.enable}

Whether to enable hardware acceleration for video transcoding.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.hardwareAcceleration.type` {#opt-services.jellyfin.hardwareAcceleration.type}

The method of hardware acceleration. See [Hardware Acceleration](https://jellyfin.org/docs/general/post-install/transcoding/hardware-acceleration) for more details.

*Type:* one of "none", "amf", "qsv", "nvenc", "v4l2m2m", "vaapi", "rkmpp"

*Default:* `"none"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.logDir` {#opt-services.jellyfin.logDir}

Directory where the Jellyfin logs will be stored,
passed with `--logdir` see [#log-directory](https://jellyfin.org/docs/general/administration/configuration/#log-directory)

*Type:* absolute path

*Default:* `"${cfg.dataDir}/log"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.openFirewall` {#opt-services.jellyfin.openFirewall}

Open the default ports in the firewall for the media server. The
HTTP/HTTPS ports can be changed in the Web UI, so this option should
only be used if they are unchanged, see [Port Bindings](https://jellyfin.org/docs/general/networking/#port-bindings).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.package` {#opt-services.jellyfin.package}

The jellyfin package to use.

*Type:* package

*Default:* `pkgs.jellyfin`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.deleteSegments` {#opt-services.jellyfin.transcoding.deleteSegments}

Delete transcoding segments when finished.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.enableHardwareEncoding` {#opt-services.jellyfin.transcoding.enableHardwareEncoding}

Enable hardware encoding for video transcoding.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.enableIntelLowPowerEncoding` {#opt-services.jellyfin.transcoding.enableIntelLowPowerEncoding}

Enable low-power encoding mode for Intel Quick Sync Video.
Requires i915 HuC firmware to be configured.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.enableSubtitleExtraction` {#opt-services.jellyfin.transcoding.enableSubtitleExtraction}

Embedded subtitles can be extracted from videos and delivered to clients in plain text, in order to help prevent video transcoding. On some systems this can take a long time and cause video playback to stall during the extraction process. Disable this to have embedded subtitles burned in with video transcoding when they are not natively supported by the client device.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.enableToneMapping` {#opt-services.jellyfin.transcoding.enableToneMapping}

Enable tone mapping when transcoding HDR content.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.encodingPreset` {#opt-services.jellyfin.transcoding.encodingPreset}

Encoder preset for transcoding.
Lower presets sacrifice quality for speed, higher presets optimize quality.

*Type:* one of "auto", "veryslow", "slower", "slow", "medium", "fast", "faster", "veryfast", "superfast", "ultrafast"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.h264Crf` {#opt-services.jellyfin.transcoding.h264Crf}

Constant Rate Factor (CRF) for H.264 encoding. Lower values result in better quality. Range: 0-51.

*Type:* integer between 0 and 51 (both inclusive)

*Default:* `23`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.h265Crf` {#opt-services.jellyfin.transcoding.h265Crf}

Constant Rate Factor (CRF) for H.265 encoding. Lower values result in better quality. Range: 0-51.

*Type:* integer between 0 and 51 (both inclusive)

*Default:* `28`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs}

Which codecs to enable for hardware decoding.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  h264 = true;
  vp9 = true;
}
```

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.av1` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.av1}

Enable hardware decoding for av1 codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.h264` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.h264}

Enable hardware decoding for h264 codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.hevc` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.hevc}

Enable hardware decoding for hevc codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.hevc10bit` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.hevc10bit}

Enable hardware decoding for hevc10bit codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.hevcRExt10bit` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.hevcRExt10bit}

Enable hardware decoding for hevcRExt10bit codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.hevcRExt12bit` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.hevcRExt12bit}

Enable hardware decoding for hevcRExt12bit codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.mpeg2` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.mpeg2}

Enable hardware decoding for mpeg2 codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.vc1` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.vc1}

Enable hardware decoding for vc1 codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.vp8` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.vp8}

Enable hardware decoding for vp8 codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareDecodingCodecs.vp9` {#opt-services.jellyfin.transcoding.hardwareDecodingCodecs.vp9}

Enable hardware decoding for vp9 codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareEncodingCodecs` {#opt-services.jellyfin.transcoding.hardwareEncodingCodecs}

Which codecs to enable for hardware encoding. h264 is always enabled.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  av1 = true;
}
```

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareEncodingCodecs.av1` {#opt-services.jellyfin.transcoding.hardwareEncodingCodecs.av1}

Enable hardware encoding for av1 codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.hardwareEncodingCodecs.hevc` {#opt-services.jellyfin.transcoding.hardwareEncodingCodecs.hevc}

Enable hardware encoding for hevc codec.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.maxConcurrentStreams` {#opt-services.jellyfin.transcoding.maxConcurrentStreams}

Maximum number of concurrent transcoding streams.
Set to null for unlimited (limited by hardware capabilities).

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Example:* `2`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.threadCount` {#opt-services.jellyfin.transcoding.threadCount}

Number of threads to use when transcoding.
Set to null to use automatic detection.

*Type:* null or (positive integer, meaning \>0)

*Default:* `null`

*Example:* `4`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.transcoding.throttleTranscoding` {#opt-services.jellyfin.transcoding.throttleTranscoding}

When a transcode or remux gets far enough ahead from the current playback position, pause the process so it will consume fewer resources. This is most useful when watching without seeking often. Turn this off if you experience playback issues.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellyfin.user` {#opt-services.jellyfin.user}

User account under which Jellyfin runs.

*Type:* string

*Default:* `"jellyfin"`

*Declared by:* [`nixos/modules/services/misc/jellyfin.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellyfin.nix)

## `services.jellystat.dataDir` {#opt-services.jellystat.dataDir}

Persistent Jellystat state directory, holding the `backups` and `env`
subdirectories.

Directories below `/var/lib` are managed with systemd's
`StateDirectory=`, other locations with systemd-tmpfiles.

*Type:* string

*Default:* `"/var/lib/jellystat"`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.database.createLocally` {#opt-services.jellystat.database.createLocally}

Whether to create a local PostgreSQL database for Jellystat.
Jellystat connects to it over a Unix socket using peer
authentication, so no password is required.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.enable` {#opt-services.jellystat.enable}

Whether to enable Jellystat, a statistics app for Jellyfin.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.group` {#opt-services.jellystat.group}

Group under which Jellystat runs. The group is only created
automatically when left at the default.

*Type:* string

*Default:* `"jellystat"`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.openFirewall` {#opt-services.jellystat.openFirewall}

Whether to enable opening the firewall for Jellystat's HTTP port.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.package` {#opt-services.jellystat.package}

The jellystat package to use.

*Type:* package

*Default:* `pkgs.jellystat`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.secretFiles` {#opt-services.jellystat.secretFiles}

Files whose contents are exported as environment variables, keyed by
variable name. They are passed to the service with systemd
`LoadCredential=` and never copied into the Nix store.

*Type:* open submodule of attribute set of absolute path

*Example:*

``` nix
{
  JWT_SECRET = "/run/secrets/jellystat-jwt";
  JS_GEOLITE_LICENSE_KEY = "/run/secrets/geolite-key";
}
```

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.secretFiles.JWT_SECRET` {#opt-services.jellystat.secretFiles.JWT_SECRET}

Path to a file containing the JWT signing secret.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.secretFiles.POSTGRES_PASSWORD` {#opt-services.jellystat.secretFiles.POSTGRES_PASSWORD}

Path to a file containing the PostgreSQL password. Not needed when
[`services.jellystat.database.createLocally`](#opt-services.jellystat.database.createLocally) is enabled.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.settings` {#opt-services.jellystat.settings}

Environment variables passed to Jellystat. See the
[upstream documentation](https://github.com/CyferShepard/Jellystat#environmental-variables)
for the available variables. Secrets belong in
[`services.jellystat.secretFiles`](#opt-services.jellystat.secretFiles) instead.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  JS_BASE_URL = "/jellystat";
  POSTGRES_SSL_ENABLED = true;
  TZ = "Australia/Brisbane";
}
```

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.settings.JS_LISTEN_IP` {#opt-services.jellystat.settings.JS_LISTEN_IP}

Address Jellystat listens on.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.settings.JS_PORT` {#opt-services.jellystat.settings.JS_PORT}

Port Jellystat listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.settings.POSTGRES_DB` {#opt-services.jellystat.settings.POSTGRES_DB}

PostgreSQL database name.

*Type:* string

*Default:* `config.services.jellystat.settings.POSTGRES_USER`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.settings.POSTGRES_IP` {#opt-services.jellystat.settings.POSTGRES_IP}

PostgreSQL host, or the directory containing its Unix socket.

*Type:* string

*Default:* `"/run/postgresql"`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.settings.POSTGRES_PORT` {#opt-services.jellystat.settings.POSTGRES_PORT}

PostgreSQL port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `config.services.postgresql.settings.port`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.settings.POSTGRES_USER` {#opt-services.jellystat.settings.POSTGRES_USER}

PostgreSQL user.

*Type:* string

*Default:* `config.services.jellystat.user`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jellystat.user` {#opt-services.jellystat.user}

User account under which Jellystat runs. The user is only created
automatically when left at the default.

*Type:* string

*Default:* `"jellystat"`

*Declared by:* [`nixos/modules/services/misc/jellystat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/jellystat.nix)

## `services.jenkins.enable` {#opt-services.jenkins.enable}

Whether to enable Jenkins, a continuous integration server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.environment` {#opt-services.jenkins.environment}

Additional environment variables to be passed to the jenkins process.
As a base environment, jenkins receives NIX\_PATH from
[`environment.sessionVariables`](../../options/environment/index.md#opt-environment.sessionVariables), NIX\_REMOTE is set to
"daemon" and JENKINS\_HOME is set to the value of
[`services.jenkins.home`](#opt-services.jenkins.home).
This option has precedence and can be used to override those
mentioned variables.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.extraGroups` {#opt-services.jenkins.extraGroups}

List of extra groups that the "jenkins" user should be a part of.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "wheel"
  "dialout"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.extraJavaOptions` {#opt-services.jenkins.extraJavaOptions}

Additional command line arguments to pass to the Java run time (as opposed to Jenkins).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-Xmx80m"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.extraOptions` {#opt-services.jenkins.extraOptions}

Additional command line arguments to pass to Jenkins.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--debug=9"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.group` {#opt-services.jenkins.group}

If the default user "jenkins" is configured then this is the primary
group of that user.

*Type:* string

*Default:* `"jenkins"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.home` {#opt-services.jenkins.home}

The path to use as JENKINS\_HOME. If the default user "jenkins" is configured then
this is the home of the "jenkins" user.

*Type:* absolute path

*Default:* `"/var/lib/jenkins"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.javaPackage` {#opt-services.jenkins.javaPackage}

The jdk25 package to use.

*Type:* package

*Default:* `pkgs.jdk25`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.jobBuilder.accessToken` {#opt-services.jenkins.jobBuilder.accessToken}

User token in Jenkins used to reload config.
WARNING: This token will be world readable in the Nix store. To keep
it secret, use the `accessTokenFile` option instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/job-builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/job-builder.nix)

## `services.jenkins.jobBuilder.accessTokenFile` {#opt-services.jenkins.jobBuilder.accessTokenFile}

File containing the API token for the `accessUser`
user.

*Type:* string

*Default:* `"${config.services.jenkins.home}/secrets/initialAdminPassword"`

*Example:* `"/run/keys/jenkins-job-builder-access-token"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/job-builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/job-builder.nix)

## `services.jenkins.jobBuilder.accessUser` {#opt-services.jenkins.jobBuilder.accessUser}

User id in Jenkins used to reload config.

*Type:* string

*Default:* `"admin"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/job-builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/job-builder.nix)

## `services.jenkins.jobBuilder.enable` {#opt-services.jenkins.jobBuilder.enable}

Whether to enable the Jenkins Job Builder (JJB) service. It
allows defining jobs for Jenkins in a declarative manner.

Jobs managed through the Jenkins WebUI (or by other means) are left
unchanged.

Note that it really is declarative configuration; if you remove a
previously defined job, the corresponding job directory will be
deleted.

Please see the Jenkins Job Builder documentation for more info:
[https://jenkins-job-builder.readthedocs.io/](https://jenkins-job-builder.readthedocs.io/)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/job-builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/job-builder.nix)

## `services.jenkins.jobBuilder.jsonJobs` {#opt-services.jenkins.jobBuilder.jsonJobs}

Job descriptions for Jenkins Job Builder in JSON format.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  ''
    [ { "job":
        { "name": "jenkins-job-test-2",
          "builders": [ "shell": "echo 'Hello world!'" ]
        }
      }
    ]
  ''
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/job-builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/job-builder.nix)

## `services.jenkins.jobBuilder.nixJobs` {#opt-services.jenkins.jobBuilder.nixJobs}

Job descriptions for Jenkins Job Builder in Nix format.

This is a trivial wrapper around jsonJobs, using builtins.toJSON
behind the scene.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[ { job =
    { name = "jenkins-job-test-3";
      builders = [
        { shell = "echo 'Hello world!'"; }
      ];
    };
  }
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/job-builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/job-builder.nix)

## `services.jenkins.jobBuilder.yamlJobs` {#opt-services.jenkins.jobBuilder.yamlJobs}

Job descriptions for Jenkins Job Builder in YAML format.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  - job:
      name: jenkins-job-test-1
      builders:
        - shell: echo 'Hello world!'
''
```

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/job-builder.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/job-builder.nix)

## `services.jenkins.listenAddress` {#opt-services.jenkins.listenAddress}

Specifies the bind address on which the jenkins HTTP interface listens.
The default is the wildcard address.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.package` {#opt-services.jenkins.package}

The jenkins package to use.

*Type:* package

*Default:* `pkgs.jenkins`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.packages` {#opt-services.jenkins.packages}

Packages to add to PATH for the jenkins process.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  pkgs.stdenv
  pkgs.git
  pkgs.jdk25
  config.programs.ssh.package
  pkgs.nix
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.plugins` {#opt-services.jenkins.plugins}

A set of plugins to activate. Note that this will completely
remove and replace any previously installed plugins. If you
have manually-installed plugins that you want to keep while
using this module, set this option to
`null`. You can generate this set with a
tool such as `jenkinsPlugins2nix`.

*Type:* null or (attribute set of package)

*Default:* `null`

*Example:*

``` nix
import path/to/jenkinsPlugins2nix-generated-plugins.nix { inherit (pkgs) fetchurl stdenv; }
```

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.port` {#opt-services.jenkins.port}

Specifies port number on which the jenkins HTTP interface listens.
The default is 8080.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.prefix` {#opt-services.jenkins.prefix}

Specifies a urlPrefix to use with jenkins.
If the example /jenkins is given, the jenkins server will be
accessible using localhost:8080/jenkins.

*Type:* string

*Default:* `""`

*Example:* `"/jenkins"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.user` {#opt-services.jenkins.user}

User the jenkins server should execute under.

*Type:* string

*Default:* `"jenkins"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkins.withCLI` {#opt-services.jenkins.withCLI}

Whether to make the CLI available.

More info about the CLI available at
[
https://www.jenkins.io/doc/book/managing/cli](https://www.jenkins.io/doc/book/managing/cli) .

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/default.nix)

## `services.jenkinsSlave.enable` {#opt-services.jenkinsSlave.enable}

If true the system will be configured to work as a jenkins slave.
If the system is also configured to work as a jenkins master then this has no effect.
In progress: Currently only assures the jenkins user is configured.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/slave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/slave.nix)

## `services.jenkinsSlave.group` {#opt-services.jenkinsSlave.group}

If the default slave agent user "jenkins" is configured then this is
the primary group of that user.

*Type:* string

*Default:* `"jenkins"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/slave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/slave.nix)

## `services.jenkinsSlave.home` {#opt-services.jenkinsSlave.home}

The path to use as JENKINS\_HOME. If the default user "jenkins" is configured then
this is the home of the "jenkins" user.

*Type:* absolute path

*Default:* `"/var/lib/jenkins"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/slave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/slave.nix)

## `services.jenkinsSlave.javaPackage` {#opt-services.jenkinsSlave.javaPackage}

The jdk package to use.

*Type:* package

*Default:* `pkgs.jdk`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/slave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/slave.nix)

## `services.jenkinsSlave.user` {#opt-services.jenkinsSlave.user}

User the jenkins slave agent should execute under.

*Type:* string

*Default:* `"jenkins"`

*Declared by:* [`nixos/modules/services/continuous-integration/jenkins/slave.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/jenkins/slave.nix)

## `services.jibri.config` {#opt-services.jibri.config}

Jibri configuration.
See [https://github.com/jitsi/jibri/blob/master/src/main/resources/reference.conf](https://github.com/jitsi/jibri/blob/master/src/main/resources/reference.conf)
for default configuration with comments.

*Type:* HOCON value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.enable` {#opt-services.jibri.enable}

Whether to enable Jibri.
Jibri must run on a host where [`services.jitsi-meet.enable`](#opt-services.jitsi-meet.enable) is enabled.
It installs a system-wide Chromium policy that disables security warnings for every Chromium user.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.finalizeScript` {#opt-services.jibri.finalizeScript}

This script runs when jibri finishes recording a video of a conference.

*Type:* absolute path

*Default:*

``` nix
pkgs.writeScript "finalize_recording.sh" ''''
#!/bin/sh

RECORDINGS_DIR=$1

echo "This is a dummy finalize script" > /tmp/finalize.out
echo "The script was invoked with recordings directory $RECORDINGS_DIR." >> /tmp/finalize.out
echo "You should put any finalize logic (renaming, uploading to a service" >> /tmp/finalize.out
echo "or storage provider, etc.) in this script" >> /tmp/finalize.out

exit 0
'''';
```

*Example:*

``` nix
pkgs.writeScript "finalize_recording.sh" ''''
#!/bin/sh
RECORDINGS_DIR=$1
${pkgs.rclone}/bin/rclone copy $RECORDINGS_DIR RCLONE_REMOTE:jibri-recordings/ -v --log-file=/var/log/jitsi/jibri/recording-upload.txt
exit 0
'''';
```

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.ignoreCert` {#opt-services.jibri.ignoreCert}

Whether to enable the flag "--ignore-certificate-errors" for the Chromium browser opened by Jibri.
Intended for use in automated tests or anywhere else where using a verified cert for Jitsi-Meet is not possible.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments` {#opt-services.jibri.xmppEnvironments}

XMPP servers to connect to.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
"jitsi-meet" = {
  xmppServerHosts = [ "localhost" ];
  xmppDomain = config.services.jitsi-meet.hostName;

  control.muc = {
    domain = "internal.${config.services.jitsi-meet.hostName}";
    roomName = "JibriBrewery";
    nickname = "jibri";
  };

  control.login = {
    domain = "auth.${config.services.jitsi-meet.hostName}";
    username = "jibri";
    passwordFile = "/var/lib/jitsi-meet/jibri-auth-secret";
  };

  call.login = {
    domain = "recorder.${config.services.jitsi-meet.hostName}";
    username = "recorder";
    passwordFile = "/var/lib/jitsi-meet/jibri-recorder-secret";
  };

  usageTimeout = "0";
  disableCertificateVerification = true;
  stripFromRoomDomain = "conference.";
};
```

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.call.login.domain` {#opt-services.jibri.xmppEnvironments._name_.call.login.domain}

The domain part of the JID for the recorder.

*Type:* string

*Example:* `"recorder.xmpp.example.org"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.call.login.passwordFile` {#opt-services.jibri.xmppEnvironments._name_.call.login.passwordFile}

File containing the password for the user.

*Type:* string

*Example:* `"/run/keys/jibri-recorder-xmpp1"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.call.login.username` {#opt-services.jibri.xmppEnvironments._name_.call.login.username}

User part of the JID for the recorder.

*Type:* string

*Default:* `"recorder"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.control.login.domain` {#opt-services.jibri.xmppEnvironments._name_.control.login.domain}

The domain part of the JID for this Jibri instance.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.control.login.passwordFile` {#opt-services.jibri.xmppEnvironments._name_.control.login.passwordFile}

File containing the password for the user.

*Type:* string

*Example:* `"/run/keys/jibri-xmpp1"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.control.login.username` {#opt-services.jibri.xmppEnvironments._name_.control.login.username}

User part of the JID.

*Type:* string

*Default:* `"jvb"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.control.muc.domain` {#opt-services.jibri.xmppEnvironments._name_.control.muc.domain}

The domain part of the MUC to connect to for control.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.control.muc.nickname` {#opt-services.jibri.xmppEnvironments._name_.control.muc.nickname}

The nickname for this Jibri instance in the MUC.

*Type:* string

*Default:* `"jibri"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.control.muc.roomName` {#opt-services.jibri.xmppEnvironments._name_.control.muc.roomName}

The room name of the MUC to connect to for control.

*Type:* string

*Default:* `"JibriBrewery"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.disableCertificateVerification` {#opt-services.jibri.xmppEnvironments._name_.disableCertificateVerification}

Whether to skip validation of the server's certificate.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.stripFromRoomDomain` {#opt-services.jibri.xmppEnvironments._name_.stripFromRoomDomain}

The prefix to strip from the room's JID domain to derive the call URL.

*Type:* string

*Default:* `"0"`

*Example:* `"conference."`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.usageTimeout` {#opt-services.jibri.xmppEnvironments._name_.usageTimeout}

The duration that the Jibri session can be.
A value of zero means indefinitely.

*Type:* string

*Default:* `"0"`

*Example:* `"1 hour"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.xmppDomain` {#opt-services.jibri.xmppEnvironments._name_.xmppDomain}

The base XMPP domain.

*Type:* string

*Example:* `"xmpp.example.org"`

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jibri.xmppEnvironments.<name>.xmppServerHosts` {#opt-services.jibri.xmppEnvironments._name_.xmppServerHosts}

Hostnames of the XMPP servers to connect to.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "xmpp.example.org"
]
```

*Declared by:* [`nixos/modules/services/networking/jibri/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jibri/default.nix)

## `services.jicofo.bridgeMuc` {#opt-services.jicofo.bridgeMuc}

JID of the internal MUC used to communicate with Videobridges.

*Type:* string

*Example:* `"jvbbrewery@internal.meet.example.org"`

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jicofo.componentPasswordFile` {#opt-services.jicofo.componentPasswordFile}

Path to file containing component secret.

*Type:* string

*Example:* `"/run/keys/jicofo-component"`

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jicofo.config` {#opt-services.jicofo.config}

Contents of the `jicofo.conf` configuration file.

*Type:* HOCON value

*Default:* `{ }`

*Example:*

``` nix
{
  jicofo.bridge.max-bridge-participants = 42;
}
```

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jicofo.enable` {#opt-services.jicofo.enable}

Whether to enable Jitsi Conference Focus - component of Jitsi Meet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jicofo.userDomain` {#opt-services.jicofo.userDomain}

Domain part of the JID for XMPP user connection.

*Type:* string

*Example:* `"auth.meet.example.org"`

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jicofo.userName` {#opt-services.jicofo.userName}

User part of the JID for XMPP user connection.

*Type:* string

*Default:* `"focus"`

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jicofo.userPasswordFile` {#opt-services.jicofo.userPasswordFile}

Path to file containing password for XMPP user connection.

*Type:* string

*Example:* `"/run/keys/jicofo-user"`

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jicofo.xmppDomain` {#opt-services.jicofo.xmppDomain}

Domain name of the XMMP server to which to connect as a component.

If null, `xmppHost` is used.

*Type:* null or string

*Default:* `null`

*Example:* `"meet.example.org"`

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jicofo.xmppHost` {#opt-services.jicofo.xmppHost}

Hostname of the XMPP server to connect to.

*Type:* string

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/networking/jicofo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jicofo.nix)

## `services.jigasi.bridgeMuc` {#opt-services.jigasi.bridgeMuc}

JID of the internal MUC used to communicate with Videobridges.

*Type:* string

*Example:* `"jigasibrewery@internal.meet.example.org"`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.componentPasswordFile` {#opt-services.jigasi.componentPasswordFile}

Path to file containing component secret.

*Type:* string

*Example:* `"/run/keys/jigasi-component"`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.config` {#opt-services.jigasi.config}

Contents of the <filename>sip-communicator.properties</filename> configuration file for jigasi.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "org.jitsi.jigasi.auth.URL" = "XMPP:jitsi-meet.example.com";
}
```

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.defaultJvbRoomName` {#opt-services.jigasi.defaultJvbRoomName}

Name of the default JVB room that will be joined if no special header is included in SIP invite.

*Type:* string

*Default:* `""`

*Example:* `"siptest"`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.enable` {#opt-services.jigasi.enable}

Whether to enable Jitsi Gateway to SIP - component of Jitsi Meet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.environmentFile` {#opt-services.jigasi.environmentFile}

File containing environment variables to be passed to the jigasi service,
in which secret tokens can be specified securely by defining values for
<literal>JIGASI\_SIPUSER</literal>,
<literal>JIGASI\_SIPPWD</literal>,
<literal>JIGASI\_SIPSERVER</literal> and
<literal>JIGASI\_SIPPORT</literal>.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.userDomain` {#opt-services.jigasi.userDomain}

Domain part of the JID for XMPP user connection.

*Type:* string

*Example:* `"internal.meet.example.org"`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.userName` {#opt-services.jigasi.userName}

User part of the JID for XMPP user connection.

*Type:* string

*Default:* `"callcontrol"`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.userPasswordFile` {#opt-services.jigasi.userPasswordFile}

Path to file containing password for XMPP user connection.

*Type:* string

*Example:* `"/run/keys/jigasi-user"`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.xmppDomain` {#opt-services.jigasi.xmppDomain}

Domain name of the XMMP server to which to connect as a component.

If null, <option>xmppHost</option> is used.

*Type:* null or string

*Default:* `null`

*Example:* `"meet.example.org"`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jigasi.xmppHost` {#opt-services.jigasi.xmppHost}

Hostname of the XMPP server to connect to.

*Type:* string

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/services/networking/jigasi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jigasi.nix)

## `services.jirafeau.adminPasswordSha256` {#opt-services.jirafeau.adminPasswordSha256}

SHA-256 of the desired administration password. Leave blank/unset for no password.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.dataDir` {#opt-services.jirafeau.dataDir}

Location of Jirafeau storage directory.

*Type:* absolute path

*Default:* `"/var/lib/jirafeau/data/"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.enable` {#opt-services.jirafeau.enable}

Whether to enable Jirafeau file upload application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.extraConfig` {#opt-services.jirafeau.extraConfig}

Jirefeau configuration. Refer to [https://gitlab.com/jirafeau/Jirafeau/-/blob/4.7.2/lib/config.original.php](https://gitlab.com/jirafeau/Jirafeau/-/blob/4.7.2/lib/config.original.php) for supported
values.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  $cfg['style'] = 'courgette';
  $cfg['organisation'] = 'ACME';
''
```

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.hostName` {#opt-services.jirafeau.hostName}

URL of instance. Must have trailing slash.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.maxUploadSizeMegabytes` {#opt-services.jirafeau.maxUploadSizeMegabytes}

Maximum upload size of accepted files.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.maxUploadTimeout` {#opt-services.jirafeau.maxUploadTimeout}

Timeout for reading client request bodies and headers. Refer to
[http://nginx.org/en/docs/http/ngx\_http\_core\_module.html#client\_body\_timeout](http://nginx.org/en/docs/http/ngx_http_core_module.html#client_body_timeout) and
[http://nginx.org/en/docs/http/ngx\_http\_core\_module.html#client\_header\_timeout](http://nginx.org/en/docs/http/ngx_http_core_module.html#client_header_timeout) for accepted values.

*Type:* string

*Default:* `"30m"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig` {#opt-services.jirafeau.nginxConfig}

Extra configuration for the nginx virtual host of Jirafeau.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [ "wiki.${config.networking.domain}" ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.acmeFallbackHost` {#opt-services.jirafeau.nginxConfig.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.acmeRoot` {#opt-services.jirafeau.nginxConfig.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.addSSL` {#opt-services.jirafeau.nginxConfig.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.basicAuth` {#opt-services.jirafeau.nginxConfig.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.basicAuthFile` {#opt-services.jirafeau.nginxConfig.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.default` {#opt-services.jirafeau.nginxConfig.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.enableACME` {#opt-services.jirafeau.nginxConfig.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.extraConfig` {#opt-services.jirafeau.nginxConfig.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.forceSSL` {#opt-services.jirafeau.nginxConfig.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.globalRedirect` {#opt-services.jirafeau.nginxConfig.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.http2` {#opt-services.jirafeau.nginxConfig.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.http3` {#opt-services.jirafeau.nginxConfig.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.http3_hq` {#opt-services.jirafeau.nginxConfig.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.kTLS` {#opt-services.jirafeau.nginxConfig.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.listen` {#opt-services.jirafeau.nginxConfig.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.listen.*.addr` {#opt-services.jirafeau.nginxConfig.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.listen.*.extraParameters` {#opt-services.jirafeau.nginxConfig.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.listen.*.port` {#opt-services.jirafeau.nginxConfig.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.listen.*.proxyProtocol` {#opt-services.jirafeau.nginxConfig.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.listen.*.ssl` {#opt-services.jirafeau.nginxConfig.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.listenAddresses` {#opt-services.jirafeau.nginxConfig.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations` {#opt-services.jirafeau.nginxConfig.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.alias` {#opt-services.jirafeau.nginxConfig.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.basicAuth` {#opt-services.jirafeau.nginxConfig.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.basicAuthFile` {#opt-services.jirafeau.nginxConfig.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.extraConfig` {#opt-services.jirafeau.nginxConfig.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.fastcgiParams` {#opt-services.jirafeau.nginxConfig.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.index` {#opt-services.jirafeau.nginxConfig.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.priority` {#opt-services.jirafeau.nginxConfig.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.proxyPass` {#opt-services.jirafeau.nginxConfig.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.proxyWebsockets` {#opt-services.jirafeau.nginxConfig.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.recommendedProxySettings` {#opt-services.jirafeau.nginxConfig.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.recommendedUwsgiSettings` {#opt-services.jirafeau.nginxConfig.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.return` {#opt-services.jirafeau.nginxConfig.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.root` {#opt-services.jirafeau.nginxConfig.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.tryFiles` {#opt-services.jirafeau.nginxConfig.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.useGrpcErrorPages` {#opt-services.jirafeau.nginxConfig.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.locations.<name>.uwsgiPass` {#opt-services.jirafeau.nginxConfig.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.onlySSL` {#opt-services.jirafeau.nginxConfig.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.quic` {#opt-services.jirafeau.nginxConfig.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.redirectCode` {#opt-services.jirafeau.nginxConfig.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.rejectSSL` {#opt-services.jirafeau.nginxConfig.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.reuseport` {#opt-services.jirafeau.nginxConfig.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.root` {#opt-services.jirafeau.nginxConfig.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.serverAliases` {#opt-services.jirafeau.nginxConfig.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.serverName` {#opt-services.jirafeau.nginxConfig.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.sslCertificate` {#opt-services.jirafeau.nginxConfig.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.sslCertificateKey` {#opt-services.jirafeau.nginxConfig.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.sslTrustedCertificate` {#opt-services.jirafeau.nginxConfig.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.nginxConfig.useACMEHost` {#opt-services.jirafeau.nginxConfig.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.package` {#opt-services.jirafeau.package}

The jirafeau package to use.

*Type:* package

*Default:* `pkgs.jirafeau`

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jirafeau.poolConfig` {#opt-services.jirafeau.poolConfig}

Options for Jirafeau PHP pool. See documentation on `php-fpm.conf` for
details on configuration directives.

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

*Declared by:* [`nixos/modules/services/web-apps/jirafeau.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jirafeau.nix)

## `services.jitsi-meet.caddy.enable` {#opt-services.jitsi-meet.caddy.enable}

Whether to enable caddy reverse proxy to expose jitsi-meet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.config` {#opt-services.jitsi-meet.config}

Client-side web application settings that override the defaults in `config.js`.

See [https://github.com/jitsi/jitsi-meet/blob/master/config.js](https://github.com/jitsi/jitsi-meet/blob/master/config.js) for default
configuration with comments.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  enableWelcomePage = false;
  defaultLang = "fi";
}
```

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.enable` {#opt-services.jitsi-meet.enable}

Whether to enable Jitsi Meet - Secure, Simple and Scalable Video Conferences.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.excalidraw.enable` {#opt-services.jitsi-meet.excalidraw.enable}

Whether to enable Excalidraw collaboration backend for Jitsi.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.excalidraw.port` {#opt-services.jitsi-meet.excalidraw.port}

The port which the Excalidraw backend for Jitsi should listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3002`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.extraConfig` {#opt-services.jitsi-meet.extraConfig}

Text to append to `config.js` web application config file.

Can be used to insert JavaScript logic to determine user's region in cascading bridges setup.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.hostName` {#opt-services.jitsi-meet.hostName}

FQDN of the Jitsi Meet instance.

*Type:* string

*Example:* `"meet.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.interfaceConfig` {#opt-services.jitsi-meet.interfaceConfig}

Client-side web-app interface settings that override the defaults in `interface_config.js`.

See [https://github.com/jitsi/jitsi-meet/blob/master/interface\_config.js](https://github.com/jitsi/jitsi-meet/blob/master/interface_config.js) for
default configuration with comments.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  SHOW_JITSI_WATERMARK = false;
  SHOW_WATERMARK_FOR_GUESTS = false;
}
```

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.jibri.enable` {#opt-services.jitsi-meet.jibri.enable}

Whether to enable a Jibri instance and configure it to connect to Prosody.

Additional configuration is possible with `services.jibri`, and
[`services.jibri.finalizeScript`](#opt-services.jibri.finalizeScript) is especially useful.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.jicofo.enable` {#opt-services.jitsi-meet.jicofo.enable}

Whether to enable JiCoFo instance and configure it to connect to Prosody.

Additional configuration is possible with `services.jicofo`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.jigasi.enable` {#opt-services.jitsi-meet.jigasi.enable}

Whether to enable jigasi instance and configure it to connect to Prosody.

Additional configuration is possible with <option>services.jigasi</option>.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.nginx.enable` {#opt-services.jitsi-meet.nginx.enable}

Whether to enable nginx virtual host that will serve the javascript application and act as
a proxy for the XMPP server. Further nginx configuration can be done by adapting
`services.nginx.virtualHosts.<hostName>`.
When this is enabled, ACME will be used to retrieve a TLS certificate by default. To disable
this, set the `services.nginx.virtualHosts.<hostName>.enableACME` to
`false` and if appropriate do the same for
`services.nginx.virtualHosts.<hostName>.forceSSL`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.prosody.allowners_muc` {#opt-services.jitsi-meet.prosody.allowners_muc}

Add module allowners, any user in chat is able to
kick other. Usefull in jitsi-meet to kick ghosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.prosody.enable` {#opt-services.jitsi-meet.prosody.enable}

Whether to configure Prosody to relay XMPP messages between Jitsi Meet components. Turn this
off if you want to configure it manually.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.prosody.lockdown` {#opt-services.jitsi-meet.prosody.lockdown}

Whether to disable Prosody features not needed by Jitsi Meet.

The default Prosody configuration assumes that it will be used as a
general-purpose XMPP server rather than as a companion service for
Jitsi Meet. This option reconfigures Prosody to only listen on
localhost without support for TLS termination, XMPP federation or
the file transfer proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.secureDomain.authentication` {#opt-services.jitsi-meet.secureDomain.authentication}

The authentication type to be used by jitsi

*Type:* string

*Default:* `"internal_hashed"`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.secureDomain.enable` {#opt-services.jitsi-meet.secureDomain.enable}

Whether to enable Authenticated room creation.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.videobridge.enable` {#opt-services.jitsi-meet.videobridge.enable}

Jitsi Videobridge instance and configure it to connect to Prosody.

Additional configuration is possible with `services.jitsi-videobridge`

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-meet.videobridge.passwordFile` {#opt-services.jitsi-meet.videobridge.passwordFile}

File containing password to the Prosody account for videobridge.

If `null`, a file with password will be generated automatically. Setting
this option is useful if you plan to connect additional videobridges to the XMPP server.

*Type:* null or string

*Default:* `null`

*Example:* `"/run/keys/videobridge"`

*Declared by:* [`nixos/modules/services/web-apps/jitsi-meet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/jitsi-meet.nix)

## `services.jitsi-videobridge.colibriRestApi` {#opt-services.jitsi-videobridge.colibriRestApi}

Whether to enable the private rest API for the COLIBRI control interface.
Needed for monitoring jitsi, enabling scraping of the /colibri/stats endpoint.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.config` {#opt-services.jitsi-videobridge.config}

Videobridge configuration.

See [https://github.com/jitsi/jitsi-videobridge/blob/master/jvb/src/main/resources/reference.conf](https://github.com/jitsi/jitsi-videobridge/blob/master/jvb/src/main/resources/reference.conf)
for default configuration with comments.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  videobridge = {
    ice.udp.port = 5000;
    websockets = {
      enabled = true;
      server-id = "jvb1";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.enable` {#opt-services.jitsi-videobridge.enable}

Whether to enable Jitsi Videobridge, a WebRTC compatible video router.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.extraProperties` {#opt-services.jitsi-videobridge.extraProperties}

Additional Java properties passed to jitsi-videobridge.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.nat.harvesterAddresses` {#opt-services.jitsi-videobridge.nat.harvesterAddresses}

Addresses of public STUN services to use to automatically find
the public and local addresses of this Jitsi-Videobridge instance
without the need for manual configuration.

This option is ignored if [`services.jitsi-videobridge.nat.localAddress`](#opt-services.jitsi-videobridge.nat.localAddress)
and [`services.jitsi-videobridge.nat.publicAddress`](#opt-services.jitsi-videobridge.nat.publicAddress) are set.

*Type:* list of string

*Default:*

``` nix
[
  "stunserver.stunprotocol.org:3478"
  "stun.framasoft.org:3478"
  "meet-jit-si-turnrelay.jitsi.net:443"
]
```

*Example:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.nat.localAddress` {#opt-services.jitsi-videobridge.nat.localAddress}

Local address to assume when running behind NAT.

*Type:* null or string

*Default:* `null`

*Example:* `"192.168.1.42"`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.nat.publicAddress` {#opt-services.jitsi-videobridge.nat.publicAddress}

Public address to assume when running behind NAT.

*Type:* null or string

*Default:* `null`

*Example:* `"1.2.3.4"`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.openFirewall` {#opt-services.jitsi-videobridge.openFirewall}

Whether to open ports in the firewall for the videobridge.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.xmppConfigs` {#opt-services.jitsi-videobridge.xmppConfigs}

XMPP servers to connect to.

See [https://github.com/jitsi/jitsi-videobridge/blob/master/doc/muc.md](https://github.com/jitsi/jitsi-videobridge/blob/master/doc/muc.md) for more information.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "localhost" = {
    hostName = "localhost";
    userName = "jvb";
    domain = "auth.xmpp.example.org";
    passwordFile = "/var/lib/jitsi-meet/videobridge-secret";
    mucJids = "jvbbrewery@internal.xmpp.example.org";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.xmppConfigs.<name>.disableCertificateVerification` {#opt-services.jitsi-videobridge.xmppConfigs._name_.disableCertificateVerification}

Whether to skip validation of the server's certificate.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.xmppConfigs.<name>.domain` {#opt-services.jitsi-videobridge.xmppConfigs._name_.domain}

Domain part of JID of the XMPP user, if it is different from hostName.

*Type:* null or string

*Default:* `null`

*Example:* `"auth.xmpp.example.org"`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.xmppConfigs.<name>.hostName` {#opt-services.jitsi-videobridge.xmppConfigs._name_.hostName}

Hostname of the XMPP server to connect to. Name of the attribute set is used by default.

*Type:* string

*Example:* `"xmpp.example.org"`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.xmppConfigs.<name>.mucJids` {#opt-services.jitsi-videobridge.xmppConfigs._name_.mucJids}

JID of the MUC to join. JiCoFo needs to be configured to join the same MUC.

*Type:* string

*Example:* `"jvbbrewery@internal.xmpp.example.org"`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.xmppConfigs.<name>.mucNickname` {#opt-services.jitsi-videobridge.xmppConfigs._name_.mucNickname}

Videobridges use the same XMPP account and need to be distinguished by the
nickname (aka resource part of the JID). By default, system hostname is used.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.xmppConfigs.<name>.passwordFile` {#opt-services.jitsi-videobridge.xmppConfigs._name_.passwordFile}

File containing the password for the user.

*Type:* string

*Example:* `"/run/keys/jitsi-videobridge-xmpp1"`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitsi-videobridge.xmppConfigs.<name>.userName` {#opt-services.jitsi-videobridge.xmppConfigs._name_.userName}

User part of the JID.

*Type:* string

*Default:* `"jvb"`

*Declared by:* [`nixos/modules/services/networking/jitsi-videobridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jitsi-videobridge.nix)

## `services.jitterentropy-rngd.enable` {#opt-services.jitterentropy-rngd.enable}

Whether to enable jitterentropy-rngd service configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/jitterentropy-rngd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/jitterentropy-rngd.nix)

## `services.jitterentropy-rngd.flags` {#opt-services.jitterentropy-rngd.flags}

Additional flags to pass to jitterentropy

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/security/jitterentropy-rngd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/jitterentropy-rngd.nix)

## `services.jitterentropy-rngd.forceSP800-90B` {#opt-services.jitterentropy-rngd.forceSP800-90B}

Force SP800-90B mode for entropy reading

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/jitterentropy-rngd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/jitterentropy-rngd.nix)

## `services.jitterentropy-rngd.memlockLimit` {#opt-services.jitterentropy-rngd.memlockLimit}

Set limit for lockable memory with mlock

*Type:* string

*Default:* `"2M"`

*Declared by:* [`nixos/modules/services/security/jitterentropy-rngd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/jitterentropy-rngd.nix)

## `services.jitterentropy-rngd.osr` {#opt-services.jitterentropy-rngd.osr}

Oversampling rate for jitterentropy (3 to 20)

*Type:* integer between 3 and 20 (both inclusive)

*Default:* `3`

*Declared by:* [`nixos/modules/services/security/jitterentropy-rngd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/jitterentropy-rngd.nix)

## `services.jitterentropy-rngd.package` {#opt-services.jitterentropy-rngd.package}

The jitterentropy-rngd package to use.

*Type:* package

*Default:* `pkgs.jitterentropy-rngd`

*Declared by:* [`nixos/modules/services/security/jitterentropy-rngd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/jitterentropy-rngd.nix)

## `services.jitterentropy-rngd.verbose` {#opt-services.jitterentropy-rngd.verbose}

Enable verbose log messages

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/jitterentropy-rngd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/jitterentropy-rngd.nix)

## `services.jmusicbot.enable` {#opt-services.jmusicbot.enable}

Whether to enable jmusicbot, a Discord music bot that's easy to set up and run yourself.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/jmusicbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jmusicbot.nix)

## `services.jmusicbot.package` {#opt-services.jmusicbot.package}

The jmusicbot package to use.

*Type:* package

*Default:* `pkgs.jmusicbot`

*Declared by:* [`nixos/modules/services/audio/jmusicbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jmusicbot.nix)

## `services.jmusicbot.stateDir` {#opt-services.jmusicbot.stateDir}

The directory where config.txt and serversettings.json is saved.
If left as the default value this directory will automatically be created before JMusicBot starts, otherwise the sysadmin is responsible for ensuring the directory exists with appropriate ownership and permissions.
Untouched by the value of this option config.txt needs to be placed manually into this directory.

*Type:* absolute path

*Default:* `"/var/lib/jmusicbot/"`

*Declared by:* [`nixos/modules/services/audio/jmusicbot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/jmusicbot.nix)

## `services.jotta-cli.enable` {#opt-services.jotta-cli.enable}

Whether to enable Jottacloud Command-line Tool.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/jotta-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jotta-cli.nix)

## `services.jotta-cli.options` {#opt-services.jotta-cli.options}

Command-line options passed to jottad.

*Type:* list of string

*Default:*

``` nix
[
  "stdoutlog"
  "datadir"
  "%h/.jottad/"
]
```

*Example:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/jotta-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jotta-cli.nix)

## `services.jotta-cli.package` {#opt-services.jotta-cli.package}

The jotta-cli package to use.

*Type:* package

*Default:* `pkgs.jotta-cli`

*Declared by:* [`nixos/modules/services/networking/jotta-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/jotta-cli.nix)

## `services.journalbeat.enable` {#opt-services.journalbeat.enable}

Whether to enable journalbeat.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/logging/journalbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalbeat.nix)

## `services.journalbeat.extraConfig` {#opt-services.journalbeat.extraConfig}

Any other configuration options you want to add

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/logging/journalbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalbeat.nix)

## `services.journalbeat.name` {#opt-services.journalbeat.name}

Name of the beat

*Type:* string

*Default:* `"journalbeat"`

*Declared by:* [`nixos/modules/services/logging/journalbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalbeat.nix)

## `services.journalbeat.package` {#opt-services.journalbeat.package}

The journalbeat package to use.

*Type:* package

*Default:* `pkgs.journalbeat`

*Declared by:* [`nixos/modules/services/logging/journalbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalbeat.nix)

## `services.journalbeat.stateDir` {#opt-services.journalbeat.stateDir}

Directory below `/var/lib/` to store journalbeat's
own logs and other data. This directory will be created automatically
using systemd's StateDirectory mechanism.

*Type:* string

*Default:* `"journalbeat"`

*Declared by:* [`nixos/modules/services/logging/journalbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalbeat.nix)

## `services.journalbeat.tags` {#opt-services.journalbeat.tags}

Tags to place on the shipped log messages

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/logging/journalbeat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalbeat.nix)

## `services.journald.gateway.enable` {#opt-services.journald.gateway.enable}

Whether to enable the HTTP gateway to the journal.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-gateway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-gateway.nix)

## `services.journald.gateway.merge` {#opt-services.journald.gateway.merge}

Serve entries interleaved from all available journals, including other
machines.

This has the same meaning as `--merge` option for
`journalctl(1)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-gateway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-gateway.nix)

## `services.journald.gateway.port` {#opt-services.journald.gateway.port}

The port to listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `19531`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-gateway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-gateway.nix)

## `services.journald.gateway.system` {#opt-services.journald.gateway.system}

Serve entries from system services and the kernel.

This has the same meaning as `--system` for `journalctl(1)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-gateway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-gateway.nix)

## `services.journald.gateway.user` {#opt-services.journald.gateway.user}

Serve entries from services for the current user.

This has the same meaning as `--user` for `journalctl(1)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-gateway.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-gateway.nix)

## `services.journald.remote.enable` {#opt-services.journald.remote.enable}

Whether to enable receiving systemd journals from the network.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-remote.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-remote.nix)

## `services.journald.remote.output` {#opt-services.journald.remote.output}

The location of the output journal.

In case the output file is not specified, journal files will be created
underneath the selected directory. Files will be called
`remote-hostname.journal`, where the `hostname` part is the
escaped hostname of the source endpoint of the connection, or the
numerical address if the hostname cannot be determined.

*Type:* string

*Default:* `"/var/log/journal/remote/"`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-remote.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-remote.nix)

## `services.journald.remote.port` {#opt-services.journald.remote.port}

The port to listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `19532`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-remote.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-remote.nix)

## `services.journald.remote.settings` {#opt-services.journald.remote.settings}

Configuration in the journal-remote configuration file. See
`journal-remote.conf(5)` for available options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-remote.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-remote.nix)

## `services.journald.remote.settings.Remote.Seal` {#opt-services.journald.remote.settings.Remote.Seal}

Periodically sign the data in the journal using Forward Secure
Sealing.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-remote.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-remote.nix)

## `services.journald.remote.settings.Remote.SplitMode` {#opt-services.journald.remote.settings.Remote.SplitMode}

With "host", a separate output file is used, based on the
hostname of the other endpoint of a connection. With "none", only
one output journal file is used.

*Type:* one of "host", "none"

*Default:* `"host"`

*Example:* `"none"`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-remote.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-remote.nix)

## `services.journald.settings.Journal` {#opt-services.journald.settings.Journal}

Options for the systemd journal service. See `journald.conf(5)`
man page for available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  ForwardToConsole = true;
  Storage = "volatile";
  TTYPath = "/dev/tty12";
}
```

*Declared by:* [`nixos/modules/system/boot/systemd/journald.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald.nix)

## `services.journald.upload.enable` {#opt-services.journald.upload.enable}

Whether to enable uploading the systemd journal to a remote server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-upload.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-upload.nix)

## `services.journald.upload.settings` {#opt-services.journald.upload.settings}

Configuration for journal-upload. See `journal-upload.conf(5)`
for available options.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-upload.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-upload.nix)

## `services.journald.upload.settings.Upload.NetworkTimeoutSec` {#opt-services.journald.upload.settings.Upload.NetworkTimeoutSec}

When network connectivity to the server is lost, this option
configures the time to wait for the connectivity to get restored.

If the server is not reachable over the network for the
configured time, `systemd-journal-upload` exits. Takes a value in
seconds (or in other time units if suffixed with "ms", "min",
"h", etc). For details, see `systemd.time(5)`.

*Type:* null or string

*Default:* `null`

*Example:* `"1s"`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-upload.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-upload.nix)

## `services.journald.upload.settings.Upload.ServerCertificateFile` {#opt-services.journald.upload.settings.Upload.ServerCertificateFile}

SSL CA certificate in PEM format.

In contrary to what the name suggests, this option configures the
client certificate sent to the remote journal server.

*Type:* null or string

*Default:* `null`

*Example:* `./server-ca.pem`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-upload.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-upload.nix)

## `services.journald.upload.settings.Upload.ServerKeyFile` {#opt-services.journald.upload.settings.Upload.ServerKeyFile}

SSL key in PEM format.

In contrary to what the name suggests, this option configures the
client private key sent to the remote journal server.

This key should not be world-readable, and must be readably by
the `systemd-journal` group.

*Type:* null or string

*Default:* `null`

*Example:* `./server-key.pem`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-upload.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-upload.nix)

## `services.journald.upload.settings.Upload.TrustedCertificateFile` {#opt-services.journald.upload.settings.Upload.TrustedCertificateFile}

SSL CA certificate.

This certificate will be used to check the remote journal HTTPS
server certificate.

*Type:* null or string

*Default:* `null`

*Example:* `./ca`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-upload.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-upload.nix)

## `services.journald.upload.settings.Upload.URL` {#opt-services.journald.upload.settings.Upload.URL}

The URL to upload the journal entries to.

See the description of `--url=` option in
`systemd-journal-upload(8)` for the description of
possible values.

*Type:* string

*Example:* `"https://192.168.1.1"`

*Declared by:* [`nixos/modules/system/boot/systemd/journald-upload.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/systemd/journald-upload.nix)

## `services.journaldriver.applicationCredentials` {#opt-services.journaldriver.applicationCredentials}

Path to the service account private key (in JSON-format) used
to forward log entries to Stackdriver Logging on non-GCP
instances.

This option is required on non-GCP machines, but should not be
set on GCP instances.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/logging/journaldriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journaldriver.nix)

## `services.journaldriver.enable` {#opt-services.journaldriver.enable}

Whether to enable journaldriver to forward journald logs to
Stackdriver Logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/journaldriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journaldriver.nix)

## `services.journaldriver.googleCloudProject` {#opt-services.journaldriver.googleCloudProject}

Configures the name of the Google Cloud project to which to
forward journald logs.

This option is required on non-GCP machines, but should not be
set on GCP instances.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/logging/journaldriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journaldriver.nix)

## `services.journaldriver.logLevel` {#opt-services.journaldriver.logLevel}

Log level at which journaldriver logs its own output.

*Type:* string

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/logging/journaldriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journaldriver.nix)

## `services.journaldriver.logName` {#opt-services.journaldriver.logName}

Configures the name of the target log in Stackdriver Logging.
This option can be set to, for example, the hostname of a
machine to improve the user experience in the logging
overview.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/logging/journaldriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journaldriver.nix)

## `services.journaldriver.logStream` {#opt-services.journaldriver.logStream}

Configures the name of the Stackdriver Logging log stream into
which to write journald entries.

This option is required on non-GCP machines, but should not be
set on GCP instances.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/logging/journaldriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journaldriver.nix)

## `services.journalwatch.accuracy` {#opt-services.journalwatch.accuracy}

The time window around the interval in which the journalwatch run will be scheduled.

The format is described in `systemd.time(7)`.

*Type:* string

*Default:* `"10min"`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.enable` {#opt-services.journalwatch.enable}

If enabled, periodically check the journal with journalwatch and report the results by mail.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.extraConfig` {#opt-services.journalwatch.extraConfig}

Extra lines to be added verbatim to the journalwatch/config configuration file.
You can add any commandline argument to the config, without the '--'.
See `journalwatch --help` for all arguments and their description.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.filterBlocks` {#opt-services.journalwatch.filterBlocks}

filterBlocks can be defined to blacklist journal messages which are not errors.
Each block matches on a log entry field, and the filters in that block then are matched
against all messages with a matching log entry field.

All messages whose PRIORITY is at least 6 (INFO) are processed by journalwatch.
If you don't specify any filterBlocks, PRIORITY is reduced to 5 (NOTICE) by default.

All regular expressions are extended Python regular expressions, for details
see: http://doc.pyschools.com/html/regex.html

*Type:* list of (submodule)

*Default:*

``` nix
[
  {
    filters = ''
      (Stopped|Stopping|Starting|Started) .*
      (Created slice|Removed slice) user-\d*\.slice\.
      Received SIGRTMIN\+24 from PID .*
      (Reached target|Stopped target) .*
      Startup finished in \d*ms\.
    '';
    match = "SYSLOG_IDENTIFIER = systemd";
  }
]
```

*Example:*

``` nix
[
  {
    filters = ''
      New session [a-z]?\d+ of user \w+\.
      Removed session [a-z]?\d+\.
    '';
    match = "_SYSTEMD_UNIT = systemd-logind.service";
  }
  {
    filters = ''
      pam_unix\(crond:session\): session (opened|closed) for user \w+
      \(\w+\) CMD .*
    '';
    match = "SYSLOG_IDENTIFIER = /(CROND|crond)/";
  }
]
```

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.filterBlocks.*.filters` {#opt-services.journalwatch.filterBlocks._.filters}

The filters to apply on all messages which satisfy `match`.
Any of those messages that match any specified filter will be removed from journalwatch's output.
Each filter is an extended Python regular expression.
You can specify multiple filters and separate them by newlines.
Lines starting with '#' are comments. Inline-comments are not permitted.

*Type:* string

*Example:*

``` nix
''
  (Stopped|Stopping|Starting|Started) .*
  (Reached target|Stopped target) .*
''
```

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.filterBlocks.*.match` {#opt-services.journalwatch.filterBlocks._.match}

Syntax: `field = value`
Specifies the log entry `field` this block should apply to.
If the `field` of a message matches this `value`,
this patternBlock's `filters` are applied.
If `value` starts and ends with a slash, it is interpreted as
an extended python regular expression, if not, it's an exact match.
The journal fields are explained in `systemd.journal-fields(7)`.

*Type:* string

*Example:* `"SYSLOG_IDENTIFIER = systemd"`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.interval` {#opt-services.journalwatch.interval}

How often to run journalwatch.

The format is described in `systemd.time(7)`.

*Type:* string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.mailBinary` {#opt-services.journalwatch.mailBinary}

Sendmail-compatible binary to be used to send the messages.

*Type:* absolute path

*Default:* `"/run/wrappers/bin/sendmail"`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.mailFrom` {#opt-services.journalwatch.mailFrom}

Mail address to send journalwatch reports from.

*Type:* string

*Default:* `"journalwatch@${config.networking.hostName}"`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.mailTo` {#opt-services.journalwatch.mailTo}

Mail address to send journalwatch reports to.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.package` {#opt-services.journalwatch.package}

The journalwatch package to use.

*Type:* package

*Default:* `pkgs.journalwatch`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.journalwatch.priority` {#opt-services.journalwatch.priority}

Lowest priority of message to be considered.
A value between 7 ("debug"), and 0 ("emerg"). Defaults to 6 ("info").
If you don't care about anything with "info" priority, you can reduce
this to e.g. 5 ("notice") to considerably reduce the amount of
messages without needing many `filterBlocks`.

*Type:* integer between 0 and 7 (both inclusive)

*Default:* `6`

*Declared by:* [`nixos/modules/services/logging/journalwatch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/logging/journalwatch.nix)

## `services.joycond.enable` {#opt-services.joycond.enable}

Whether to enable support for Nintendo Pro Controllers and Joycons.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/joycond.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/joycond.nix)

## `services.joycond.package` {#opt-services.joycond.package}

The joycond package to use.

*Type:* package

*Default:* `pkgs.joycond`

*Declared by:* [`nixos/modules/services/hardware/joycond.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/joycond.nix)

## `services.jupyter.command` {#opt-services.jupyter.command}

Which command the service runs. Note that not all jupyter packages
have all commands, e.g. `jupyter lab` isn't present in the `notebook` package.

*Type:* string

*Default:* `"jupyter notebook"`

*Example:* `"jupyter lab"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.enable` {#opt-services.jupyter.enable}

Whether to enable Jupyter development server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.extraEnvironmentVariables` {#opt-services.jupyter.extraEnvironmentVariables}

Extra environment variables to be set in the runtime context of jupyter notebook

*Type:* attribute set of (null or (list of (signed integer or string or absolute path)) or signed integer or string or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{
  PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
  PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
}
```

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.extraPackages` {#opt-services.jupyter.extraPackages}

Extra packages to be available in the jupyter runtime environment

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  pkgs.python3.pkgs.nbconvert
  pkgs.python3.pkgs.playwright
]
```

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.group` {#opt-services.jupyter.group}

Name of the group used to run the jupyter service.
Use this if you want to create a group of users that are able to view the notebook directory's content.

*Type:* string

*Default:* `"jupyter"`

*Example:* `"users"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.ip` {#opt-services.jupyter.ip}

IP address Jupyter will be listening on.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.kernels` {#opt-services.jupyter.kernels}

Declarative kernel config.

Kernels can be declared in any language that supports and has the required
dependencies to communicate with a jupyter server.
In python's case, it means that ipykernel package must always be included in
the list of packages of the targeted environment.

*Type:* null or (attribute set of (open submodule of (JSON value)))

*Default:* `null`

*Example:*

``` nix
{
  python3 = let
    env = (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
            ipykernel
            pandas
            scikit-learn
          ]));
  in {
    displayName = "Python 3 for machine learning";
    argv = [
      "${env.interpreter}"
      "-m"
      "ipykernel_launcher"
      "-f"
      "{connection_file}"
    ];
    language = "python";
    logo32 = "${env.sitePackages}/ipykernel/resources/logo-32x32.png";
    logo64 = "${env.sitePackages}/ipykernel/resources/logo-64x64.png";
    extraPaths = {
      "cool.txt" = pkgs.writeText "cool" "cool content";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.kernels.<name>.argv` {#opt-services.jupyter.kernels._name_.argv}

Command and arguments to start the kernel.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "{customEnv.interpreter}"
  "-m"
  "ipykernel_launcher"
  "-f"
  "{connection_file}"
]
```

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.kernels.<name>.displayName` {#opt-services.jupyter.kernels._name_.displayName}

Name that will be shown to the user.

*Type:* string

*Default:* `""`

*Example:*

``` nix
"Python 3"
"Python 3 for Data Science"
```

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.kernels.<name>.env` {#opt-services.jupyter.kernels._name_.env}

Environment variables to set for the kernel.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  OMP_NUM_THREADS = "1";
}
```

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.kernels.<name>.extraPaths` {#opt-services.jupyter.kernels._name_.extraPaths}

Extra paths to link in kernel directory

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:* `"{ examples = ${env.sitePack}/IRkernel/kernelspec/kernel.js"; }`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.kernels.<name>.language` {#opt-services.jupyter.kernels._name_.language}

Language of the environment. Typically the name of the binary.

*Type:* string

*Example:* `"python"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.kernels.<name>.logo32` {#opt-services.jupyter.kernels._name_.logo32}

Path to 32x32 logo png.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${env.sitePackages}/ipykernel/resources/logo-32x32.png"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.kernels.<name>.logo64` {#opt-services.jupyter.kernels._name_.logo64}

Path to 64x64 logo png.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${env.sitePackages}/ipykernel/resources/logo-64x64.png"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.notebookConfig` {#opt-services.jupyter.notebookConfig}

Raw jupyter config.
Please use the password configuration option to set a password instead of passing it in here.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.notebookDir` {#opt-services.jupyter.notebookDir}

Root directory for notebooks.

*Type:* string

*Default:* `"~/"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.package` {#opt-services.jupyter.package}

The jupyter package to use.

*Type:* package

*Default:* `pkgs.python3.pkgs.jupyter`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.password` {#opt-services.jupyter.password}

Password to use with notebook.
Can be generated following: [https://jupyter-server.readthedocs.io/en/stable/operators/public-server.html#preparing-a-hashed-password](https://jupyter-server.readthedocs.io/en/stable/operators/public-server.html#preparing-a-hashed-password)

*Type:* string

*Example:* `"argon2:$argon2id$v=19$m=10240,t=10,p=8$48hF+vTUuy1LB83/GzNhUg$J1nx4jPWD7PwOJHs5OtDW8pjYK2s0c1R3rYGbSIKB54"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.port` {#opt-services.jupyter.port}

Port number Jupyter will be listening on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8888`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyter.user` {#opt-services.jupyter.user}

Name of the user used to run the jupyter service.
For security reason, jupyter should really not be run as root.
If not set (jupyter), the service will create a jupyter user with appropriate settings.

*Type:* string

*Default:* `"jupyter"`

*Example:* `"aborsu"`

*Declared by:* [`nixos/modules/services/development/jupyter/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyter/default.nix)

## `services.jupyterhub.authentication` {#opt-services.jupyterhub.authentication}

Jupyterhub authentication to use

There are many authenticators available including: oauth, pam,
ldap, kerberos, etc.

*Type:* string

*Default:* `"jupyterhub.auth.PAMAuthenticator"`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.enable` {#opt-services.jupyterhub.enable}

Whether to enable Jupyterhub development server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.extraConfig` {#opt-services.jupyterhub.extraConfig}

Extra contents appended to the jupyterhub configuration

Jupyterhub configuration is a normal python file using
Traitlets. [https://jupyterhub.readthedocs.io/en/stable/getting-started/config-basics.html](https://jupyterhub.readthedocs.io/en/stable/getting-started/config-basics.html). The
base configuration of this module was designed to have sane
defaults for configuration but you can override anything since
this is a python file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  c.SystemdSpawner.mem_limit = '8G'
  c.SystemdSpawner.cpu_limit = 2.0
''
```

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.host` {#opt-services.jupyterhub.host}

Bind IP JupyterHub will be listening on

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.jupyterhubEnv` {#opt-services.jupyterhub.jupyterhubEnv}

Python environment to run jupyterhub

Customizing will affect the packages available in the hub and
proxy. This will allow packages to be available for the
extraConfig that you may need. This will not normally need to
be changed.

*Type:* package

*Default:*

``` nix
pkgs.python3.withPackages (p: with p; [
  jupyterhub
  jupyterhub-systemdspawner
])
```

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.jupyterlabEnv` {#opt-services.jupyterhub.jupyterlabEnv}

Python environment to run jupyterlab

Customizing will affect the packages available in the
jupyterlab server and the default kernel provided. This is the
way to customize the jupyterlab extensions and jupyter
notebook extensions. This will not normally need to
be changed.

*Type:* package

*Default:*

``` nix
pkgs.python3.withPackages (p: with p; [
  jupyterhub
  jupyterlab
])
```

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.kernels` {#opt-services.jupyterhub.kernels}

Declarative kernel config

Kernels can be declared in any language that supports and has
the required dependencies to communicate with a jupyter server.
In python's case, it means that ipykernel package must always be
included in the list of packages of the targeted environment.

*Type:* null or (attribute set of (open submodule of (JSON value)))

*Default:* `null`

*Example:*

``` nix
{
  python3 = let
    env = (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
            ipykernel
            pandas
            scikit-learn
          ]));
  in {
    displayName = "Python 3 for machine learning";
    argv = [
      "${env.interpreter}"
      "-m"
      "ipykernel_launcher"
      "-f"
      "{connection_file}"
    ];
    language = "python";
    logo32 = "${env}/${env.sitePackages}/ipykernel/resources/logo-32x32.png";
    logo64 = "${env}/${env.sitePackages}/ipykernel/resources/logo-64x64.png";
  };
}
```

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.kernels.<name>.argv` {#opt-services.jupyterhub.kernels._name_.argv}

Command and arguments to start the kernel.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "{customEnv.interpreter}"
  "-m"
  "ipykernel_launcher"
  "-f"
  "{connection_file}"
]
```

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.kernels.<name>.displayName` {#opt-services.jupyterhub.kernels._name_.displayName}

Name that will be shown to the user.

*Type:* string

*Default:* `""`

*Example:*

``` nix
"Python 3"
"Python 3 for Data Science"
```

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.kernels.<name>.env` {#opt-services.jupyterhub.kernels._name_.env}

Environment variables to set for the kernel.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  OMP_NUM_THREADS = "1";
}
```

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.kernels.<name>.extraPaths` {#opt-services.jupyterhub.kernels._name_.extraPaths}

Extra paths to link in kernel directory

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:* `"{ examples = ${env.sitePack}/IRkernel/kernelspec/kernel.js"; }`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.kernels.<name>.language` {#opt-services.jupyterhub.kernels._name_.language}

Language of the environment. Typically the name of the binary.

*Type:* string

*Example:* `"python"`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.kernels.<name>.logo32` {#opt-services.jupyterhub.kernels._name_.logo32}

Path to 32x32 logo png.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${env.sitePackages}/ipykernel/resources/logo-32x32.png"`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.kernels.<name>.logo64` {#opt-services.jupyterhub.kernels._name_.logo64}

Path to 64x64 logo png.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${env.sitePackages}/ipykernel/resources/logo-64x64.png"`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.port` {#opt-services.jupyterhub.port}

Port number Jupyterhub will be listening on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.spawner` {#opt-services.jupyterhub.spawner}

Jupyterhub spawner to use

There are many spawners available including: local process,
systemd, docker, kubernetes, yarn, batch, etc.

*Type:* string

*Default:* `"systemdspawner.SystemdSpawner"`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)

## `services.jupyterhub.stateDirectory` {#opt-services.jupyterhub.stateDirectory}

Directory for jupyterhub state (token + database)

*Type:* string

*Default:* `"jupyterhub"`

*Declared by:* [`nixos/modules/services/development/jupyterhub/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/jupyterhub/default.nix)
