# hardware {#sec-options-hardware}

## `hardware.acpilight.enable` {#opt-hardware.acpilight.enable}

Whether to enable acpilight.
This will allow brightness control via the supplied xbacklight binary from users in the video group. Contrary to what the name suggests, this *will* work without a running X server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/acpilight.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/acpilight.nix)

## `hardware.alsa.cardAliases` {#opt-hardware.alsa.cardAliases}

Assign custom names and reorder the sound cards.

::: note
You can find the card ids by looking at `/proc/asound/cards`.
:::

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  soundchip = { driver = "snd_intel_hda"; id = 0; };
  videocard = { driver = "snd_intel_hda"; id = 1; };
  usb       = { driver = "snd_usb_audio"; id = 2; };
}
```

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.cardAliases.<name>.driver` {#opt-hardware.alsa.cardAliases._name_.driver}

Name of the kernel module that provides the card.

*Type:* string

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.cardAliases.<name>.id` {#opt-hardware.alsa.cardAliases._name_.id}

The ID of the sound card

*Type:* signed integer

*Default:* `"default"`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.config` {#opt-hardware.alsa.config}

The content of the system-wide ALSA configuration (/etc/asound.conf).

Documentation of the configuration language and examples can be found
in the unofficial ALSA wiki: [https://alsa.opensrc.org/Asoundrc](https://alsa.opensrc.org/Asoundrc)

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
# Send audio to a remote host via SSH
pcm.remote {
  @args [ HOSTNAME ]
  @args.HOSTNAME { type string }
  type file
  format raw
  slave.pcm pcm.null
  file {
    @func concat
    strings [
      "| ${lib.getExec pkgs.openssh} -C "
      $HOSTNAME
      " aplay -f %f -c %c -r %r -"
    ]
  }
}
```

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.controls` {#opt-hardware.alsa.controls}

Virtual volume controls (softvols) to add to a sound card.
These can be used to control the volume of specific applications
or a digital output device (HDMI video card).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  firefox = { device = "front"; maxVolume = -25.0; };
  mpv     = { device = "front"; maxVolume = -25.0; };
  # and run programs with `env ALSA_AUDIO_OUT=<name>`
}
```

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.controls.<name>.card` {#opt-hardware.alsa.controls._name_.card}

Name of the PCM card to control (slave).

*Type:* string

*Default:* `"default"`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.controls.<name>.device` {#opt-hardware.alsa.controls._name_.device}

Name of the PCM device to control (slave).

*Type:* string

*Default:* `"default"`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.controls.<name>.maxVolume` {#opt-hardware.alsa.controls._name_.maxVolume}

The maximum volume in dB.

*Type:* floating point number

*Default:* `0.0`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.controls.<name>.name` {#opt-hardware.alsa.controls._name_.name}

Name of the control, as it appears in `alsamixer`.
If null it will be the same as the softvol device name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.defaultDevice.capture` {#opt-hardware.alsa.defaultDevice.capture}

The default capture device (i.e. microphone).
Leave empty to let ALSA pick the default automatically.

::: note
The device can be changed at runtime by setting the ALSA\_AUDIO\_IN
environment variables (but only before starting a program).
:::

*Type:* string

*Default:* `""`

*Example:* `"dsnoop:CARD=0,DEV=2"`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.defaultDevice.playback` {#opt-hardware.alsa.defaultDevice.playback}

The default playback device.
Leave empty to let ALSA pick the default automatically.

::: note
The device can be changed at runtime by setting the ALSA\_AUDIO\_OUT
environment variables (but only before starting a program).
:::

*Type:* string

*Default:* `""`

*Example:* `"dmix:CARD=1,DEV=0"`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.deviceAliases` {#opt-hardware.alsa.deviceAliases}

Assign custom names to sound cards.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  hdmi1 = "hw:CARD=videocard,DEV=5";
  hdmi2 = "hw:CARD=videocard,DEV=6";
}
```

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.enable` {#opt-hardware.alsa.enable}

Whether to set up the user space part of the Advanced Linux Sound Architecture (ALSA)

::: warning
Enable this option only if you want to use ALSA as your main sound system,
not if you're using a sound server (e.g. PulseAudio or Pipewire).
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.enableBluetooth` {#opt-hardware.alsa.enableBluetooth}

Whether to enable Bluetooth audio support via BlueALSA.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.enableOSSEmulation` {#opt-hardware.alsa.enableOSSEmulation}

Whether to enable the OSS emulation.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.enablePersistence` {#opt-hardware.alsa.enablePersistence}

Whether to enable ALSA sound card state saving on shutdown.
This is generally not necessary if you're using an external sound server.

*Type:* boolean

*Default:* `config.hardware.alsa.enable`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.enableRecorder` {#opt-hardware.alsa.enableRecorder}

Whether to set up a loopback device that continuously records and
allows to play back audio from the computer.

The loopback device is named `pcm.recorder`, audio can be saved
by capturing from this device as with any microphone.

::: note
By default the output is duplicated to the recorder assuming stereo
audio, for a more complex layout you have to override the pcm.splitter
device using `hardware.alsa.config`.
See the generated /etc/asound.conf for its definition.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.alsa.plugins` {#opt-hardware.alsa.plugins}

List of ALSA plugins to be added to the search path.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.bluez-alsa ]`

*Declared by:* [`nixos/modules/services/audio/alsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/alsa.nix)

## `hardware.amdgpu.initrd.enable` {#opt-hardware.amdgpu.initrd.enable}

Whether to enable loading `amdgpu` kernelModule in stage 1.
Can fix lower resolution in boot screen during initramfs phase
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/amdgpu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/amdgpu.nix)

## `hardware.amdgpu.legacySupport.enable` {#opt-hardware.amdgpu.legacySupport.enable}

Whether to enable using `amdgpu` kernel driver instead of `radeon` for Southern Islands
(Radeon HD 7000) series and Sea Islands (Radeon HD 8000)
series cards. Note: this removes support for analog video outputs,
which is only available in the `radeon` driver
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/amdgpu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/amdgpu.nix)

## `hardware.amdgpu.opencl.enable` {#opt-hardware.amdgpu.opencl.enable}

Whether to enable OpenCL support using ROCM runtime library.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/amdgpu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/amdgpu.nix)

## `hardware.amdgpu.overdrive.enable` {#opt-hardware.amdgpu.overdrive.enable}

Whether to enable `amdgpu` overdrive mode for overclocking.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/amdgpu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/amdgpu.nix)

## `hardware.amdgpu.overdrive.ppfeaturemask` {#opt-hardware.amdgpu.overdrive.ppfeaturemask}

Sets the `amdgpu.ppfeaturemask` kernel option. It can be used to enable the overdrive bit.
Default is `0xfffd7fff` as it is less likely to cause flicker issues. Setting it to
`0xffffffff` enables all features, but also can be unstable. See
[the kernel documentation](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/amd/include/amd_shared.h#n169)
for more information.

*Type:* string

*Default:* `"0xfffd7fff"`

*Example:* `"0xffffffff"`

*Declared by:* [`nixos/modules/services/hardware/amdgpu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/amdgpu.nix)

## `hardware.amdgpu.zluda.enable` {#opt-hardware.amdgpu.zluda.enable}

Whether to enable CUDA support using ZLUDA runtime library.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/amdgpu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/amdgpu.nix)

## `hardware.amdgpu.zluda.package` {#opt-hardware.amdgpu.zluda.package}

The zluda package to use.

*Type:* package

*Default:* `pkgs.zluda`

*Declared by:* [`nixos/modules/services/hardware/amdgpu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/amdgpu.nix)

## `hardware.apple.touchBar.enable` {#opt-hardware.apple.touchBar.enable}

Whether to enable support for the Touch Bar on some Apple laptops using tiny-dfr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/apple-touchbar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/apple-touchbar.nix)

## `hardware.apple.touchBar.package` {#opt-hardware.apple.touchBar.package}

The tiny-dfr package to use.

*Type:* package

*Default:* `pkgs.tiny-dfr`

*Declared by:* [`nixos/modules/hardware/apple-touchbar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/apple-touchbar.nix)

## `hardware.apple.touchBar.settings` {#opt-hardware.apple.touchBar.settings}

Configuration for tiny-dfr. See [example configuration](https://github.com/WhatAmISupposedToPutHere/tiny-dfr/blob/master/share/tiny-dfr/config.toml) for available options.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  MediaLayerDefault = true;
  ShowButtonOutlines = false;
  EnablePixelShift = true;
}
```

*Declared by:* [`nixos/modules/hardware/apple-touchbar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/apple-touchbar.nix)

## `hardware.bladeRF.enable` {#opt-hardware.bladeRF.enable}

Enables udev rules for BladeRF devices. By default grants access
to users in the "bladerf" group. You may want to install the
libbladeRF package.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/bladeRF.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/bladeRF.nix)

## `hardware.block.defaultScheduler` {#opt-hardware.block.defaultScheduler}

Default block I/O scheduler.

Unless `null`, the value is assigned through a udev rule matching all
block devices.

*Type:* null or udev rule value

*Default:* `null`

*Example:* `"kyber"`

*Declared by:* [`nixos/modules/hardware/iosched.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/iosched.nix)

## `hardware.block.defaultSchedulerExclude` {#opt-hardware.block.defaultSchedulerExclude}

Device name pattern to exclude from default scheduler assignment
through `config.hardware.block.defaultScheduler` and
`config.hardware.block.defaultSchedulerRotational`.

By default this excludes loop devices which generally do not benefit
from extra I/O scheduling in addition to the scheduling already
performed for their backing devices.

This setting does not affect `config.hardware.block.scheduler`.

*Type:* null or udev rule value

*Default:* `"loop[0-9]*"`

*Declared by:* [`nixos/modules/hardware/iosched.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/iosched.nix)

## `hardware.block.defaultSchedulerRotational` {#opt-hardware.block.defaultSchedulerRotational}

Default block I/O scheduler for rotational drives (e.g. hard disks).

Unless `null`, the value is assigned through a udev rule matching all
rotational block devices.

This option takes precedence over
`config.hardware.block.defaultScheduler`.

*Type:* null or udev rule value

*Default:* `null`

*Example:* `"bfq"`

*Declared by:* [`nixos/modules/hardware/iosched.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/iosched.nix)

## `hardware.block.scheduler` {#opt-hardware.block.scheduler}

Assign block I/O scheduler by device name pattern.

Names are matched using the `udev(7)` pattern syntax:

`*`
: Matches zero or more characters.

`?`
: Matches any single character.

`[]`
: Matches any single character specified in the brackets. Ranges are
supported via the `-` character.

`|`
: Separates alternative patterns.

Please note that overlapping patterns may produce unexpected results.
More complex configurations requiring these should instead be specified
directly through custom udev rules, for example via
[`config.services.udev.extraRules`](../../options/services-u/index.md#opt-services.udev.extraRules),
to ensure correct ordering.

Available schedulers depend on the kernel configuration but modern
Linux systems typically support:

`none`
: No‐operation scheduler with no re‐ordering of requests. Suitable
for devices with fast random I/O such as NVMe SSDs.

[`mq-deadline`](https://www.kernel.org/doc/html/latest/block/deadline-iosched.html)
: Simple latency‐oriented general‐purpose scheduler.

[`kyber`](https://www.kernel.org/doc/html/latest/block/kyber-iosched.html)
: Simple latency‐oriented scheduler for fast multi‐queue devices
like NVMe SSDs.

[`bfq`](https://www.kernel.org/doc/html/latest/block/bfq-iosched.html)
: Complex fairness‐oriented scheduler. Higher processing overhead,
but good interactive response, especially with slower devices.

Schedulers assigned through this option take precedence over
`config.hardware.block.defaultScheduler` and
`config.hardware.block.defaultSchedulerRotational` but may be
overridden by other udev rules.

*Type:* attribute set of udev rule value

*Default:* `{ }`

*Example:*

``` nix
{
  "mmcblk[0-9]*" = "bfq";
  "nvme[0-9]*" = "kyber";
}
```

*Declared by:* [`nixos/modules/hardware/iosched.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/iosched.nix)

## `hardware.bluetooth.disabledPlugins` {#opt-hardware.bluetooth.disabledPlugins}

Built-in plugins to disable

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bluetooth.nix)

## `hardware.bluetooth.enable` {#opt-hardware.bluetooth.enable}

Whether to enable support for Bluetooth.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bluetooth.nix)

## `hardware.bluetooth.hsphfpd.enable` {#opt-hardware.bluetooth.hsphfpd.enable}

Whether to enable support for hsphfpd\[-prototype\] implementation.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bluetooth.nix)

## `hardware.bluetooth.input` {#opt-hardware.bluetooth.input}

Set configuration for the input service (/etc/bluetooth/input.conf).
See [https://github.com/bluez/bluez/blob/master/profiles/input/input.conf](https://github.com/bluez/bluez/blob/master/profiles/input/input.conf) for full list of options.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  General = {
    ClassicBondedOnly = true;
    IdleTimeout = 30;
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bluetooth.nix)

## `hardware.bluetooth.network` {#opt-hardware.bluetooth.network}

Set configuration for the network service (/etc/bluetooth/network.conf).
See [https://github.com/bluez/bluez/blob/master/profiles/network/network.conf](https://github.com/bluez/bluez/blob/master/profiles/network/network.conf) for full list of options.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  General = {
    DisableSecurity = true;
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bluetooth.nix)

## `hardware.bluetooth.package` {#opt-hardware.bluetooth.package}

The bluez package to use.

*Type:* package

*Default:* `pkgs.bluez`

*Declared by:* [`nixos/modules/services/hardware/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bluetooth.nix)

## `hardware.bluetooth.powerOnBoot` {#opt-hardware.bluetooth.powerOnBoot}

Whether to power up the default Bluetooth controller on boot.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bluetooth.nix)

## `hardware.bluetooth.settings` {#opt-hardware.bluetooth.settings}

Set configuration for system-wide bluetooth (/etc/bluetooth/main.conf).
See [https://github.com/bluez/bluez/blob/master/src/main.conf](https://github.com/bluez/bluez/blob/master/src/main.conf) for full list of options.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  General = {
    ControllerMode = "bredr";
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bluetooth.nix)

## `hardware.brillo.enable` {#opt-hardware.brillo.enable}

Whether to enable brillo in userspace.
This will allow brightness control from users in the video group
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/brillo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/brillo.nix)

## `hardware.bumblebee.connectDisplay` {#opt-hardware.bumblebee.connectDisplay}

Set to true if you intend to connect your discrete card to a
monitor. This option will set up your Nvidia card for EDID
discovery and to turn on the monitor signal.

Only nvidia driver is supported so far.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/video/bumblebee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/bumblebee.nix)

## `hardware.bumblebee.driver` {#opt-hardware.bumblebee.driver}

Set driver used by bumblebeed. Supported are nouveau and nvidia.

*Type:* one of "nvidia", "nouveau"

*Default:* `"nvidia"`

*Declared by:* [`nixos/modules/hardware/video/bumblebee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/bumblebee.nix)

## `hardware.bumblebee.enable` {#opt-hardware.bumblebee.enable}

Enable the bumblebee daemon to manage Optimus hybrid video cards.
This should power off secondary GPU until its use is requested
by running an application with optirun.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/video/bumblebee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/bumblebee.nix)

## `hardware.bumblebee.group` {#opt-hardware.bumblebee.group}

Group for bumblebee socket

*Type:* string

*Default:* `"wheel"`

*Example:* `"video"`

*Declared by:* [`nixos/modules/hardware/video/bumblebee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/bumblebee.nix)

## `hardware.bumblebee.pmMethod` {#opt-hardware.bumblebee.pmMethod}

Set preferred power management method for unused card.

*Type:* one of "auto", "bbswitch", "switcheroo", "none"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/hardware/video/bumblebee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/bumblebee.nix)

## `hardware.ckb-next.enable` {#opt-hardware.ckb-next.enable}

Whether to enable the Corsair keyboard/mouse driver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/ckb-next.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/ckb-next.nix)

## `hardware.ckb-next.gid` {#opt-hardware.ckb-next.gid}

Limit access to the ckb daemon to a particular group.

*Type:* null or signed integer

*Default:* `null`

*Example:* `100`

*Declared by:* [`nixos/modules/hardware/ckb-next.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/ckb-next.nix)

## `hardware.ckb-next.package` {#opt-hardware.ckb-next.package}

The ckb-next package to use.

*Type:* package

*Default:* `pkgs.ckb-next`

*Declared by:* [`nixos/modules/hardware/ckb-next.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/ckb-next.nix)

## `hardware.coral.pcie.enable` {#opt-hardware.coral.pcie.enable}

Whether to enable Coral PCIe support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/coral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/coral.nix)

## `hardware.coral.usb.enable` {#opt-hardware.coral.usb.enable}

Whether to enable Coral USB support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/coral.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/coral.nix)

## `hardware.cpu.amd.microcodePackage` {#opt-hardware.cpu.amd.microcodePackage}

The microcode-amd package to use.

*Type:* package

*Default:* `pkgs.microcode-amd`

*Declared by:* [`nixos/modules/hardware/cpu/amd-microcode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-microcode.nix)

## `hardware.cpu.amd.ryzen-smu.enable` {#opt-hardware.cpu.amd.ryzen-smu.enable}

Whether to enable ryzen\_smu, a linux kernel driver that exposes access to the SMU (System Management Unit) for certain AMD Ryzen Processors.

WARNING: Damage cause by use of your AMD processor outside of official AMD specifications or outside of factory settings are not covered under any AMD product warranty and may not be covered by your board or system manufacturer's warranty
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/cpu/amd-ryzen-smu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-ryzen-smu.nix)

## `hardware.cpu.amd.sev.enable` {#opt-hardware.cpu.amd.sev.enable}

Whether to enable access to the AMD SEV device.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/cpu/amd-sev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-sev.nix)

## `hardware.cpu.amd.sev.group` {#opt-hardware.cpu.amd.sev.group}

Group to assign to the SEV device.

*Type:* string

*Default:* `"sev"`

*Declared by:* [`nixos/modules/hardware/cpu/amd-sev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-sev.nix)

## `hardware.cpu.amd.sev.mode` {#opt-hardware.cpu.amd.sev.mode}

Mode to set for the SEV device.

*Type:* string

*Default:* `"0660"`

*Declared by:* [`nixos/modules/hardware/cpu/amd-sev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-sev.nix)

## `hardware.cpu.amd.sev.user` {#opt-hardware.cpu.amd.sev.user}

Owner to assign to the SEV device.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/hardware/cpu/amd-sev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-sev.nix)

## `hardware.cpu.amd.sevGuest.enable` {#opt-hardware.cpu.amd.sevGuest.enable}

Whether to enable access to the AMD SEV guest device.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/cpu/amd-sev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-sev.nix)

## `hardware.cpu.amd.sevGuest.group` {#opt-hardware.cpu.amd.sevGuest.group}

Group to assign to the SEV guest device.

*Type:* string

*Default:* `"sev-guest"`

*Declared by:* [`nixos/modules/hardware/cpu/amd-sev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-sev.nix)

## `hardware.cpu.amd.sevGuest.mode` {#opt-hardware.cpu.amd.sevGuest.mode}

Mode to set for the SEV guest device.

*Type:* string

*Default:* `"0660"`

*Declared by:* [`nixos/modules/hardware/cpu/amd-sev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-sev.nix)

## `hardware.cpu.amd.sevGuest.user` {#opt-hardware.cpu.amd.sevGuest.user}

Owner to assign to the SEV guest device.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/hardware/cpu/amd-sev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-sev.nix)

## `hardware.cpu.amd.updateMicrocode` {#opt-hardware.cpu.amd.updateMicrocode}

Update the CPU microcode for AMD processors.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/cpu/amd-microcode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/amd-microcode.nix)

## `hardware.cpu.intel.microcodePackage` {#opt-hardware.cpu.intel.microcodePackage}

The microcode-intel package to use.

*Type:* package

*Default:* `pkgs.microcode-intel`

*Declared by:* [`nixos/modules/hardware/cpu/intel-microcode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/intel-microcode.nix)

## `hardware.cpu.intel.npu.enable` {#opt-hardware.cpu.intel.npu.enable}

Whether to enable Intel NPU support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/cpu/intel-npu.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/intel-npu.nix)

## `hardware.cpu.intel.sgx.enableDcapCompat` {#opt-hardware.cpu.intel.sgx.enableDcapCompat}

Whether to enable backward compatibility for SGX software build for the
out-of-tree Intel SGX DCAP driver.

Creates symbolic links for the SGX devices `/dev/sgx_enclave`
and `/dev/sgx_provision` to make them available as
`/dev/sgx/enclave`  and `/dev/sgx/provision`,
respectively.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/hardware/cpu/intel-sgx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/intel-sgx.nix)

## `hardware.cpu.intel.sgx.provision.enable` {#opt-hardware.cpu.intel.sgx.provision.enable}

Whether to enable access to the Intel SGX provisioning device.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/cpu/intel-sgx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/intel-sgx.nix)

## `hardware.cpu.intel.sgx.provision.group` {#opt-hardware.cpu.intel.sgx.provision.group}

Group to assign to the SGX provisioning device.

*Type:* string

*Default:* `"sgx_prv"`

*Declared by:* [`nixos/modules/hardware/cpu/intel-sgx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/intel-sgx.nix)

## `hardware.cpu.intel.sgx.provision.mode` {#opt-hardware.cpu.intel.sgx.provision.mode}

Mode to set for the SGX provisioning device.

*Type:* string

*Default:* `"0660"`

*Declared by:* [`nixos/modules/hardware/cpu/intel-sgx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/intel-sgx.nix)

## `hardware.cpu.intel.sgx.provision.user` {#opt-hardware.cpu.intel.sgx.provision.user}

Owner to assign to the SGX provisioning device.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/hardware/cpu/intel-sgx.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/intel-sgx.nix)

## `hardware.cpu.intel.updateMicrocode` {#opt-hardware.cpu.intel.updateMicrocode}

Update the CPU microcode for Intel processors.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/cpu/intel-microcode.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/intel-microcode.nix)

## `hardware.cpu.x86.msr.enable` {#opt-hardware.cpu.x86.msr.enable}

Whether to enable the `msr` (Model-Specific Registers) kernel module and configure `udev` rules for its devices (usually `/dev/cpu/*/msr`).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/cpu/x86-msr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/x86-msr.nix)

## `hardware.cpu.x86.msr.group` {#opt-hardware.cpu.x86.msr.group}

Group to set for devices of the `msr` kernel subsystem.

*Type:* string

*Default:* `"msr"`

*Example:* `"users"`

*Declared by:* [`nixos/modules/hardware/cpu/x86-msr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/x86-msr.nix)

## `hardware.cpu.x86.msr.mode` {#opt-hardware.cpu.x86.msr.mode}

Mode to set for devices of the `msr` kernel subsystem.

*Type:* string

*Default:* `"0640"`

*Example:* `"0660"`

*Declared by:* [`nixos/modules/hardware/cpu/x86-msr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/x86-msr.nix)

## `hardware.cpu.x86.msr.owner` {#opt-hardware.cpu.x86.msr.owner}

Owner to set for devices of the `msr` kernel subsystem.

*Type:* string

*Default:* `"root"`

*Example:* `"alice"`

*Declared by:* [`nixos/modules/hardware/cpu/x86-msr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/x86-msr.nix)

## `hardware.cpu.x86.msr.settings` {#opt-hardware.cpu.x86.msr.settings}

Parameters for the `msr` kernel module.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/hardware/cpu/x86-msr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/x86-msr.nix)

## `hardware.cpu.x86.msr.settings.allow-writes` {#opt-hardware.cpu.x86.msr.settings.allow-writes}

Whether to allow writes to MSRs (`"on"`) or not (`"off"`).

*Type:* null or one of "on", "off"

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/cpu/x86-msr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/cpu/x86-msr.nix)

## `hardware.decklink.enable` {#opt-hardware.decklink.enable}

Whether to enable hardware support for the Blackmagic Design Decklink audio/video interfaces.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/decklink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/decklink.nix)

## `hardware.deviceTree.dtbSource` {#opt-hardware.deviceTree.dtbSource}

Path to dtb directory that overlays and other processing will be applied to. Uses
device trees bundled with the Linux kernel by default.

*Type:* absolute path

*Default:* `${cfg.kernelPackage}/dtbs`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.dtboBuildExtraIncludePaths` {#opt-hardware.deviceTree.dtboBuildExtraIncludePaths}

Additional include paths that will be passed to the preprocessor when creating the final .dts to compile into .dtbo

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  ./my_custom_include_dir_1
  ./custom_include_dir_2
]
```

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.dtboBuildExtraPreprocessorFlags` {#opt-hardware.deviceTree.dtboBuildExtraPreprocessorFlags}

Additional flags to pass to the preprocessor during dtbo compilations

*Type:* list of string

*Default:* `[ ]`

*Example:* `[ "-DMY_DTB_DEFINE" ]`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.enable` {#opt-hardware.deviceTree.enable}

Build device tree files. These are used to describe the
non-discoverable hardware of a system.

*Type:* boolean

*Default:* `config.boot.kernelPackages.kernel.buildDTBs`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.filter` {#opt-hardware.deviceTree.filter}

Only include .dtb files matching glob expression.

*Type:* null or string

*Default:* `null`

*Example:* `"*rpi*.dtb"`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.kernelPackage` {#opt-hardware.deviceTree.kernelPackage}

Kernel package where device tree include directory is from. Also used as default source of dtb package to apply overlays to

*Type:* absolute path

*Default:* `config.boot.kernelPackages.kernel`

*Example:* `pkgs.linux_latest`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.name` {#opt-hardware.deviceTree.name}

The name of an explicit dtb to be loaded, relative to the dtb base.
Useful in extlinux scenarios if the bootloader doesn't pick the
right .dtb file from FDTDIR.

*Type:* null or string

*Default:* `null`

*Example:* `"some-dtb.dtb"`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.overlays` {#opt-hardware.deviceTree.overlays}

List of overlays to apply to base device-tree (.dtb) files.

*Type:* list of ((submodule) or absolute path convertible to it)

*Default:* `[ ]`

*Example:*

``` nix
[
  { name = "pps"; dtsFile = ./dts/pps.dts; }
  { name = "spi";
    dtsText = "...";
  }
  { name = "precompiled"; dtboFile = ./dtbos/example.dtbo; }
]
```

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.overlays.*.dtboFile` {#opt-hardware.deviceTree.overlays._.dtboFile}

Path to .dtbo compiled overlay file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.overlays.*.dtsFile` {#opt-hardware.deviceTree.overlays._.dtsFile}

Path to .dts overlay file, overlay is applied to
each .dtb file matching "compatible" of the overlay.

*Type:* null or absolute path

*Default:* `null`

*Example:* `./dts/overlays.dts`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.overlays.*.dtsText` {#opt-hardware.deviceTree.overlays._.dtsText}

Literal DTS contents, overlay is applied to
each .dtb file matching "compatible" of the overlay.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
''
  /dts-v1/;
  /plugin/;
  / {
          compatible = "raspberrypi";
  };
  &{/soc} {
          pps {
                  compatible = "pps-gpio";
                  status = "okay";
          };
  };
''
```

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.overlays.*.filter` {#opt-hardware.deviceTree.overlays._.filter}

Only apply to .dtb files matching glob expression.

*Type:* null or string

*Default:* `null`

*Example:* `"*rpi*.dtb"`

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.deviceTree.overlays.*.name` {#opt-hardware.deviceTree.overlays._.name}

Name of this overlay

*Type:* string

*Declared by:* [`nixos/modules/hardware/device-tree.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/device-tree.nix)

## `hardware.digitalbitbox.enable` {#opt-hardware.digitalbitbox.enable}

Enables udev rules for Digital Bitbox devices.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/digitalbitbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/digitalbitbox.nix)

## `hardware.digitalbitbox.package` {#opt-hardware.digitalbitbox.package}

The digitalbitbox package to use. This can be used to install a package with udev rules that differ from the defaults.

*Type:* package

*Default:* `pkgs.digitalbitbox`

*Declared by:* [`nixos/modules/hardware/digitalbitbox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/digitalbitbox.nix)

## `hardware.display.edid.enable` {#opt-hardware.display.edid.enable}

Enables handling of EDID files

*Type:* boolean

*Default:* `config.hardware.display.edid.packages != null`

*Declared by:* [`nixos/modules/services/hardware/display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/display.nix)

## `hardware.display.edid.linuxhw` {#opt-hardware.display.edid.linuxhw}

Exposes EDID files from users-sourced database at [https://github.com/linuxhw/EDID](https://github.com/linuxhw/EDID)

Attribute names will be mapped to EDID filenames `<NAME>.bin`.

Attribute values are lists of `awk` regexp patterns that (together) must match
exactly one line in either of:

- [AnalogDisplay.md](https://raw.githubusercontent.com/linuxhw/EDID/master/AnalogDisplay.md)
- [DigitalDisplay.md](https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md)

There is no universal way of locating your device config, but here are some practical tips:

1. locate your device:

- find your model number (second column)
- locate manufacturer (first column) and go through the list manually

2. narrow down results using other columns until there is only one left:

- `Name` column
- production date (`Made` column)
- resolution `Res`
- screen diagonal (`Inch` column)
- as a last resort use `ID` from the last column

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  PG278Q_2014 = [ "PG278Q" "2014" ];
}
```

*Declared by:* [`nixos/modules/services/hardware/display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/display.nix)

## `hardware.display.edid.modelines` {#opt-hardware.display.edid.modelines}

Attribute set of XFree86 Modelines automatically converted
and exposed as `edid/<name>.bin` files in initrd.
See for more information:

- [https://en.wikipedia.org/wiki/XFree86\_Modeline](https://en.wikipedia.org/wiki/XFree86_Modeline)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "PG278Q_60" = "    241.50   2560 2608 2640 2720   1440 1443 1448 1481   -hsync +vsync";
  "PG278Q_120" = "   497.75   2560 2608 2640 2720   1440 1443 1448 1525   +hsync -vsync";
  "U2711_60" = "     241.50   2560 2600 2632 2720   1440 1443 1448 1481   -hsync +vsync";
}
```

*Declared by:* [`nixos/modules/services/hardware/display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/display.nix)

## `hardware.display.edid.packages` {#opt-hardware.display.edid.packages}

List of packages containing EDID binary files at `$out/lib/firmware/edid`.
Such files will be available for use in `drm.edid_firmware` kernel
parameter as `edid/<filename>`.

You can craft one directly here or use sibling options `linuxhw` and `modelines`.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  (pkgs.runCommand "edid-custom" {} ''
    mkdir -p "$out/lib/firmware/edid"
    base64 -d > "$out/lib/firmware/edid/custom1.bin" <<'EOF'
    <insert your base64 encoded EDID file here `base64 < /sys/class/drm/card0-.../edid`>
    EOF
  '')
]
```

*Declared by:* [`nixos/modules/services/hardware/display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/display.nix)

## `hardware.display.outputs` {#opt-hardware.display.outputs}

Hardware/kernel-level configuration of specific outputs.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  edid.modelines."PG278Q_60" = "241.50   2560 2608 2640 2720   1440 1443 1448 1481   -hsync +vsync";
  outputs."DP-1".edid = "PG278Q_60.bin";
  outputs."DP-1".mode = "e";
}
```

*Declared by:* [`nixos/modules/services/hardware/display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/display.nix)

## `hardware.display.outputs.<name>.edid` {#opt-hardware.display.outputs._name_.edid}

An EDID filename to be used for configured display, as in `edid/<filename>`.
See for more information:

- `hardware.display.edid.packages`
- [https://wiki.archlinux.org/title/Kernel\_mode\_setting#Forcing\_modes\_and\_EDID](https://wiki.archlinux.org/title/Kernel_mode_setting#Forcing_modes_and_EDID)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/display.nix)

## `hardware.display.outputs.<name>.mode` {#opt-hardware.display.outputs._name_.mode}

A `video` kernel parameter (framebuffer mode) configuration for the specific output:

    <xres>x<yres>[M][R][-<bpp>][@<refresh>][i][m][eDd]

See for more information:

- [https://docs.kernel.org/fb/modedb.html](https://docs.kernel.org/fb/modedb.html)
- [https://wiki.archlinux.org/title/Kernel\_mode\_setting#Forcing\_modes](https://wiki.archlinux.org/title/Kernel_mode_setting#Forcing_modes)

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
"e"
```

*Declared by:* [`nixos/modules/services/hardware/display.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/display.nix)

## `hardware.enableAllFirmware` {#opt-hardware.enableAllFirmware}

Whether to enable all firmware, including [unfree packages that must be explictly allowed](https://nixos.org/manual/nixpkgs/unstable/#sec-allow-unfree).

Alternatively, use the [`hardware.enableRedistributableFirmware`](#opt-hardware.enableRedistributableFirmware) option.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/all-firmware.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/all-firmware.nix)

## `hardware.enableAllHardware` {#opt-hardware.enableAllHardware}

Whether to enable Enable support for most hardware.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/all-hardware.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/all-hardware.nix)

## `hardware.enableRedistributableFirmware` {#opt-hardware.enableRedistributableFirmware}

Whether to enable firmware with a license allowing redistribution.

*Type:* boolean

*Default:* `config.hardware.enableAllFirmware`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/all-firmware.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/all-firmware.nix)

## `hardware.facetimehd.enable` {#opt-hardware.facetimehd.enable}

Whether to enable the facetimehd kernel module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/webcam/facetimehd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/webcam/facetimehd.nix)

## `hardware.facetimehd.withCalibration` {#opt-hardware.facetimehd.withCalibration}

Whether to include sensor calibration files for facetimehd.
This makes colors look much better but is experimental, see
[https://github.com/patjak/facetimehd/wiki/Extracting-the-sensor-calibration-files](https://github.com/patjak/facetimehd/wiki/Extracting-the-sensor-calibration-files)
for details.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/webcam/facetimehd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/webcam/facetimehd.nix)

## `hardware.facter.debug.nix-diff` {#opt-hardware.facter.debug.nix-diff}

A shell application which will produce a nix-diff of the system closure with and without facter enabled.

*Type:* package

*Declared by:* [`nixos/modules/hardware/facter/debug.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/debug.nix)

## `hardware.facter.debug.nvd` {#opt-hardware.facter.debug.nvd}

A shell application which will produce an nvd diff of the system closure with and without facter enabled.

*Type:* package

*Declared by:* [`nixos/modules/hardware/facter/debug.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/debug.nix)

## `hardware.facter.detected.bluetooth.enable` {#opt-hardware.facter.detected.bluetooth.enable}

Whether to enable Enable the Facter bluetooth module.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/bluetooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/bluetooth.nix)

## `hardware.facter.detected.boot.disk.kernelModules` {#opt-hardware.facter.detected.boot.disk.kernelModules}

List of kernel modules that are needed to access the disk.

*Type:* list of string

*Default:* `"hardware dependent"`

*Declared by:* [`nixos/modules/hardware/facter/disk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/disk.nix)

## `hardware.facter.detected.boot.graphics.kernelModules` {#opt-hardware.facter.detected.boot.graphics.kernelModules}

List of kernel modules to load at boot for the graphics card.

*Type:* list of string

*Default:* `"hardware dependent"`

*Declared by:* [`nixos/modules/hardware/facter/graphics`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/graphics)

## `hardware.facter.detected.boot.initrd.networking.kernelModules` {#opt-hardware.facter.detected.boot.initrd.networking.kernelModules}

List of kernel modules to include in the initrd to support networking.

*Type:* list of string

*Default:* `"hardware dependent"`

*Declared by:* [`nixos/modules/hardware/facter/networking/initrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/networking/initrd.nix)

## `hardware.facter.detected.boot.keyboard.kernelModules` {#opt-hardware.facter.detected.boot.keyboard.kernelModules}

List of kernel modules to include in the initrd to support the keyboard.

*Type:* list of string

*Default:* `"hardware dependent"`

*Example:*

``` nix
[
  "usbhid"
]
```

*Declared by:* [`nixos/modules/hardware/facter/keyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/keyboard.nix)

## `hardware.facter.detected.camera.ipu6.enable` {#opt-hardware.facter.detected.camera.ipu6.enable}

Whether to enable webcams using ipu6 from Intel.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/camera/ipu6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/camera/ipu6.nix)

## `hardware.facter.detected.dhcp.enable` {#opt-hardware.facter.detected.dhcp.enable}

Whether to enable Facter dhcp module.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/networking`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/networking)

## `hardware.facter.detected.dhcp.interfaces` {#opt-hardware.facter.detected.dhcp.interfaces}

List of network interface names to configure with DHCP. Defaults to auto-detected physical interfaces.

*Type:* list of string

*Default:* `automatically detected from facter report`

*Example:*

``` nix
[
  "eth0"
  "wlan0"
]
```

*Declared by:* [`nixos/modules/hardware/facter/networking`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/networking)

## `hardware.facter.detected.fingerprint.enable` {#opt-hardware.facter.detected.fingerprint.enable}

Whether to enable Fingerprint devices.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/fingerprint`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/fingerprint)

## `hardware.facter.detected.graphics.amd.enable` {#opt-hardware.facter.detected.graphics.amd.enable}

Whether to enable Enable the AMD Graphics module.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/graphics/amd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/graphics/amd.nix)

## `hardware.facter.detected.graphics.enable` {#opt-hardware.facter.detected.graphics.enable}

Whether to enable Enable the Graphics module.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/graphics`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/graphics)

## `hardware.facter.detected.networking.intel._2200BG.enable` {#opt-hardware.facter.detected.networking.intel._2200BG.enable}

Whether to enable the Facter Intel 2200BG module.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/networking/intel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/networking/intel.nix)

## `hardware.facter.detected.networking.intel._3945ABG.enable` {#opt-hardware.facter.detected.networking.intel._3945ABG.enable}

Whether to enable the Facter Intel 3945ABG module.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/networking/intel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/networking/intel.nix)

## `hardware.facter.detected.uefi.supported` {#opt-hardware.facter.detected.uefi.supported}

Whether to enable the facter uefi module.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/boot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/boot.nix)

## `hardware.facter.detected.virtualisation.hyperv.enable` {#opt-hardware.facter.detected.virtualisation.hyperv.enable}

Whether to enable Enable the Facter Virtualisation Hyper-V module.

*Type:* boolean

*Default:* `"environment dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/virtualisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/virtualisation.nix)

## `hardware.facter.detected.virtualisation.none.enable` {#opt-hardware.facter.detected.virtualisation.none.enable}

Whether to enable Enable the Facter Virtualisation None module.

*Type:* boolean

*Default:* `"environment dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/virtualisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/virtualisation.nix)

## `hardware.facter.detected.virtualisation.oracle.enable` {#opt-hardware.facter.detected.virtualisation.oracle.enable}

Whether to enable Enable the Facter Virtualisation Oracle module.

*Type:* boolean

*Default:* `"environment dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/virtualisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/virtualisation.nix)

## `hardware.facter.detected.virtualisation.parallels.enable` {#opt-hardware.facter.detected.virtualisation.parallels.enable}

Whether to enable Enable the Facter Virtualisation Parallels module.

*Type:* boolean

*Default:* `"environment dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/virtualisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/virtualisation.nix)

## `hardware.facter.detected.virtualisation.qemu.enable` {#opt-hardware.facter.detected.virtualisation.qemu.enable}

Whether to enable Enable the Facter Virtualisation Qemu module.

*Type:* boolean

*Default:* `"environment dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/virtualisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/virtualisation.nix)

## `hardware.facter.detected.virtualisation.virtio_scsi.enable` {#opt-hardware.facter.detected.virtualisation.virtio_scsi.enable}

Whether to enable Enable the Facter Virtualisation Virtio SCSI module.

*Type:* boolean

*Default:* `"hardware dependent"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/facter/virtualisation.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter/virtualisation.nix)

## `hardware.facter.enable` {#opt-hardware.facter.enable}

Whether to enable automatic hardware configuration using a report generated by nixos-facter.

See [https://nix-community.github.io/nixos-facter/](https://nix-community.github.io/nixos-facter/) for more information.

*Type:* boolean

*Default:*

``` nix
config.hardware.facter.report != { }
```

*Declared by:* [`nixos/modules/hardware/facter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter)

## `hardware.facter.report` {#opt-hardware.facter.report}

Hardware report data generated by nixos-facter.

See [https://nix-community.github.io/nixos-facter/](https://nix-community.github.io/nixos-facter/) for more information.

*Type:* attribute set of anything

*Default:* `"A JSON import from config.hardware.facter.reportPath (if not null), {} otherwise."`

*Declared by:* [`nixos/modules/hardware/facter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter)

## `hardware.facter.reportPath` {#opt-hardware.facter.reportPath}

Path to a hardware report generated by nixos-facter.

To generate a report, run the following as root:

```
nix-shell -p nixos-facter --run nixos-facter > facter.json
```

See [https://nix-community.github.io/nixos-facter/](https://nix-community.github.io/nixos-facter/) for more information.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/facter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/facter)

## `hardware.fancontrol.config` {#opt-hardware.fancontrol.config}

Required fancontrol configuration file content. See `pwmconfig(8)` from the lm\_sensors package.

*Type:* strings concatenated with "\\n"

*Example:*

``` nix
''
  # Configuration file generated by pwmconfig
  INTERVAL=10
  DEVPATH=hwmon3=devices/virtual/thermal/thermal_zone2 hwmon4=devices/platform/f71882fg.656
  DEVNAME=hwmon3=soc_dts1 hwmon4=f71869a
  FCTEMPS=hwmon4/device/pwm1=hwmon3/temp1_input
  FCFANS=hwmon4/device/pwm1=hwmon4/device/fan1_input
  MINTEMP=hwmon4/device/pwm1=35
  MAXTEMP=hwmon4/device/pwm1=65
  MINSTART=hwmon4/device/pwm1=150
  MINSTOP=hwmon4/device/pwm1=0
''
```

*Declared by:* [`nixos/modules/services/hardware/fancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/fancontrol.nix)

## `hardware.fancontrol.enable` {#opt-hardware.fancontrol.enable}

Whether to enable software fan control (requires fancontrol.config).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/fancontrol.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/fancontrol.nix)

## `hardware.firmware` {#opt-hardware.firmware}

List of packages containing firmware files.  Such files
will be loaded automatically if the kernel asks for them
(i.e., when it has detected specific hardware that requires
firmware to function).  If multiple packages contain firmware
files with the same name, the first package in the list takes
precedence.  Note that you must rebuild your system if you add
files to any of these directories.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `hardware.firmwareCompression` {#opt-hardware.firmwareCompression}

Whether to compress firmware files.
Defaults depend on the kernel version.
For kernels older than 5.3, firmware files are not compressed.
For kernels 5.3 and newer, firmware files are compressed with xz.
For kernels 5.19 and newer, firmware files are compressed with zstd.

*Type:* one of "xz", "zstd", "none"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/hardware/udev.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/udev.nix)

## `hardware.flipperzero.enable` {#opt-hardware.flipperzero.enable}

Whether to enable udev rules and software for Flipper Zero devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/flipperzero.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/flipperzero.nix)

## `hardware.flirc.enable` {#opt-hardware.flirc.enable}

Whether to enable software to configure a Flirc USB device.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/flirc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/flirc.nix)

## `hardware.fw-fanctrl.disableBatteryTempCheck` {#opt-hardware.fw-fanctrl.disableBatteryTempCheck}

Disable checking battery temperature sensor

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.enable` {#opt-hardware.fw-fanctrl.enable}

Whether to enable the fw-fanctrl systemd service and install the needed packages.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.frameworkToolPackage` {#opt-hardware.fw-fanctrl.frameworkToolPackage}

The framework-tool package to use.

*Type:* package

*Default:* `pkgs.framework-tool`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.keepDefaultStrategies` {#opt-hardware.fw-fanctrl.keepDefaultStrategies}

Keep the default strategies of the fw-fanctrl package.
Set this to false if you only want to see your own strategies defined with `hardware.fw-fanctrl.config.strategies`

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.package` {#opt-hardware.fw-fanctrl.package}

The fw-fanctrl package to use.

*Type:* package

*Default:* `pkgs.fw-fanctrl`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings` {#opt-hardware.fw-fanctrl.settings}

Additional config entries for the fw-fanctrl service (documentation: [https://github.com/TamtamHero/fw-fanctrl/blob/main/doc/configuration.md](https://github.com/TamtamHero/fw-fanctrl/blob/main/doc/configuration.md))

*Type:* open submodule of attribute set of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings.defaultStrategy` {#opt-hardware.fw-fanctrl.settings.defaultStrategy}

Default strategy to use

*Type:* string

*Default:* `"lazy"`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings.strategies` {#opt-hardware.fw-fanctrl.settings.strategies}

Additional strategies which can be used by fw-fanctrl

*Type:* attribute set of (open submodule of attribute set of (JSON value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings.strategies.<name>.fanSpeedUpdateFrequency` {#opt-hardware.fw-fanctrl.settings.strategies._name_.fanSpeedUpdateFrequency}

How often the fan speed should be updated in seconds

*Type:* unsigned integer, meaning \>=0

*Default:* `5`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings.strategies.<name>.movingAverageInterval` {#opt-hardware.fw-fanctrl.settings.strategies._name_.movingAverageInterval}

Interval (seconds) of the last temperatures to use to calculate the average temperature

*Type:* unsigned integer, meaning \>=0

*Default:* `25`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings.strategies.<name>.speedCurve` {#opt-hardware.fw-fanctrl.settings.strategies._name_.speedCurve}

How should the speed curve look like

*Type:* list of (open submodule of attribute set of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings.strategies.<name>.speedCurve.*.speed` {#opt-hardware.fw-fanctrl.settings.strategies._name_.speedCurve._.speed}

Percent how fast the fan should run at

*Type:* integer between 0 and 100 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings.strategies.<name>.speedCurve.*.temp` {#opt-hardware.fw-fanctrl.settings.strategies._name_.speedCurve._.temp}

Temperature in °C at which the fan speed should be changed

*Type:* floating point number or signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.fw-fanctrl.settings.strategyOnDischarging` {#opt-hardware.fw-fanctrl.settings.strategyOnDischarging}

Default strategy on discharging

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/hardware/fw-fanctrl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/fw-fanctrl.nix)

## `hardware.glasgow.enable` {#opt-hardware.glasgow.enable}

Enables Glasgow udev rules and ensures 'plugdev' group exists.
This is a prerequisite to using Glasgow without being root.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/glasgow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/glasgow.nix)

## `hardware.gpgSmartcards.enable` {#opt-hardware.gpgSmartcards.enable}

Whether to enable udev rules for gnupg smart cards.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/gpgsmartcards.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/gpgsmartcards.nix)

## `hardware.graphics.enable` {#opt-hardware.graphics.enable}

Whether to enable hardware accelerated graphics drivers.

This is required to allow most graphical applications and
environments to use hardware rendering, video encode/decode
acceleration, etc.

This option should be enabled by default by the corresponding modules,
so you do not usually have to set it yourself.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/graphics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/graphics.nix)

## `hardware.graphics.enable32Bit` {#opt-hardware.graphics.enable32Bit}

On 64-bit systems, whether to also install 32-bit drivers for
32-bit applications (such as Wine).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/graphics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/graphics.nix)

## `hardware.graphics.extraPackages` {#opt-hardware.graphics.extraPackages}

Additional packages to add to the default graphics driver lookup path.
This can be used to add OpenCL drivers, VA-API/VDPAU drivers, etc.

::: note
intel-media-driver supports hardware Broadwell (2014) or newer. Older hardware should use the mostly unmaintained intel-vaapi-driver driver.
:::

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ intel-media-driver intel-ocl intel-vaapi-driver ]`

*Declared by:* [`nixos/modules/hardware/graphics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/graphics.nix)

## `hardware.graphics.extraPackages32` {#opt-hardware.graphics.extraPackages32}

Additional packages to add to 32-bit graphics driver lookup path on 64-bit systems.
Used when `enable32Bit` is set. This can be used to add OpenCL drivers, VA-API/VDPAU drivers, etc.

::: note
intel-media-driver supports hardware Broadwell (2014) or newer. Older hardware should use the mostly unmaintained intel-vaapi-driver driver.
:::

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs.pkgsi686Linux; [ intel-media-driver intel-vaapi-driver ]`

*Declared by:* [`nixos/modules/hardware/graphics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/graphics.nix)

## `hardware.graphics.package` {#opt-hardware.graphics.package}

The package that provides the default driver set.

*Type:* package

*Declared by:* [`nixos/modules/hardware/graphics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/graphics.nix)

## `hardware.graphics.package32` {#opt-hardware.graphics.package32}

The package that provides the 32-bit driver set. Used when `enable32Bit` is enabled.

*Type:* package

*Declared by:* [`nixos/modules/hardware/graphics.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/graphics.nix)

## `hardware.hackrf.enable` {#opt-hardware.hackrf.enable}

Enables hackrf udev rules and ensures 'plugdev' group exists.
This is a prerequisite to using HackRF devices without being root, since HackRF USB descriptors will be owned by plugdev through udev.
Ensure your user is a member of the 'plugdev' group after enabling.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/hackrf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/hackrf.nix)

## `hardware.hid-fanatecff.enable` {#opt-hardware.hid-fanatecff.enable}

Whether to enable hid-fanatecff, a Linux kernel driver that aims to add support for Fanatec devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/hid-fanatecff.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/hid-fanatecff.nix)

## `hardware.i2c.enable` {#opt-hardware.i2c.enable}

Whether to enable i2c devices support. By default access is granted to users in the "i2c"
group (will be created if non-existent) and any user with a seat, meaning
logged on the computer locally
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/i2c.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/i2c.nix)

## `hardware.i2c.group` {#opt-hardware.i2c.group}

Grant access to i2c devices (/dev/i2c-\*) to users in this group.

*Type:* string

*Default:* `"i2c"`

*Declared by:* [`nixos/modules/hardware/i2c.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/i2c.nix)

## `hardware.infiniband.enable` {#opt-hardware.infiniband.enable}

Whether to enable Infiniband support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/infiniband.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/infiniband.nix)

## `hardware.infiniband.guids` {#opt-hardware.infiniband.guids}

A list of infiniband port guids on the system. This is discoverable using `ibstat -p`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "0xe8ebd30000eee2e1"
]
```

*Declared by:* [`nixos/modules/hardware/infiniband.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/infiniband.nix)

## `hardware.inputmodule.enable` {#opt-hardware.inputmodule.enable}

Whether to enable Support for Framework input modules.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/inputmodule.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/inputmodule.nix)

## `hardware.intel-gpu-tools.enable` {#opt-hardware.intel-gpu-tools.enable}

Whether to enable a setcap wrapper for intel-gpu-tools.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/intel-gpu-tools.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/intel-gpu-tools.nix)

## `hardware.ipu6.enable` {#opt-hardware.ipu6.enable}

Whether to enable support for Intel IPU6/MIPI cameras.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/webcam/ipu6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/webcam/ipu6.nix)

## `hardware.ipu6.platform` {#opt-hardware.ipu6.platform}

Choose the version for your hardware platform.

Use `ipu6` for Tiger Lake, `ipu6ep` for Alder Lake or Raptor Lake,
and `ipu6epmtl` for Meteor Lake.

*Type:* one of "ipu6", "ipu6ep", "ipu6epmtl"

*Declared by:* [`nixos/modules/hardware/video/webcam/ipu6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/webcam/ipu6.nix)

## `hardware.ipu6.videoDeviceNumber` {#opt-hardware.ipu6.videoDeviceNumber}

v4l2loopback device number for the relay output (`/dev/videoN`).

Must be fixed so application camera permission grants, which are keyed to
the PipeWire node name (derived from the sysfs device path), survive
reboots. Choose a number above the IPU6 raw node range (typically 3-34)
and any other v4l2loopback devices on the system.

*Type:* signed integer

*Default:* `50`

*Declared by:* [`nixos/modules/hardware/video/webcam/ipu6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/webcam/ipu6.nix)

## `hardware.ipu7.enable` {#opt-hardware.ipu7.enable}

Whether to enable support for Intel IPU7/MIPI cameras.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/webcam/ipu7.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/webcam/ipu7.nix)

## `hardware.ipu7.platform` {#opt-hardware.ipu7.platform}

Choose the version for your hardware platform. The IPU reports which one
it is through its PCI ID, visible as the Multimedia controller in lspci.

- ipu7x (Lunar Lake, PCI 8086:645d)
  Sensor list: https://github.com/intel/ipu7-camera-hal/tree/main/config/linux/ipu7x/sensors
- ipu75xa (Panther Lake, PCI 8086:b05d)
  Sensor list: https://github.com/intel/ipu7-camera-hal/tree/main/config/linux/ipu75xa/sensors

*Type:* one of "ipu7x", "ipu75xa"

*Declared by:* [`nixos/modules/hardware/video/webcam/ipu7.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/webcam/ipu7.nix)

## `hardware.keyboard.qmk.enable` {#opt-hardware.keyboard.qmk.enable}

Whether to enable non-root access to the firmware of QMK keyboards.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/keyboard/qmk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/keyboard/qmk.nix)

## `hardware.keyboard.qmk.keychronSupport` {#opt-hardware.keyboard.qmk.keychronSupport}

Whether to enable udev rules for keychron QMK based keyboards.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/keyboard/qmk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/keyboard/qmk.nix)

## `hardware.keyboard.teck.enable` {#opt-hardware.keyboard.teck.enable}

Whether to enable non-root access to the firmware of TECK keyboards.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/keyboard/teck.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/keyboard/teck.nix)

## `hardware.keyboard.uhk.enable` {#opt-hardware.keyboard.uhk.enable}

Whether to enable non-root access to the firmware of UHK keyboards.
You need it when you want to flash a new firmware on the keyboard.
Access to the keyboard is granted to users in the "input" group.
You may want to install the uhk-agent package
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/keyboard/uhk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/keyboard/uhk.nix)

## `hardware.keyboard.zsa.enable` {#opt-hardware.keyboard.zsa.enable}

Whether to enable udev rules for keyboards from ZSA like the ErgoDox EZ, Planck EZ and Moonlander Mark I.
You need it when you want to flash a new configuration on the keyboard
or use their live training in the browser.
You may want to install the wally-cli package
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/keyboard/zsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/keyboard/zsa.nix)

## `hardware.kryoflux.enable` {#opt-hardware.kryoflux.enable}

Enables kryoflux udev rules, ensures 'floppy' group exists. This is a
prerequisite to using devices supported by kryoflux without being root,
since kryoflux device descriptors will be owned by floppy through udev.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/kryoflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/kryoflux.nix)

## `hardware.kryoflux.package` {#opt-hardware.kryoflux.package}

The kryoflux package to use.

*Type:* package

*Default:* `pkgs.kryoflux`

*Declared by:* [`nixos/modules/hardware/kryoflux.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/kryoflux.nix)

## `hardware.ksm.enable` {#opt-hardware.ksm.enable}

Whether to enable Linux kernel Same-Page Merging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/ksm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/ksm.nix)

## `hardware.ksm.sleep` {#opt-hardware.ksm.sleep}

How many milliseconds ksmd should sleep between scans.
Setting it to `null` uses the kernel's default time.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/ksm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/ksm.nix)

## `hardware.ledger.enable` {#opt-hardware.ledger.enable}

Whether to enable udev rules for Ledger devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/ledger.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/ledger.nix)

## `hardware.libftdi.enable` {#opt-hardware.libftdi.enable}

Whether to enable udev rules for devices supported by libftdi.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/libftdi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/libftdi.nix)

## `hardware.libftdi.package` {#opt-hardware.libftdi.package}

The libftdi1 package to use.

*Type:* package

*Default:* `pkgs.libftdi1`

*Declared by:* [`nixos/modules/hardware/libftdi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/libftdi.nix)

## `hardware.libjaylink.enable` {#opt-hardware.libjaylink.enable}

Whether to enable udev rules for devices supported by libjaylink.
Add users to the `jlink` group in order to grant
them access
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/libjaylink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/libjaylink.nix)

## `hardware.libjaylink.package` {#opt-hardware.libjaylink.package}

The libjaylink package to use.

*Type:* package

*Default:* `pkgs.libjaylink`

*Declared by:* [`nixos/modules/hardware/libjaylink.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/libjaylink.nix)

## `hardware.logitech.lcd.devices` {#opt-hardware.logitech.lcd.devices}

List of USB device ids supported by g15daemon.

You most likely do not need to change this.

*Type:* list of string

*Default:*

``` nix
[
  "0a07"
  "c222"
  "c225"
  "c227"
  "c251"
]
```

*Declared by:* [`nixos/modules/hardware/logitech.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/logitech.nix)

## `hardware.logitech.lcd.enable` {#opt-hardware.logitech.lcd.enable}

Whether to enable support for Logitech LCD Devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/logitech.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/logitech.nix)

## `hardware.logitech.lcd.startWhenNeeded` {#opt-hardware.logitech.lcd.startWhenNeeded}

Only run the service when an actual supported device is plugged.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/hardware/logitech.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/logitech.nix)

## `hardware.logitech.wireless.enable` {#opt-hardware.logitech.wireless.enable}

Whether to enable support for Logitech Wireless Devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/logitech.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/logitech.nix)

## `hardware.mcelog.enable` {#opt-hardware.mcelog.enable}

Enable the Machine Check Exception logger.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/mcelog.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/mcelog.nix)

## `hardware.mwProCapture.enable` {#opt-hardware.mwProCapture.enable}

Whether to enable the Magewell Pro Capture family kernel module.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/capture/mwprocapture.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/capture/mwprocapture.nix)

## `hardware.new-lg4ff.enable` {#opt-hardware.new-lg4ff.enable}

Enables improved Linux module drivers for Logitech driving wheels.
This will replace the existing in-kernel hid-logitech modules.
Works most notably on the Logitech G25, G27, G29 and Driving Force (GT).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/new-lg4ff.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/new-lg4ff.nix)

## `hardware.nfc-nci.enable` {#opt-hardware.nfc-nci.enable}

Whether to enable PN5xx kernel module with udev rules, libnfc-nci userland, and optional ifdnfc-nci PC/SC driver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/nfc-nci.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/nfc-nci.nix)

## `hardware.nfc-nci.enableIFD` {#opt-hardware.nfc-nci.enableIFD}

Register ifdnfc-nci as a serial reader with pcscd.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/hardware/nfc-nci.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/nfc-nci.nix)

## `hardware.nfc-nci.settings` {#opt-hardware.nfc-nci.settings}

Configuration to be written to the libncf-nci configuration files.
To understand the configuration format, refer to [https://github.com/NXPNFCLinux/linux\_libnfc-nci/tree/master/conf](https://github.com/NXPNFCLinux/linux_libnfc-nci/tree/master/conf).

*Type:* attribute set

*Default:*

``` nix
{
  init = {
    NXPLOG_EXTNS_LOGLEVEL = "0x01";
    NXPLOG_FWDNLD_LOGLEVEL = "0x00";
    NXPLOG_GLOBAL_LOGLEVEL = "0x01";
    NXPLOG_NCIHAL_LOGLEVEL = "0x01";
    NXPLOG_NCIR_LOGLEVEL = "0x01";
    NXPLOG_NCIX_LOGLEVEL = "0x01";
    NXPLOG_TML_LOGLEVEL = "0x01";
    NXP_ACT_PROP_EXTN = "{2F, 02, 00}";
    NXP_CORE_STANDBY = "{2F, 00, 01, 01}";
    NXP_I2C_FRAGMENTATION_ENABLED = "0x01";
    NXP_NFC_DEV_NODE = "\"/dev/pn544\"";
    NXP_NFC_PROFILE_EXTN = ''
      {20, 02, 05, 01,
        A0, 44, 01, 00
      }
    '';
  };
  nci = {
    APPL_TRACE_LEVEL = "0x01";
    HOST_LISTEN_TECH_MASK = "0x07";
    P2P_LISTEN_TECH_MASK = "0xC5";
    POLLING_TECH_MASK = "0xEF";
    PROTOCOL_TRACE_LEVEL = "0x01";
  };
  pn54x = {
    MIFARE_READER_ENABLE = "0x01";
    NXP_CORE_CONF = ''
      {20, 02, 2B, 0D,
        28, 01, 00,
        21, 01, 00,
        30, 01, 08,
        31, 01, 03,
        33, 04, 04, 03, 02, 01,
        54, 01, 06,
        50, 01, 02,
        5B, 01, 00,
        60, 01, 0E,
        80, 01, 01,
        81, 01, 01,
        82, 01, 0E,
        18, 01, 01
      }
    '';
    NXP_CORE_CONF_EXTN = ''
      {20, 02, 30, 04,
        A0, 5E, 01, 01,
        A0, 40, 01, 00,
        A0, 43, 01, 00,
        A0, 0F, 20,
        00, 03, 1D, 01, 03, 00, 02, 00,
        01, 00, 01, 00, 00, 00, 00, 00,
        00, 00, 00, 00, 00, 00, 00, 00,
        00, 00, 00, 00, 00, 00, 00, 00
      }
    '';
    NXP_EXT_TVDD_CFG = "0x01";
    NXP_EXT_TVDD_CFG_1 = ''
      {20, 02, 07, 01,
        A0, 0E, 03, 16, 09, 00
      }
    '';
    NXP_NFC_MAX_EE_SUPPORTED = "0x00";
    NXP_NFC_PROPRIETARY_CFG = "{05:FF:FF:06:81:80:70:FF:FF}";
    NXP_SYS_CLK_FREQ_SEL = "0x00";
    NXP_SYS_CLK_SRC_SEL = "0x01";
    NXP_SYS_CLOCK_TO_CFG = "0x01";
  };
}
```

*Declared by:* [`nixos/modules/hardware/nfc-nci.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/nfc-nci.nix)

## `hardware.nitrokey.enable` {#opt-hardware.nitrokey.enable}

Enables udev rules for Nitrokey devices.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/nitrokey.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/nitrokey.nix)

## `hardware.nvidia-container-toolkit.csv-files` {#opt-hardware.nvidia-container-toolkit.csv-files}

The path to the list of CSV files to use when generating the CDI specification in CSV mode.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.device-name-strategy` {#opt-hardware.nvidia-container-toolkit.device-name-strategy}

Specify the strategy for generating device names,
passed to `nvidia-ctk cdi generate`. This will affect how
you reference the device using `nvidia.com/gpu=` in
the container runtime.

*Type:* one of "index", "uuid", "type-index"

*Default:* `"index"`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.disable-hooks` {#opt-hardware.nvidia-container-toolkit.disable-hooks}

List of hooks to disable when generating the CDI specification.
Each hook name will be passed as `--disable-hook <hook-name>` to nvidia-ctk.
Set to an empty list to disable no hooks.

*Type:* list of non-empty string

*Default:*

``` nix
[
  "create-symlinks"
]
```

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.discovery-mode` {#opt-hardware.nvidia-container-toolkit.discovery-mode}

The mode to use when discovering the available entities.

*Type:* one of "auto", "csv", "nvml", "wsl"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.enable` {#opt-hardware.nvidia-container-toolkit.enable}

Enable dynamic CDI configuration for Nvidia devices by running
nvidia-container-toolkit on boot.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.enable-hooks` {#opt-hardware.nvidia-container-toolkit.enable-hooks}

List of hooks to enable when generating the CDI specification.
Each hook name will be passed as `--enable-hook <hook-name>` to nvidia-ctk.
Set to an empty list to enable no hooks.

*Type:* list of non-empty string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.extraArgs` {#opt-hardware.nvidia-container-toolkit.extraArgs}

Extra arguments to be passed to nvidia-ctk.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.mount-nvidia-docker-1-directories` {#opt-hardware.nvidia-container-toolkit.mount-nvidia-docker-1-directories}

Mount nvidia-docker-1 directories on containers: /usr/local/nvidia/lib and
/usr/local/nvidia/lib64.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.mount-nvidia-executables` {#opt-hardware.nvidia-container-toolkit.mount-nvidia-executables}

Mount executables nvidia-smi, nvidia-cuda-mps-control, nvidia-cuda-mps-server,
nvidia-debugdump, nvidia-powerd and nvidia-ctk on containers.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.mounts` {#opt-hardware.nvidia-container-toolkit.mounts}

Mounts to be added to every container under the Nvidia CDI profile.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.mounts.*.containerPath` {#opt-hardware.nvidia-container-toolkit.mounts._.containerPath}

Container path.

*Type:* string

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.mounts.*.hostPath` {#opt-hardware.nvidia-container-toolkit.mounts._.hostPath}

Host path.

*Type:* string

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.mounts.*.mountOptions` {#opt-hardware.nvidia-container-toolkit.mounts._.mountOptions}

Mount options.

*Type:* list of string

*Default:*

``` nix
[
  "ro"
  "nosuid"
  "nodev"
  "bind"
]
```

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.package` {#opt-hardware.nvidia-container-toolkit.package}

The nvidia-container-toolkit package to use.

*Type:* package

*Default:* `pkgs.nvidia-container-toolkit`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia-container-toolkit.suppressNvidiaDriverAssertion` {#opt-hardware.nvidia-container-toolkit.suppressNvidiaDriverAssertion}

Suppress the assertion for installing Nvidia driver.
Useful in WSL where drivers are mounted from Windows, not provided by NixOS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/nvidia-container-toolkit`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-container-toolkit)

## `hardware.nvidia.branch` {#opt-hardware.nvidia.branch}

The branch of the NVIDIA driver to use.

Note: if [`hardware.nvidia.package`](#opt-hardware.nvidia.package) is set, it overrides this option.

Commonly interesting branches for end users:

- production, new\_feature, beta:
  NVIDIA's official production / new feature / beta release branches.

- stable:
  The default; the highest stable version.

- latest:
  Whichever is newer of `production` and `new_feature`.

- bleeding\_edge:
  Whichever is newer of `latest` and `beta`.

- legacy\_580:
  The long-lived 580 series (LTSB), for GPUs that newer driver branches
  no longer support (often Maxwell through Volta; roughly GeForce GTX 9xx
  through 10xx, plus rare Volta cards like TITAN V).

- vulkan\_beta:
  The Vulkan developer beta driver, for users interested in testing new
  Vulkan features.

*Type:* one of the available driver branches in `pkgs/os-specific/linux/nvidia-x11/default.nix`

*Default:*

``` nix
if config.hardware.nvidia.datacenter.enable then "dc" else "stable"
```

*Example:* `"bleeding_edge"`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.datacenter.enable` {#opt-hardware.nvidia.datacenter.enable}

Whether to enable Data Center drivers for NVIDIA cards on a NVLink topology
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.datacenter.nvswitch.cudaPackages` {#opt-hardware.nvidia.datacenter.nvswitch.cudaPackages}

The CUDA package set to source nvlsm, libnvidia\_nscq, and
libnvsdm from. The NSCQ and NVSDM library versions in the
selected package set `must` match the NVIDIA driver
version in [`hardware.nvidia.package`](#opt-hardware.nvidia.package). A version
mismatch between these user-space libraries and the kernel
driver will cause NVLSM and Fabric Manager to fail.

The CUDA redist manifests bundle NSCQ/NVSDM versions that
correspond to each CUDA release's associated driver. Use the
package set whose NSCQ/NVSDM version matches your driver.

*Type:* attribute set

*Default:* `pkgs.cudaPackages`

*Example:* `pkgs.cudaPackages`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.datacenter.nvswitch.enable` {#opt-hardware.nvidia.datacenter.nvswitch.enable}

Whether to enable NVLSM (NVLink Subnet Manager) and NVSwitch fabric management for
systems with 4th-generation NVSwitch silicon (e.g. B200 SXM).

This enables the nvidia-nvlsm service and configures
nvidia-fabricmanager to use the management GUID discovered by NVLSM.
Only enable this on nodes with NVSwitch silicon; running it on
NVLink bridge-only systems can cause GPU instability (Xid 119).

NVLSM is required on DGX B200/B300, NVIDIA HGX B200/B300, and
NVIDIA HGX B100 systems, which use 4th-generation NVSwitches.
It originates from NVIDIA's InfiniBand Subnet Manager (OpenSM)
and manages NVSwitch routing tables, LID assignment, and
partition keys, while Fabric Manager handles GPU-side routing
and NVLink configuration.

See the NVIDIA Fabric Manager User Guide for details:
[https://docs.nvidia.com/datacenter/tesla/fabric-manager-user-guide/](https://docs.nvidia.com/datacenter/tesla/fabric-manager-user-guide/)
Chapters: "Systems Using Fourth Generation NVSwitches" and
"Getting Started with NVLink Subnet Manager".
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.datacenter.nvswitch.settings` {#opt-hardware.nvidia.datacenter.nvswitch.settings}

User overrides for the NVLSM (NVLink Subnet Manager)
configuration, applied on top of the `nvlsm.conf` that ships
with the nvlsm package. Each key is written as a
space-separated `key value` line; if a key already exists in
the shipped config, its value is replaced, otherwise the line
is appended.

The shipped `nvlsm.conf` already contains the correct defaults
for 4th-generation NVSwitch systems (HGX B200/B300/B100) and is
updated by NVIDIA across releases. Only set values here if you
need to override a specific option.

NVLSM is derived from NVIDIA's InfiniBand Subnet Manager
(OpenSM), so many options have the same semantics as their
OpenSM counterparts. See the OpenSM manual for details:
`man opensm` or
[https://github.com/linux-rdma/opensm/blob/master/man/opensm.8.in](https://github.com/linux-rdma/opensm/blob/master/man/opensm.8.in)

NVIDIA Fabric Manager User Guide (for NVLSM-specific options):
[https://docs.nvidia.com/datacenter/tesla/fabric-manager-user-guide/](https://docs.nvidia.com/datacenter/tesla/fabric-manager-user-guide/)
Chapter: "Getting Started with NVLink Subnet Manager" →
"NVLink Subnet Manager Configuration".

The `device_configuration_file` and `plugin_options` paths are
patched automatically from the nvlsm package and should not
normally need to be overridden.

*Type:* attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.datacenter.settings` {#opt-hardware.nvidia.datacenter.settings}

Additional configuration options for fabricmanager.

*Type:* attribute set of (atom (null, bool, int, float or string))

*Default:*

``` nix
{
  LOG_LEVEL=4;
  LOG_FILE_NAME="/var/log/fabricmanager.log";
  LOG_APPEND_TO_LOG=1;
  LOG_FILE_MAX_SIZE=1024;
  LOG_USE_SYSLOG=0;
  DAEMONIZE=1;
  BIND_INTERFACE_IP="127.0.0.1";
  STARTING_TCP_PORT=16000;
  FABRIC_MODE=0;
  FABRIC_MODE_RESTART=0;
  STATE_FILE_NAME="/var/tmp/fabricmanager.state";
  FM_CMD_BIND_INTERFACE="127.0.0.1";
  FM_CMD_PORT_NUMBER=6666;
  FM_STAY_RESIDENT_ON_FAILURES=0;
  ACCESS_LINK_FAILURE_MODE=0;
  TRUNK_LINK_FAILURE_MODE=0;
  NVSWITCH_FAILURE_MODE=0;
  ABORT_CUDA_JOBS_ON_FM_EXIT=1;
}
```

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.dynamicBoost.enable` {#opt-hardware.nvidia.dynamicBoost.enable}

Whether to enable dynamic Boost balances power between the CPU and the GPU for improved
performance on supported laptops using the nvidia-powerd daemon. For more
information, see the NVIDIA docs, on Chapter 23. Dynamic Boost on Linux
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.enabled` {#opt-hardware.nvidia.enabled}

True if NVIDIA support is enabled

*Type:* boolean

*Default:* `true` if NVIDIA support is enabled

*Read only*

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.forceFullCompositionPipeline` {#opt-hardware.nvidia.forceFullCompositionPipeline}

Whether to enable forcefully the full composition pipeline.
This sometimes fixes screen tearing issues.
This has been reported to reduce the performance of some OpenGL applications and may produce issues in WebGL.
It also drastically increases the time the driver needs to clock down after load
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.gsp.enable` {#opt-hardware.nvidia.gsp.enable}

Whether to enable the GPU System Processor (GSP) on the video card
.

*Type:* boolean

*Default:*

``` nix
config.hardware.nvidia.open == true || lib.versionAtLeast config.hardware.nvidia.package.version "555"
```

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.modesetting.enable` {#opt-hardware.nvidia.modesetting.enable}

Whether to enable kernel modesetting when using the NVIDIA proprietary driver.

Enabling this fixes screen tearing when using Optimus via PRIME (see
[`hardware.nvidia.prime.sync.enable`](#opt-hardware.nvidia.prime.sync.enable). This is not enabled
by default because it is not officially supported by NVIDIA and would not
work with SLI.

Enabling this and using version 545 or newer of the proprietary NVIDIA
driver causes it to provide its own framebuffer device, which can cause
Wayland compositors to work when they otherwise wouldn't.
.

*Type:* boolean

*Default:* `lib.versionAtLeast cfg.package.version "535"`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.moduleParams` {#opt-hardware.nvidia.moduleParams}

Additional parameters to pass to the NVIDIA kernel module.

*Type:* attribute set of attribute set of raw value

*Default:* `{ }`

*Example:*

``` nix
{
  nvidia = {
    NVreg_RegistryDwords = "EnableBrightnessControl=1";
    NVreg_UsePageAttributeTable = 1;
  };
}
```

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.nvidiaPersistenced` {#opt-hardware.nvidia.nvidiaPersistenced}

Whether to enable nvidia-persistenced a update for NVIDIA GPU headless mode, i.e.
It ensures all GPUs stay awake even during headless mode
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.nvidiaSettings` {#opt-hardware.nvidia.nvidiaSettings}

Whether to enable nvidia-settings, NVIDIA's GUI configuration tool
.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.open` {#opt-hardware.nvidia.open}

Whether to enable the open source NVIDIA kernel module.

*Type:* null or boolean

*Default:*

``` nix
if lib.versionOlder config.hardware.nvidia.package.version "560" then false else null
```

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.package` {#opt-hardware.nvidia.package}

The NVIDIA driver package to use.

Prefer using [`hardware.nvidia.branch`](#opt-hardware.nvidia.branch) when possible.

If you set this option, it is recommended to pick a package from
`config.boot.kernelPackages.nvidiaPackages` so the driver build matches
your configured kernel.

For custom versions, you can use `nvidiaPackages.mkDriver`; see
`pkgs/os-specific/linux/nvidia-x11/default.nix` for examples.

*Type:* package

*Default:* `config.boot.kernelPackages.nvidiaPackages.${config.hardware.nvidia.branch}`

*Example:* `config.boot.kernelPackages.nvidiaPackages.legacy_470`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.powerManagement.enable` {#opt-hardware.nvidia.powerManagement.enable}

Whether to enable experimental power management through systemd. For more information, see
the NVIDIA docs, on Chapter 21. Configuring Power Management Support
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.powerManagement.finegrained` {#opt-hardware.nvidia.powerManagement.finegrained}

Whether to enable experimental power management of PRIME offload. For more information, see
the NVIDIA docs, on Chapter 22. PCI-Express Runtime D3 (RTD3) Power Management
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.powerManagement.kernelSuspendNotifier` {#opt-hardware.nvidia.powerManagement.kernelSuspendNotifier}

Whether to enable NVIDIA driver support for kernel suspend notifiers, which allows the driver
to be notified of suspend and resume events by the kernel, rather than
relying on systemd services.
Requires NVIDIA driver version 595 or newer, and the open source kernel modules.
.

*Type:* boolean

*Default:*

``` nix
config.hardware.nvidia.open == true && lib.versionAtLeast config.hardware.nvidia.package.version "595"
```

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.allowExternalGpu` {#opt-hardware.nvidia.prime.allowExternalGpu}

Whether to enable configuring X to allow external NVIDIA GPUs when using Prime \[Reverse\] sync optimus
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.amdgpuBusId` {#opt-hardware.nvidia.prime.amdgpuBusId}

Bus ID of the AMD APU. You can find it using lspci; for example if lspci
shows the AMD APU at "0001:02:03.4", set this option to "PCI:2@1:3:4".

lspci might omit the PCI domain (0001 in above example) if it is zero.
In which case, use "@0" instead.

Please be aware that this option takes decimal address while lspci reports
hexadecimal address. So for device at domain "10000", use "@65536".

*Type:* string matching the pattern (\[\[:print:\]\]+:\[0-9\]{1,3}(@\[0-9\]{1,10})?:\[0-9\]{1,2}:\[0-9\])?

*Default:* `""`

*Example:* `"PCI:4@0:0:0"`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.intelBusId` {#opt-hardware.nvidia.prime.intelBusId}

Bus ID of the Intel GPU. You can find it using lspci; for example if lspci
shows the Intel GPU at "0001:02:03.4", set this option to "PCI:2@1:3:4".

lspci might omit the PCI domain (0001 in above example) if it is zero.
In which case, use "@0" instead.

Please be aware that this option takes decimal address while lspci reports
hexadecimal address. So for device at domain "10000", use "@65536".

*Type:* string matching the pattern (\[\[:print:\]\]+:\[0-9\]{1,3}(@\[0-9\]{1,10})?:\[0-9\]{1,2}:\[0-9\])?

*Default:* `""`

*Example:* `"PCI:0@0:2:0"`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.nvidiaBusId` {#opt-hardware.nvidia.prime.nvidiaBusId}

Bus ID of the NVIDIA GPU. You can find it using lspci; for example if lspci
shows the NVIDIA GPU at "0001:02:03.4", set this option to "PCI:2@1:3:4".

lspci might omit the PCI domain (0001 in above example) if it is zero.
In which case, use "@0" instead.

Please be aware that this option takes decimal address while lspci reports
hexadecimal address. So for device at domain "10000", use "@65536".

*Type:* string matching the pattern (\[\[:print:\]\]+:\[0-9\]{1,3}(@\[0-9\]{1,10})?:\[0-9\]{1,2}:\[0-9\])?

*Default:* `""`

*Example:* `"PCI:1@0:0:0"`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.offload.enable` {#opt-hardware.nvidia.prime.offload.enable}

Whether to enable render offload support using the NVIDIA proprietary driver via PRIME.

If this is enabled, then the bus IDs of the NVIDIA and Intel/AMD GPUs have to
be specified ([`hardware.nvidia.prime.nvidiaBusId`](#opt-hardware.nvidia.prime.nvidiaBusId) and
[`hardware.nvidia.prime.intelBusId`](#opt-hardware.nvidia.prime.intelBusId) or
[`hardware.nvidia.prime.amdgpuBusId`](#opt-hardware.nvidia.prime.amdgpuBusId))
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.offload.enableOffloadCmd` {#opt-hardware.nvidia.prime.offload.enableOffloadCmd}

Whether to enable adding a `nvidia-offload` convenience script to [`environment.systemPackages`](../../options/environment/index.md#opt-environment.systemPackages)
for offloading programs to an nvidia device. To work, you must also enable
[`hardware.nvidia.prime.offload.enable`](#opt-hardware.nvidia.prime.offload.enable) or [`hardware.nvidia.prime.reverseSync.enable`](#opt-hardware.nvidia.prime.reverseSync.enable).

Example usage: `nvidia-offload sauerbraten_client`

This script can be renamed with [`hardware.nvidia.prime.offload.offloadCmdMainProgram`](#opt-hardware.nvidia.prime.offload.offloadCmdMainProgram).
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.offload.offloadCmdMainProgram` {#opt-hardware.nvidia.prime.offload.offloadCmdMainProgram}

Specifies the CLI name of the [`hardware.nvidia.prime.offload.enableOffloadCmd`](#opt-hardware.nvidia.prime.offload.enableOffloadCmd)
convenience script for offloading programs to an nvidia device.

*Type:* string

*Default:* `"nvidia-offload"`

*Example:* `"prime-run"`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.reverseSync.enable` {#opt-hardware.nvidia.prime.reverseSync.enable}

Whether to enable NVIDIA Optimus support using the NVIDIA proprietary driver via reverse
PRIME. If enabled, the Intel/AMD GPU will be used for all rendering, while
enabling output to displays attached only to the NVIDIA GPU without a
multiplexer.

Warning: This feature is relatively new, depending on your system this might
work poorly. AMD support, especially so.
See: [https://forums.developer.nvidia.com/t/the-all-new-outputsink-feature-aka-reverse-prime/129828](https://forums.developer.nvidia.com/t/the-all-new-outputsink-feature-aka-reverse-prime/129828)

Note that this option only has any effect if the "nvidia" driver is specified
in [`services.xserver.videoDrivers`](../../options/services-x/index.md#opt-services.xserver.videoDrivers), and it should preferably
be the only driver there.

If this is enabled, then the bus IDs of the NVIDIA and Intel/AMD GPUs have to
be specified ([`hardware.nvidia.prime.nvidiaBusId`](#opt-hardware.nvidia.prime.nvidiaBusId) and
[`hardware.nvidia.prime.intelBusId`](#opt-hardware.nvidia.prime.intelBusId) or
[`hardware.nvidia.prime.amdgpuBusId`](#opt-hardware.nvidia.prime.amdgpuBusId)).

If you enable this, you may want to also enable kernel modesetting for the
NVIDIA driver ([`hardware.nvidia.modesetting.enable`](#opt-hardware.nvidia.modesetting.enable)) in order
to prevent tearing.

Note that this configuration will only be successful when a display manager
for which the [`services.xserver.displayManager.setupCommands`](../../options/services-x/index.md#opt-services.xserver.displayManager.setupCommands)
option is supported is used
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.reverseSync.setupCommands.enable` {#opt-hardware.nvidia.prime.reverseSync.setupCommands.enable}

Whether to enable configure the display manager to be able to use the outputs
attached to the NVIDIA GPU.
Disable in order to configure the NVIDIA GPU outputs manually using xrandr.
Note that this configuration will only be successful when a display manager
for which the [`services.xserver.displayManager.setupCommands`](../../options/services-x/index.md#opt-services.xserver.displayManager.setupCommands)
option is supported is used
.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.prime.sync.enable` {#opt-hardware.nvidia.prime.sync.enable}

Whether to enable NVIDIA Optimus support using the NVIDIA proprietary driver via PRIME.
If enabled, the NVIDIA GPU will be always on and used for all rendering,
while enabling output to displays attached only to the integrated Intel/AMD
GPU without a multiplexer.

Note that this option only has any effect if the "nvidia" driver is specified
in [`services.xserver.videoDrivers`](../../options/services-x/index.md#opt-services.xserver.videoDrivers), and it should preferably
be the only driver there.

If this is enabled, then the bus IDs of the NVIDIA and Intel/AMD GPUs have to
be specified ([`hardware.nvidia.prime.nvidiaBusId`](#opt-hardware.nvidia.prime.nvidiaBusId) and
[`hardware.nvidia.prime.intelBusId`](#opt-hardware.nvidia.prime.intelBusId) or
[`hardware.nvidia.prime.amdgpuBusId`](#opt-hardware.nvidia.prime.amdgpuBusId)).

If you enable this, you may want to also enable kernel modesetting for the
NVIDIA driver ([`hardware.nvidia.modesetting.enable`](#opt-hardware.nvidia.modesetting.enable)) in order
to prevent tearing.

Note that this configuration will only be successful when a display manager
for which the [`services.xserver.displayManager.setupCommands`](../../options/services-x/index.md#opt-services.xserver.displayManager.setupCommands)
option is supported is used
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidia.videoAcceleration` {#opt-hardware.nvidia.videoAcceleration}

Whether to enable video acceleration (VA-API).

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/video/nvidia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/video/nvidia.nix)

## `hardware.nvidiaOptimus.disable` {#opt-hardware.nvidiaOptimus.disable}

Completely disable the NVIDIA graphics card and use the
integrated graphics processor instead.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/nvidia-optimus.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/nvidia-optimus.nix)

## `hardware.onlykey.enable` {#opt-hardware.onlykey.enable}

Enable OnlyKey device (https://crp.to/p/) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/onlykey/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/onlykey/default.nix)

## `hardware.openrazer.batteryNotifier` {#opt-hardware.openrazer.batteryNotifier}

Settings for device battery notifications.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.batteryNotifier.enable` {#opt-hardware.openrazer.batteryNotifier.enable}

Mouse battery notifier.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.batteryNotifier.frequency` {#opt-hardware.openrazer.batteryNotifier.frequency}

How often battery notifications should be shown (in seconds).
A value of 0 disables notifications.

*Type:* signed integer

*Default:* `600`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.batteryNotifier.percentage` {#opt-hardware.openrazer.batteryNotifier.percentage}

At what battery percentage the device should reach before
sending notifications.

*Type:* signed integer

*Default:* `33`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.devicesOffOnScreensaver` {#opt-hardware.openrazer.devicesOffOnScreensaver}

Turn off the devices when the systems screensaver kicks in.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.enable` {#opt-hardware.openrazer.enable}

Whether to enable OpenRazer drivers and userspace daemon
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.keyStatistics` {#opt-hardware.openrazer.keyStatistics}

Collects number of keypresses per hour per key used to
generate a heatmap.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.packages.daemon` {#opt-hardware.openrazer.packages.daemon}

The openrazer-daemon package to use.

*Type:* package

*Default:* `pkgs.python3Packages.openrazer-daemon`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.packages.kernel` {#opt-hardware.openrazer.packages.kernel}

The openrazer kernel package to use.

*Type:* package

*Default:* `config.boot.kernelPackages.openrazer`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.syncEffectsEnabled` {#opt-hardware.openrazer.syncEffectsEnabled}

Set the sync effects flag to true so any assignment of
effects will work across devices.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.users` {#opt-hardware.openrazer.users}

Usernames to be added to the "openrazer" group, so that they
can start and interact with the OpenRazer userspace daemon.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.openrazer.verboseLogging` {#opt-hardware.openrazer.verboseLogging}

Whether to enable verbose logging. Logs debug messages.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/openrazer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/openrazer.nix)

## `hardware.opentabletdriver.blacklistedKernelModules` {#opt-hardware.opentabletdriver.blacklistedKernelModules}

Blacklist of kernel modules known to conflict with OpenTabletDriver.

*Type:* list of string

*Default:*

``` nix
[
  "hid-uclogic"
  "wacom"
]
```

*Declared by:* [`nixos/modules/hardware/opentabletdriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/opentabletdriver.nix)

## `hardware.opentabletdriver.daemon.enable` {#opt-hardware.opentabletdriver.daemon.enable}

Whether to start OpenTabletDriver daemon as a systemd user service.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/hardware/opentabletdriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/opentabletdriver.nix)

## `hardware.opentabletdriver.enable` {#opt-hardware.opentabletdriver.enable}

Enable OpenTabletDriver udev rules, user service and blacklist kernel
modules known to conflict with OpenTabletDriver.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/opentabletdriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/opentabletdriver.nix)

## `hardware.opentabletdriver.package` {#opt-hardware.opentabletdriver.package}

The opentabletdriver package to use.

*Type:* package

*Default:* `pkgs.opentabletdriver`

*Declared by:* [`nixos/modules/hardware/opentabletdriver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/opentabletdriver.nix)

## `hardware.parallels.enable` {#opt-hardware.parallels.enable}

This enables Parallels Tools for Linux guests.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/virtualisation/parallels-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/parallels-guest.nix)

## `hardware.parallels.package` {#opt-hardware.parallels.package}

The prl-tools package to use.

*Type:* package

*Default:* `pkgs.prl-tools`

*Declared by:* [`nixos/modules/virtualisation/parallels-guest.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/parallels-guest.nix)

## `hardware.pcmcia.config` {#opt-hardware.pcmcia.config}

Path to the configuration file which maps the memory, IRQs
and ports used by the PCMCIA hardware.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/pcmcia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/pcmcia.nix)

## `hardware.pcmcia.enable` {#opt-hardware.pcmcia.enable}

Enable this option to support PCMCIA card.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/pcmcia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/pcmcia.nix)

## `hardware.pcmcia.firmware` {#opt-hardware.pcmcia.firmware}

List of firmware used to handle specific PCMCIA card.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/hardware/pcmcia.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/pcmcia.nix)

## `hardware.printers.ensureClasses` {#opt-hardware.printers.ensureClasses}

Will ensure that the given CUPS classes are configured as declared.
Please note that it is possible for some users to temporarily override
these properties. If those changes conflict with this configuration,
the configuration will take precedence and override them at boot and
when a rebuild is applied. This configuration will not delete any
classes that have been removed from the list. In order to list classes
you can use `lpstat -c`. It will list any classes without
members as having a member titled `unknown`. Print jobs to empty
classes will silently fail. In order to remove a class, run
`lpadmin -x <class name>`. Classes can still be added
manually. For more on classes see
[https://www.cups.org/doc/admin.html#CLASSES](https://www.cups.org/doc/admin.html#CLASSES), or
`lpadmin(8)`.

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensureClasses.<name>.classes` {#opt-hardware.printers.ensureClasses._name_.classes}

A list of classes to include in this class.

::: note
CUPS itself does not support nested classes. Any classes will
simply have all of their member printers added to this class
in a recursive manner. This is an abstraction that serves the
purpose of convenience and expressiveness, not a 1:1 mapping
on top of CUPS.
:::

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensureClasses.<name>.description` {#opt-hardware.printers.ensureClasses._name_.description}

Optional human-readable description

*Type:* null or string

*Default:* `null`

*Example:* `"Printers that support color printing"`

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensureClasses.<name>.location` {#opt-hardware.printers.ensureClasses._name_.location}

Optional human-readable location

*Type:* null or string

*Default:* `null`

*Example:* `"Workroom"`

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensureClasses.<name>.printers` {#opt-hardware.printers.ensureClasses._name_.printers}

A list of printers included in this class. Note that all
printers in this list must also be present in
config.hardware.printers.ensurePrinters. Specifying a symblic
name here that does not match any of those printers is
considered a hard error.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "BrotherHL_Workroom"
  "EpsonColor_Basement"
]
```

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensureDefaultPrinter` {#opt-hardware.printers.ensureDefaultPrinter}

Ensures the named printer is the default CUPS printer / printer queue.

*Type:* null or printable string without spaces, # and /

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensurePrinters` {#opt-hardware.printers.ensurePrinters}

Will regularly ensure that the given CUPS printers are configured as declared here.
If a printer's options are manually changed afterwards, they will be overwritten eventually.
This option will never delete any printer, even if removed from this list.
You can check existing printers with `lpstat -s`
and remove printers with `lpadmin -x <printer-name>`.
Printers not listed here can still be manually configured.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensurePrinters.*.description` {#opt-hardware.printers.ensurePrinters._.description}

Optional human-readable description.

*Type:* null or string

*Default:* `null`

*Example:* `"Brother HL-5140"`

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensurePrinters.*.deviceUri` {#opt-hardware.printers.ensurePrinters._.deviceUri}

How to reach the printer.
`lpinfo -v` shows a list of supported device URIs and schemes.

*Type:* string

*Example:*

``` nix
"ipp://printserver.local/printers/BrotherHL_Workroom"
"usb://HP/DESKJET%20940C?serial=CN16E6C364BH"
```

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensurePrinters.*.location` {#opt-hardware.printers.ensurePrinters._.location}

Optional human-readable location.

*Type:* null or string

*Default:* `null`

*Example:* `"Workroom"`

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensurePrinters.*.model` {#opt-hardware.printers.ensurePrinters._.model}

Location of the ppd driver file for the printer.
`lpinfo -m` shows a list of supported models.

*Type:* string

*Example:*

``` nix
"gutenprint.${lib.versions.majorMinor (lib.getVersion pkgs.gutenprint)}://brother-hl-5140/expert"
```

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensurePrinters.*.name` {#opt-hardware.printers.ensurePrinters._.name}

Name of the printer / printer queue.
May contain any printable characters except "/", "#", and space.

*Type:* printable string without spaces, # and /

*Example:* `"BrotherHL_Workroom"`

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.printers.ensurePrinters.*.ppdOptions` {#opt-hardware.printers.ensurePrinters._.ppdOptions}

Sets PPD options for the printer.
`lpoptions [-p printername] -l` shows supported PPD options for the given printer.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  Duplex = "DuplexNoTumble";
  PageSize = "A4";
}
```

*Declared by:* [`nixos/modules/hardware/printers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/printers.nix)

## `hardware.raid.HPSmartArray.enable` {#opt-hardware.raid.HPSmartArray.enable}

Whether to enable HP Smart Array kernel modules and CLI utility.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/raid/hpsa.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/raid/hpsa.nix)

## `hardware.rasdaemon.config` {#opt-hardware.rasdaemon.config}

rasdaemon configuration, currently only used for CE PFA
for details, read rasdaemon.outPath/etc/sysconfig/rasdaemon's comments

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # defaults from included config
  PAGE_CE_REFRESH_CYCLE="24h"
  PAGE_CE_THRESHOLD="50"
  PAGE_CE_ACTION="soft"
''
```

*Declared by:* [`nixos/modules/services/hardware/rasdaemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rasdaemon.nix)

## `hardware.rasdaemon.enable` {#opt-hardware.rasdaemon.enable}

Whether to enable RAS logging daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/rasdaemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rasdaemon.nix)

## `hardware.rasdaemon.extraModules` {#opt-hardware.rasdaemon.extraModules}

extra kernel modules to load

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "i7core_edac"
]
```

*Declared by:* [`nixos/modules/services/hardware/rasdaemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rasdaemon.nix)

## `hardware.rasdaemon.labels` {#opt-hardware.rasdaemon.labels}

Additional memory module label descriptions to be placed in /etc/ras/dimm\_labels.d/labels

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # vendor and model may be shown by 'ras-mc-ctl --mainboard'
  vendor: ASRock
    product: To Be Filled By O.E.M.
    model: B450M Pro4
      # these labels are names for the motherboard slots
      # the numbers may be shown by `ras-mc-ctl --error-count`
      # they are mc:csrow:channel
      DDR4_A1: 0.2.0;  DDR4_B1: 0.2.1;
      DDR4_A2: 0.3.0;  DDR4_B2: 0.3.1;
''
```

*Declared by:* [`nixos/modules/services/hardware/rasdaemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rasdaemon.nix)

## `hardware.rasdaemon.mainboard` {#opt-hardware.rasdaemon.mainboard}

Custom mainboard description, see `ras-mc-ctl(8)` for more details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  vendor = ASRock
  model = B450M Pro4
  
  # it should default to such values from
  # /sys/class/dmi/id/board_[vendor|name]
  # alternatively one can supply a script
  # that returns the same format as above
  
  script = <path to script>
''
```

*Declared by:* [`nixos/modules/services/hardware/rasdaemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rasdaemon.nix)

## `hardware.rasdaemon.package` {#opt-hardware.rasdaemon.package}

The rasdaemon package to use.

*Type:* package

*Default:* `pkgs.rasdaemon`

*Declared by:* [`nixos/modules/services/hardware/rasdaemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rasdaemon.nix)

## `hardware.rasdaemon.record` {#opt-hardware.rasdaemon.record}

record events via sqlite3, required for ras-mc-ctl

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/hardware/rasdaemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rasdaemon.nix)

## `hardware.rasdaemon.testing` {#opt-hardware.rasdaemon.testing}

Whether to enable error injection infrastructure.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/rasdaemon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/rasdaemon.nix)

## `hardware.rtl-sdr.enable` {#opt-hardware.rtl-sdr.enable}

Enables rtl-sdr udev rules, ensures 'plugdev' group exists, and blacklists DVB kernel modules.
This is a prerequisite to using devices supported by rtl-sdr without being root, since rtl-sdr USB descriptors will be owned by plugdev through udev.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/rtl-sdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/rtl-sdr.nix)

## `hardware.rtl-sdr.package` {#opt-hardware.rtl-sdr.package}

The rtl-sdr package to use.

*Type:* package

*Default:* `pkgs.rtl-sdr`

*Declared by:* [`nixos/modules/hardware/rtl-sdr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/rtl-sdr.nix)

## `hardware.saleae-logic.enable` {#opt-hardware.saleae-logic.enable}

Whether to enable udev rules for Saleae Logic devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/saleae-logic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/saleae-logic.nix)

## `hardware.saleae-logic.package` {#opt-hardware.saleae-logic.package}

Saleae Logic package to use.

*Type:* package

*Default:* `pkgs.saleae-logic-2`

*Declared by:* [`nixos/modules/hardware/saleae-logic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/saleae-logic.nix)

## `hardware.sane.backends-package` {#opt-hardware.sane.backends-package}

The sane-backends package to use.

*Type:* package

*Default:* `pkgs.sane-backends`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `hardware.sane.brscan4.enable` {#opt-hardware.sane.brscan4.enable}

When enabled, will automatically register the "brscan4" sane
backend and bring configuration files to their expected location.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan4.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix)

## `hardware.sane.brscan4.netDevices` {#opt-hardware.sane.brscan4.netDevices}

The list of network devices that will be registered against the brscan4
sane backend.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  office1 = {
    ip = "192.168.1.2";
    model = "MFC-7860DW";
  };
  office2 = {
    model = "MFC-7860DW";
    nodename = "BRW0080927AFBCE";
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan4.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix)

## `hardware.sane.brscan4.netDevices.<name>.ip` {#opt-hardware.sane.brscan4.netDevices._name_.ip}

The ip address of the device. If undefined, you will have to
provide a nodename.

*Type:* null or string

*Default:* `null`

*Example:* `"192.168.1.2"`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan4.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix)

## `hardware.sane.brscan4.netDevices.<name>.model` {#opt-hardware.sane.brscan4.netDevices._name_.model}

The model of the network device.

*Type:* string

*Example:* `"MFC-7860DW"`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan4.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix)

## `hardware.sane.brscan4.netDevices.<name>.name` {#opt-hardware.sane.brscan4.netDevices._name_.name}

The friendly name you give to the network device. If undefined,
the name of attribute will be used.

*Type:* string

*Example:* `"office1"`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan4.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix)

## `hardware.sane.brscan4.netDevices.<name>.nodename` {#opt-hardware.sane.brscan4.netDevices._name_.nodename}

The node name of the device. If undefined, you will have to
provide an ip.

*Type:* null or string

*Default:* `null`

*Example:* `"BRW0080927AFBCE"`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan4.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix)

## `hardware.sane.brscan5.enable` {#opt-hardware.sane.brscan5.enable}

Whether to enable the Brother brscan5 sane backend.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan5.nix)

## `hardware.sane.brscan5.netDevices` {#opt-hardware.sane.brscan5.netDevices}

The list of network devices that will be registered against the brscan5
sane backend.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  office1 = {
    ip = "192.168.1.2";
    model = "MFC-7860DW";
  };
  office2 = {
    model = "MFC-7860DW";
    nodename = "BRW0080927AFBCE";
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan5.nix)

## `hardware.sane.brscan5.netDevices.<name>.ip` {#opt-hardware.sane.brscan5.netDevices._name_.ip}

The ip address of the device. If undefined, you will have to
provide a nodename.

*Type:* null or string

*Default:* `null`

*Example:* `"192.168.1.2"`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan5.nix)

## `hardware.sane.brscan5.netDevices.<name>.model` {#opt-hardware.sane.brscan5.netDevices._name_.model}

The model of the network device.

*Type:* string

*Example:* `"ADS-1200"`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan5.nix)

## `hardware.sane.brscan5.netDevices.<name>.name` {#opt-hardware.sane.brscan5.netDevices._name_.name}

The friendly name you give to the network device. If undefined,
the name of attribute will be used.

*Type:* string

*Example:* `"office1"`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan5.nix)

## `hardware.sane.brscan5.netDevices.<name>.nodename` {#opt-hardware.sane.brscan5.netDevices._name_.nodename}

The node name of the device. If undefined, you will have to
provide an ip.

*Type:* null or string

*Default:* `null`

*Example:* `"BRW0080927AFBCE"`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/brscan5.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/brscan5.nix)

## `hardware.sane.disabledDefaultBackends` {#opt-hardware.sane.disabledDefaultBackends}

Names of backends which are enabled by default but should be disabled.
See `/etc/sane.d/dll.conf` for the list of possible names.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "v4l"
]
```

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `hardware.sane.drivers.scanSnap.enable` {#opt-hardware.sane.drivers.scanSnap.enable}

Whether to enable drivers for the Fujitsu ScanSnap scanners.

The driver files are unfree and extracted from the Windows driver image.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `hardware.sane.drivers.scanSnap.package` {#opt-hardware.sane.drivers.scanSnap.package}

The epjitsu package to use. Useful if you want to extract the driver files yourself.

The process is described in the `/etc/sane.d/epjitsu.conf` file in
the `sane-backends` package.

*Type:* package

*Default:* `pkgs.sane-drivers.epjitsu`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `hardware.sane.dsseries.enable` {#opt-hardware.sane.dsseries.enable}

When enabled, will automatically register the "dsseries" SANE backend.

This supports the Brother DSmobile scanner series, including the
DS-620, DS-720D, DS-820W, and DS-920DW scanners.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/sane_extra_backends/dsseries.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane_extra_backends/dsseries.nix)

## `hardware.sane.enable` {#opt-hardware.sane.enable}

Enable support for SANE scanners.

::: note
Users in the "scanner" group will gain access to the scanner, or the "lp" group if it's also a printer.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `hardware.sane.extraBackends` {#opt-hardware.sane.extraBackends}

Packages providing extra SANE backends to enable.

The package needs to provide the `passthru.saneBackendNames` attribute,
containing a list of backend names.

::: note
The example contains the package for HP scanners, and the package for
Apple AirScan and Microsoft WSD support (supports many
vendors/devices).
:::

*Type:* list of absolute path

*Default:* `[ ]`

*Example:* `[ pkgs.hplipWithPlugin pkgs.sane-airscan ]`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `hardware.sane.netConf` {#opt-hardware.sane.netConf}

Network hosts that should be probed for remote scanners.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"192.168.0.16"`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `hardware.sane.openFirewall` {#opt-hardware.sane.openFirewall}

Open ports needed for discovery of scanners on the local network, e.g.
needed for Canon scanners (BJNP protocol).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/sane.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/sane.nix)

## `hardware.sata.timeout.deciSeconds` {#opt-hardware.sata.timeout.deciSeconds}

Set SCT Error Recovery Control timeout in deciseconds for use in RAID configurations.

Values are as follows:
0 = disable SCT ERT
70 = default in consumer drives (7 seconds)

Maximum is disk dependant but probably 60 seconds.

*Type:* signed integer

*Example:* `70`

*Declared by:* [`nixos/modules/hardware/sata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sata.nix)

## `hardware.sata.timeout.drives` {#opt-hardware.sata.timeout.drives}

List of drives for which to configure the timeout.

*Type:* list of (submodule)

*Declared by:* [`nixos/modules/hardware/sata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sata.nix)

## `hardware.sata.timeout.drives.*.idBy` {#opt-hardware.sata.timeout.drives._.idBy}

The method to identify the drive.

*Type:* one of "path", "wwn"

*Default:* `"path"`

*Declared by:* [`nixos/modules/hardware/sata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sata.nix)

## `hardware.sata.timeout.drives.*.name` {#opt-hardware.sata.timeout.drives._.name}

Drive name without the full path.

*Type:* string

*Declared by:* [`nixos/modules/hardware/sata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sata.nix)

## `hardware.sata.timeout.enable` {#opt-hardware.sata.timeout.enable}

Whether to enable SATA drive timeouts.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/sata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sata.nix)

## `hardware.sensor.hddtemp.dbEntries` {#opt-hardware.sensor.hddtemp.dbEntries}

Additional DB entries

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/hardware/sensor/hddtemp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sensor/hddtemp.nix)

## `hardware.sensor.hddtemp.drives` {#opt-hardware.sensor.hddtemp.drives}

List of drives or shell expressions that expand to drives to monitor.
Expressions are evaluated when the service starts, so shell wildcards
and command substitutions can be used.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/hardware/sensor/hddtemp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sensor/hddtemp.nix)

## `hardware.sensor.hddtemp.enable` {#opt-hardware.sensor.hddtemp.enable}

Enable this option to support HDD/SSD temperature sensors.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/sensor/hddtemp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sensor/hddtemp.nix)

## `hardware.sensor.hddtemp.extraArgs` {#opt-hardware.sensor.hddtemp.extraArgs}

Additional arguments passed to the daemon.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/hardware/sensor/hddtemp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sensor/hddtemp.nix)

## `hardware.sensor.hddtemp.unit` {#opt-hardware.sensor.hddtemp.unit}

Celsius or Fahrenheit

*Type:* one of "C", "F"

*Default:* `"C"`

*Declared by:* [`nixos/modules/hardware/sensor/hddtemp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sensor/hddtemp.nix)

## `hardware.sensor.iio.enable` {#opt-hardware.sensor.iio.enable}

Enable this option to support IIO sensors with iio-sensor-proxy.

IIO sensors are used for orientation and ambient light
sensors on some mobile devices.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/sensor/iio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sensor/iio.nix)

## `hardware.sensor.iio.package` {#opt-hardware.sensor.iio.package}

The iio-sensor-proxy package to use.

*Type:* package

*Default:* `pkgs.iio-sensor-proxy`

*Declared by:* [`nixos/modules/hardware/sensor/iio.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sensor/iio.nix)

## `hardware.sheep_net.enable` {#opt-hardware.sheep_net.enable}

Enables sheep\_net udev rules, ensures 'sheep\_net' group exists, and adds
sheep-net to boot.kernelModules and boot.extraModulePackages

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/sheep-net.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/sheep-net.nix)

## `hardware.spacenavd.enable` {#opt-hardware.spacenavd.enable}

Whether to enable spacenavd to support 3DConnexion devices.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/spacenavd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/spacenavd.nix)

## `hardware.steam-hardware.enable` {#opt-hardware.steam-hardware.enable}

Enable udev rules for Steam hardware such as the Steam Controller, other supported controllers and the HTC Vive

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/steam-hardware.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/steam-hardware.nix)

## `hardware.system76.enableAll` {#opt-hardware.system76.enableAll}

Whether to enable all recommended configuration for system76 systems.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/system-76.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/system-76.nix)

## `hardware.system76.firmware-daemon.enable` {#opt-hardware.system76.firmware-daemon.enable}

Whether to enable the system76 firmware daemon

*Type:* boolean

*Default:* `config.hardware.system76.enableAll`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/system-76.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/system-76.nix)

## `hardware.system76.kernel-modules.enable` {#opt-hardware.system76.kernel-modules.enable}

Whether to make the system76 out-of-tree kernel modules available

*Type:* boolean

*Default:* `config.hardware.system76.enableAll`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/system-76.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/system-76.nix)

## `hardware.system76.power-daemon.enable` {#opt-hardware.system76.power-daemon.enable}

Whether to enable the system76 power daemon

*Type:* boolean

*Default:* `config.hardware.system76.enableAll`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/system-76.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/system-76.nix)

## `hardware.tenstorrent.enable` {#opt-hardware.tenstorrent.enable}

Whether to enable Tenstorrent driver & utilities.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/tenstorrent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/tenstorrent.nix)

## `hardware.trackpoint.device` {#opt-hardware.trackpoint.device}

The device name of the trackpoint. You can check with xinput.
Some newer devices (example x1c6) use "TPPS/2 Elan TrackPoint".

*Type:* string

*Default:* `"TPPS/2 IBM TrackPoint"`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.draghys` {#opt-hardware.trackpoint.draghys}

The drag hysteresis controls how hard it is to drag with z-axis pressed.

*Type:* signed integer

*Default:* `255`

*Example:* `200`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.drift_time` {#opt-hardware.trackpoint.drift_time}

This parameter controls the period of time to test for a 'hands off' condition (i.e. when no force is applied) before a drift (noise) calibration occurs.

IBM Trackpoints have a feature to compensate for drift by recalibrating themselves periodically. By default, if for 0.5 seconds there is no change in position, it's used as the new zero. This duration is too low. Often, the calibration happens when the trackpoint is in fact being used.

*Type:* signed integer

*Default:* `5`

*Example:* `100`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.emulateWheel` {#opt-hardware.trackpoint.emulateWheel}

Enable scrolling while holding the middle mouse button.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.enable` {#opt-hardware.trackpoint.enable}

Enable sensitivity and speed configuration for trackpoints.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.ext_dev` {#opt-hardware.trackpoint.ext_dev}

Disable or enable external pointing device.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.fakeButtons` {#opt-hardware.trackpoint.fakeButtons}

Switch to "bare" PS/2 mouse support in case Trackpoint buttons are not recognized
properly. This can happen for example on models like the L430, T450, T450s, on
which the Trackpoint buttons are actually a part of the Synaptics touchpad.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.inertia` {#opt-hardware.trackpoint.inertia}

Negative inertia factor. High values cause the cursor to snap backward when the trackpoint is released.

*Type:* signed integer

*Default:* `6`

*Example:* `10`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.jenks` {#opt-hardware.trackpoint.jenks}

Minimum curvature in degrees required to generate a double click without a release.

*Type:* signed integer

*Default:* `135`

*Example:* `100`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.mindrag` {#opt-hardware.trackpoint.mindrag}

Minimum amount of force needed to trigger dragging.

*Type:* signed integer

*Default:* `20`

*Example:* `30`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.press_to_select` {#opt-hardware.trackpoint.press_to_select}

Setting this to true will enable the Press to Select functions like tapping the control stick to simulate a left click, and setting false will disable it.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.reach` {#opt-hardware.trackpoint.reach}

Backup range for z-axis press.

*Type:* signed integer

*Default:* `10`

*Example:* `20`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.sensitivity` {#opt-hardware.trackpoint.sensitivity}

Trackpoint sensitivity.

*Type:* signed integer

*Default:* `128`

*Example:* `255`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.skipback` {#opt-hardware.trackpoint.skipback}

When the skipback bit is set, backup cursor movement during releases from drags will be suppressed. The default value for this bit is 0.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.speed` {#opt-hardware.trackpoint.speed}

Speed of the trackpoint cursor.

*Type:* signed integer

*Default:* `97`

*Example:* `255`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.thresh` {#opt-hardware.trackpoint.thresh}

Minimum value for z-axis force required to trigger a press or release, relative to the running average.

*Type:* signed integer

*Default:* `8`

*Example:* `10`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.upthresh` {#opt-hardware.trackpoint.upthresh}

The offset from the running average required to generate a select (click) on z-axis on release.

*Type:* signed integer

*Default:* `255`

*Example:* `250`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.trackpoint.ztime` {#opt-hardware.trackpoint.ztime}

This attribute determines how sharp a press has to be in order to be recognized.

*Type:* signed integer

*Default:* `38`

*Example:* `50`

*Declared by:* [`nixos/modules/tasks/trackpoint.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/trackpoint.nix)

## `hardware.tuxedo-drivers.enable` {#opt-hardware.tuxedo-drivers.enable}

Whether to enable The tuxedo-drivers driver enables access to the following on TUXEDO notebooks:

- Driver for Fn-keys
- SysFS control of brightness/color/mode for most TUXEDO keyboards
- Hardware I/O driver for TUXEDO Control Center

For more inforation it is best to check at the source code description: [https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers](https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/tuxedo-drivers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/tuxedo-drivers.nix)

## `hardware.tuxedo-drivers.settings.charging-priority` {#opt-hardware.tuxedo-drivers.settings.charging-priority}

These options manage the trade-off between battery charging and CPU performance when the USB-C power supply cannot provide sufficient power for both simultaneously:

- `charge_battery` prioritizes battery charging (driver default)
- `performance` prioritizes maximum CPU performance

*Type:* null or one of "charge\_battery", "performance"

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/tuxedo-drivers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/tuxedo-drivers.nix)

## `hardware.tuxedo-drivers.settings.charging-profile` {#opt-hardware.tuxedo-drivers.settings.charging-profile}

The maximum charge level to help reduce battery wear:

- `high_capacity` charges to 100% (driver default)
- `balanced` charges to 90%
- `stationary` charges to 80% (maximum lifespan)

**Note:** Regardless of the configured charging profile, the operating system will always report the battery as being charged to 100%.

*Type:* null or one of "high\_capacity", "balanced", "stationary"

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/tuxedo-drivers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/tuxedo-drivers.nix)

## `hardware.tuxedo-drivers.settings.fn-lock` {#opt-hardware.tuxedo-drivers.settings.fn-lock}

Enables or disables the laptop keyboard's Function (Fn) lock at boot.

When set to `true`, the Fn lock is enabled, allowing the function keys (F1–F12) to control brightness, volume etc.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/tuxedo-drivers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/tuxedo-drivers.nix)

## `hardware.tuxedo-rs.enable` {#opt-hardware.tuxedo-rs.enable}

Whether to enable Rust utilities for interacting with hardware from TUXEDO Computers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuxedo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuxedo-rs.nix)

## `hardware.tuxedo-rs.tailor-gui.enable` {#opt-hardware.tuxedo-rs.tailor-gui.enable}

Whether to enable tailor-gui, an alternative to TUXEDO Control Center, written in Rust.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuxedo-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuxedo-rs.nix)

## `hardware.ubertooth.enable` {#opt-hardware.ubertooth.enable}

Whether to enable Ubertooth software and its udev rules.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/ubertooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/ubertooth.nix)

## `hardware.ubertooth.group` {#opt-hardware.ubertooth.group}

Group for Ubertooth's udev rules.

*Type:* string

*Default:* `"ubertooth"`

*Example:* `"wheel"`

*Declared by:* [`nixos/modules/hardware/ubertooth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/ubertooth.nix)

## `hardware.uinput.enable` {#opt-hardware.uinput.enable}

Whether to enable uinput support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/uinput.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uinput.nix)

## `hardware.uni-sync.devices` {#opt-hardware.uni-sync.devices}

List of controllers with their configurations.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    device_id = "VID:1111/PID:11111/SN:1111111111";
    sync_rgb = true;
    channels = [
      {
        mode = "PWM";
      }
      {
        mode = "Manual";
        speed = 100;
      }
      {
        mode = "Manual";
        speed = 54;
      }
      {
        mode = "Manual";
        speed = 0;
      }
    ];
  }
  {
    device_id = "VID:1010/PID:10101/SN:1010101010";
    sync_rgb = false;
    channels = [
      {
        mode = "Manual";
        speed = 0;
      }
    ];
  }
]
```

*Declared by:* [`nixos/modules/hardware/uni-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uni-sync.nix)

## `hardware.uni-sync.devices.*.channels` {#opt-hardware.uni-sync.devices._.channels}

List of channels connected to the controller.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    mode = "PWM";
  }
  {
    mode = "Manual";
    speed = 100;
  }
  {
    mode = "Manual";
    speed = 54;
  }
  {
    mode = "Manual";
    speed = 0;
  }
]
```

*Declared by:* [`nixos/modules/hardware/uni-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uni-sync.nix)

## `hardware.uni-sync.devices.*.channels.*.mode` {#opt-hardware.uni-sync.devices._.channels._.mode}

"PWM" to enable PWM sync. "Manual" to set speed.

*Type:* one of "Manual", "PWM"

*Default:* `"Manual"`

*Example:* `"PWM"`

*Declared by:* [`nixos/modules/hardware/uni-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uni-sync.nix)

## `hardware.uni-sync.devices.*.channels.*.speed` {#opt-hardware.uni-sync.devices._.channels._.speed}

Fan speed as percentage (clamped between 0 and 100).

*Type:* signed integer

*Default:* `"50"`

*Example:* `"100"`

*Declared by:* [`nixos/modules/hardware/uni-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uni-sync.nix)

## `hardware.uni-sync.devices.*.device_id` {#opt-hardware.uni-sync.devices._.device_id}

Unique device ID displayed at each startup.

*Type:* string

*Example:* `"VID:1111/PID:11111/SN:1111111111"`

*Declared by:* [`nixos/modules/hardware/uni-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uni-sync.nix)

## `hardware.uni-sync.devices.*.sync_rgb` {#opt-hardware.uni-sync.devices._.sync_rgb}

Enable ARGB header sync.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/uni-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uni-sync.nix)

## `hardware.uni-sync.enable` {#opt-hardware.uni-sync.enable}

Whether to enable udev rules and software for Lian Li Uni Controllers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/uni-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uni-sync.nix)

## `hardware.uni-sync.package` {#opt-hardware.uni-sync.package}

The uni-sync package to use.

*Type:* package

*Default:* `pkgs.uni-sync`

*Declared by:* [`nixos/modules/hardware/uni-sync.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/uni-sync.nix)

## `hardware.usb-modeswitch.enable` {#opt-hardware.usb-modeswitch.enable}

Enable this option to support certain USB WLAN and WWAN adapters.

These network adapters initial present themselves as Flash Drives containing their drivers.
This option enables automatic switching to the networking mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/usb-modeswitch.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/usb-modeswitch.nix)

## `hardware.usbStorage.manageShutdown` {#opt-hardware.usbStorage.manageShutdown}

Enable this option to gracefully spin-down external storage during shutdown.
If you suspect improper head parking after poweroff, install `smartmontools` and check
for the `Power-Off_Retract_Count` field for an increment.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/hardware/usb-storage.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/usb-storage.nix)

## `hardware.wirelessRegulatoryDatabase` {#opt-hardware.wirelessRegulatoryDatabase}

Whether to enable loading the wireless regulatory database at boot.

*Type:* boolean

*Default:* Enabled if proprietary firmware is allowed via `enableRedistributableFirmware` or `enableAllFirmware`.

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/all-firmware.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/all-firmware.nix)

## `hardware.wooting.enable` {#opt-hardware.wooting.enable}

Whether to enable support for Wooting keyboards.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/wooting.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/wooting.nix)

## `hardware.xone.enable` {#opt-hardware.xone.enable}

Whether to enable the xone driver for Xbox One and Xbox Series X|S accessories.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/xone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/xone.nix)

## `hardware.xpad-noone.enable` {#opt-hardware.xpad-noone.enable}

Whether to enable the Xpad driver from the Linux kernel with support for Xbox One controllers removed.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/xpad-noone.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/xpad-noone.nix)

## `hardware.xpadneo.enable` {#opt-hardware.xpadneo.enable}

Whether to enable the xpadneo driver for Xbox One wireless controllers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/hardware/xpadneo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/xpadneo.nix)

## `hardware.xpadneo.quirks` {#opt-hardware.xpadneo.quirks}

Controller-specific quirk flags, keyed by MAC address.
Flags are combined as a bitmask to address compatibility issues
with specific controllers.

The value is a sum of individual flag values. For example, to apply
flags 1, 2, and 4, use `7` (1 + 2 + 4). To apply flags 2, 4, and 32,
use `38` (2 + 4 + 32).

See [https://github.com/atar-axis/xpadneo/blob/master/docs/CONFIGURATION.md](https://github.com/atar-axis/xpadneo/blob/master/docs/CONFIGURATION.md)
for available quirk flags and their values.

*Type:* attribute set of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `{ }`

*Example:*

``` nix
{
  "11:22:33:44:55:66" = 7; # Applies flags 1 + 2 + 4
}
```

*Declared by:* [`nixos/modules/hardware/xpadneo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/xpadneo.nix)

## `hardware.xpadneo.rumbleAttenuation` {#opt-hardware.xpadneo.rumbleAttenuation}

Force feedback attenuation settings. Higher values reduce rumble strength.

See [https://github.com/atar-axis/xpadneo/blob/master/docs/CONFIGURATION.md](https://github.com/atar-axis/xpadneo/blob/master/docs/CONFIGURATION.md)
for more information.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  overall = 50;   # 50% overall rumble
  triggers = 50;  # 25% trigger rumble (50% of 50%)
}
```

*Declared by:* [`nixos/modules/hardware/xpadneo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/xpadneo.nix)

## `hardware.xpadneo.rumbleAttenuation.overall` {#opt-hardware.xpadneo.rumbleAttenuation.overall}

Overall force feedback attenuation as a percentage.
`0` means full rumble, `100` means no rumble.
Applies to both main and trigger rumble.

*Type:* integer between 0 and 100 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/hardware/xpadneo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/xpadneo.nix)

## `hardware.xpadneo.rumbleAttenuation.triggers` {#opt-hardware.xpadneo.rumbleAttenuation.triggers}

Extra attenuation for trigger rumble as a percentage, applied
on top of `overall`. For example, `overall = 50` and
`triggers = 50` results in 50% main rumble and 25% trigger rumble.
Set to `100` to disable trigger rumble while keeping main rumble.
`null` means no extra trigger attenuation.

*Type:* null or integer between 0 and 100 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/hardware/xpadneo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/xpadneo.nix)

## `hardware.xpadneo.settings` {#opt-hardware.xpadneo.settings}

Kernel module parameters for hid\_xpadneo. These are passed directly
to the module via modprobe.

See [https://github.com/atar-axis/xpadneo/blob/master/docs/CONFIGURATION.md](https://github.com/atar-axis/xpadneo/blob/master/docs/CONFIGURATION.md)
for available parameters and their values.

*Type:* attribute set of (signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  disable_deadzones = 1;
  trigger_rumble_mode = 2;
  disable_shift_mode = 1;
}
```

*Declared by:* [`nixos/modules/hardware/xpadneo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/hardware/xpadneo.nix)
