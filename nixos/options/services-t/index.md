# services (T) {#sec-options-services-t}

## `services.tabby.acceleration` {#opt-services.tabby.acceleration}

Specifies the device to use for hardware acceleration.

- `cpu`: no acceleration just use the CPU
- `rocm`: supported by modern AMD GPUs
- `cuda`: supported by modern NVIDIA GPUs
- `metal`: supported on darwin aarch64 machines

Tabby will try and determine what type of acceleration that is
already enabled in your configuration when `acceleration = null`.

- nixpkgs.config.cudaSupport
- nixpkgs.config.rocmSupport
- if stdenv.hostPlatform.isDarwin

IFF multiple acceleration methods are found to be enabled or if you
haven't set either `cudaSupport or rocmSupport` you will have to
specify the device type manually here otherwise it will default to
the first from the list above or to cpu.

*Type:* null or one of "cpu", "rocm", "cuda", "metal"

*Default:* `null`

*Example:* `"rocm"`

*Declared by:* [`nixos/modules/services/misc/tabby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tabby.nix)

## `services.tabby.enable` {#opt-services.tabby.enable}

Whether to enable Self-hosted AI coding assistant using large language models.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tabby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tabby.nix)

## `services.tabby.host` {#opt-services.tabby.host}

Specifies the hostname on which the tabby server HTTP interface listens.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/tabby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tabby.nix)

## `services.tabby.model` {#opt-services.tabby.model}

Specify the model that tabby will use to generate completions.

This model will be downloaded automatically if it is not already present.

If you want to utilize an existing model that you've already
downloaded you'll need to move it into tabby's state directory which
lives in `/var/lib/tabby`. Because the tabby.service is configured to
use a DynamicUser the service will need to have been started at least
once before you can move the locally existing model into
`/var/lib/tabby`. You can set the model to 'none' and tabby will
startup and fail to download a model, but will have created the
`/var/lib/tabby` directory. You can then copy over the model manually
into `/var/lib/tabby`, update the model option to the name you just
downloaded and copied over then `nixos-rebuild switch` to start using
it.

$ tabby download --model TabbyML/DeepseekCoder-6.7B
$ find ~/.tabby/ | tail -n1
/home/ghthor/.tabby/models/TabbyML/DeepseekCoder-6.7B/ggml/q8\_0.v2.gguf
$ sudo rsync -r ~/.tabby/models/ /var/lib/tabby/models/
$ sudo chown -R tabby:tabby /var/lib/tabby/models/

See for Model Options:

> [https://github.com/TabbyML/registry-tabby](https://github.com/TabbyML/registry-tabby)

*Type:* string

*Default:* `"TabbyML/StarCoder-1B"`

*Declared by:* [`nixos/modules/services/misc/tabby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tabby.nix)

## `services.tabby.package` {#opt-services.tabby.package}

The tabby package to use.

*Type:* package

*Default:* `pkgs.tabby`

*Declared by:* [`nixos/modules/services/misc/tabby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tabby.nix)

## `services.tabby.port` {#opt-services.tabby.port}

Specifies the bind port on which the tabby server HTTP interface listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11029`

*Declared by:* [`nixos/modules/services/misc/tabby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tabby.nix)

## `services.tabby.usageCollection` {#opt-services.tabby.usageCollection}

Enable sending anonymous usage data.

See for more details:

> [https://tabby.tabbyml.com/docs/configuration#usage-collection](https://tabby.tabbyml.com/docs/configuration#usage-collection)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tabby.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tabby.nix)

## `services.tabbyapi.enable` {#opt-services.tabbyapi.enable}

Whether to enable tabbyapi.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.openFirewall` {#opt-services.tabbyapi.openFirewall}

Whether to open the firewall for the TabbyAPI port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.package` {#opt-services.tabbyapi.package}

The tabbyapi package to use.

*Type:* package

*Default:* `pkgs.tabbyapi`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings` {#opt-services.tabbyapi.settings}

Configuration for TabbyAPI.
See https://github.com/theroyallab/tabbyAPI/wiki/02.-Server-options and https://github.com/theroyallab/tabbyAPI/blob/main/config\_sample.yml

*Type:* open submodule of (YAML 1.1 value)

*Example:*

``` nix
{
  model = {
    model_name = "Qwen3_5-9B";
    max_seq_len = 32768;
    cache_mode = "8,8";
    tensor_parallel = true;
    gpu_split = [ 16 24 ];
  };
  draft_model.draft_mode = "ngram";
  memory.sysmem_kv_cache = 4096;
}
```

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.draft_model.draft_model_dir` {#opt-services.tabbyapi.settings.draft_model.draft_model_dir}

Directory to look for draft models
Relative to the state directory.

*Type:* string

*Default:* `"models"`

*Example:* `"drafts"`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.draft_model.draft_model_name` {#opt-services.tabbyapi.settings.draft_model.draft_model_name}

An initial draft model to load.
Ensure the model is in the model directory.

*Type:* null or string

*Default:* `null`

*Example:* `"Qwen3-0.6B-exl3"`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.lora.lora_dir` {#opt-services.tabbyapi.settings.lora.lora_dir}

Directory to look for LoRAs.
Relative to the state directory.

*Type:* string

*Default:* `"loras"`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.model.cache_mode` {#opt-services.tabbyapi.settings.model.cache_mode}

Enable different cache modes for VRAM savings.
Specify the pair k\_bits,v\_bits where k\_bits and v\_bits are integers from 2-8.
The legacy values 'FP16', 'Q8', 'Q6', 'Q4' are also accepted.

*Type:* string

*Default:* `"FP16"`

*Example:* `"8,8"`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.model.max_seq_len` {#opt-services.tabbyapi.settings.model.max_seq_len}

Max sequence length (default: 4096).
Set to -1 to fetch from the model's config.json

*Type:* null or signed integer

*Default:* `null`

*Example:* `32768`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.model.model_dir` {#opt-services.tabbyapi.settings.model.model_dir}

Directory to look for models.
Relative to the state directory.

*Type:* string

*Default:* `"models"`

*Example:*

``` nix
(pkgs.linkFarm "models" {
  qwen-8b = pkgs.fetchgit {
    url = "https://huggingface.co/turboderp/Qwen3-VL-8B-Instruct-exl3";
    rev = "652ab6be95b3e2880e78d87269013d98ca9c392d"; # 4bpw
    fetchLFS = true;
    hash = "sha256-n+9Mt7EZ3XHM0w8oGUZr4EBz91EFyp1VBpvl9Php/QM=";
  };
```

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.model.model_name` {#opt-services.tabbyapi.settings.model.model_name}

An initial model to load.
Make sure the model is located in the model directory!
REQUIRED: This must be filled out to load a model on startup.

*Type:* null or string

*Default:* `null`

*Example:* `"Qwen3_5-9B"`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.network.disable_auth` {#opt-services.tabbyapi.settings.network.disable_auth}

Disable HTTP token authentication with requests.
WARNING: This will make your instance vulnerable!
Only turn this on if nothing but trusted local clients can reach the API.
Note that web pages open in a browser on this machine also count as local
callers; restrict `network.allowed_origins` if you disable auth.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.network.host` {#opt-services.tabbyapi.settings.network.host}

The IP to host on.
Use 0.0.0.0 to expose on all network adapters.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tabbyapi.settings.network.port` {#opt-services.tabbyapi.settings.network.port}

The port to host on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/tabbyapi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tabbyapi.nix)

## `services.tahoe.introducers` {#opt-services.tahoe.introducers}

The Tahoe introducers.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.introducers.<name>.nickname` {#opt-services.tahoe.introducers._name_.nickname}

The nickname of this Tahoe introducer.

*Type:* string

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.introducers.<name>.package` {#opt-services.tahoe.introducers._name_.package}

The tahoelafs package to use.

*Type:* package

*Default:* `pkgs.tahoelafs`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.introducers.<name>.tub.location` {#opt-services.tahoe.introducers._name_.tub.location}

The external location that the introducer should listen on.

If specified, the port should be included.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.introducers.<name>.tub.port` {#opt-services.tahoe.introducers._name_.tub.port}

The port on which the introducer will listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3458`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes` {#opt-services.tahoe.nodes}

The Tahoe nodes.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.client.helper` {#opt-services.tahoe.nodes._name_.client.helper}

The furl for a Tahoe helper node.

Like all furls, keep this safe and don't share it.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.client.introducer` {#opt-services.tahoe.nodes._name_.client.introducer}

The furl for a Tahoe introducer node.

Like all furls, keep this safe and don't share it.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.client.shares.happy` {#opt-services.tahoe.nodes._name_.client.shares.happy}

The number of distinct storage nodes required to store
a file.

*Type:* signed integer

*Default:* `7`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.client.shares.needed` {#opt-services.tahoe.nodes._name_.client.shares.needed}

The number of shares required to reconstitute a file.

*Type:* signed integer

*Default:* `3`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.client.shares.total` {#opt-services.tahoe.nodes._name_.client.shares.total}

The number of shares required to store a file.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.helper.enable` {#opt-services.tahoe.nodes._name_.helper.enable}

Whether to enable helper service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.nickname` {#opt-services.tahoe.nodes._name_.nickname}

The nickname of this Tahoe node.

*Type:* string

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.package` {#opt-services.tahoe.nodes._name_.package}

The tahoelafs package to use.

*Type:* package

*Default:* `pkgs.tahoelafs`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.sftpd.accounts.file` {#opt-services.tahoe.nodes._name_.sftpd.accounts.file}

Path to the accounts file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.sftpd.accounts.url` {#opt-services.tahoe.nodes._name_.sftpd.accounts.url}

URL of the accounts server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.sftpd.enable` {#opt-services.tahoe.nodes._name_.sftpd.enable}

Whether to enable SFTP service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.sftpd.hostPrivateKeyFile` {#opt-services.tahoe.nodes._name_.sftpd.hostPrivateKeyFile}

Path to the SSH host private key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.sftpd.hostPublicKeyFile` {#opt-services.tahoe.nodes._name_.sftpd.hostPublicKeyFile}

Path to the SSH host public key.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.sftpd.port` {#opt-services.tahoe.nodes._name_.sftpd.port}

The port on which the SFTP server will listen.

This is the correct setting to tweak if you want Tahoe's SFTP
daemon to listen on a different port.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.storage.enable` {#opt-services.tahoe.nodes._name_.storage.enable}

Whether to enable storage service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.storage.reservedSpace` {#opt-services.tahoe.nodes._name_.storage.reservedSpace}

The amount of filesystem space to not use for storage.

*Type:* string

*Default:* `"1G"`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.tub.location` {#opt-services.tahoe.nodes._name_.tub.location}

The external location that the node should listen on.

This is the setting to tweak if there are multiple interfaces
and you want to alter which interface Tahoe is advertising.

If specified, the port should be included.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.tub.port` {#opt-services.tahoe.nodes._name_.tub.port}

The port on which the tub will listen.

This is the correct setting to tweak if you want Tahoe's storage
system to listen on a different port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3457`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tahoe.nodes.<name>.web.port` {#opt-services.tahoe.nodes._name_.web.port}

The port on which the Web server will listen.

This is the correct setting to tweak if you want Tahoe's WUI to
listen on a different port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3456`

*Declared by:* [`nixos/modules/services/network-filesystems/tahoe.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/tahoe.nix)

## `services.tailscale.authKeyFile` {#opt-services.tailscale.authKeyFile}

A file containing the auth key.
Tailscale will be automatically started if provided.

Services that bind to Tailscale IPs should order using [`systemd.services.<name>.after`](../../options/systemd/index.md#opt-systemd.services._name_.after) `tailscaled-autoconnect.service`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/tailscale_key"`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.authKeyParameters` {#opt-services.tailscale.authKeyParameters}

Extra parameters to pass after the auth key.
See [https://tailscale.com/kb/1215/oauth-clients#registering-new-nodes-using-oauth-credentials](https://tailscale.com/kb/1215/oauth-clients#registering-new-nodes-using-oauth-credentials)

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.authKeyParameters.baseURL` {#opt-services.tailscale.authKeyParameters.baseURL}

Base URL for the Tailscale API.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.authKeyParameters.ephemeral` {#opt-services.tailscale.authKeyParameters.ephemeral}

Whether to register as an ephemeral node.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.authKeyParameters.preauthorized` {#opt-services.tailscale.authKeyParameters.preauthorized}

Whether to skip manual device approval.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.derper.configureNginx` {#opt-services.tailscale.derper.configureNginx}

Whether to enable nginx reverse proxy for derper.
When enabled, nginx will proxy requests to the derper service.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/tailscale-derper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-derper.nix)

## `services.tailscale.derper.domain` {#opt-services.tailscale.derper.domain}

Domain name under which the derper server is reachable.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/tailscale-derper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-derper.nix)

## `services.tailscale.derper.enable` {#opt-services.tailscale.derper.enable}

Whether to enable Tailscale Derper. See upstream doc [https://tailscale.com/kb/1118/custom-derp-servers](https://tailscale.com/kb/1118/custom-derp-servers) how to configure it on clients.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tailscale-derper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-derper.nix)

## `services.tailscale.derper.openFirewall` {#opt-services.tailscale.derper.openFirewall}

Whether to open the firewall for the specified port.
Derper requires the used ports to be opened, otherwise it doesn't work as expected.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/tailscale-derper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-derper.nix)

## `services.tailscale.derper.package` {#opt-services.tailscale.derper.package}

The derper package to use.

*Type:* package

*Default:* `pkgs.tailscale.derper`

*Declared by:* [`nixos/modules/services/networking/tailscale-derper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-derper.nix)

## `services.tailscale.derper.port` {#opt-services.tailscale.derper.port}

The port the derper process will listen on. This is not the port tailscale will connect to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8010`

*Declared by:* [`nixos/modules/services/networking/tailscale-derper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-derper.nix)

## `services.tailscale.derper.stunPort` {#opt-services.tailscale.derper.stunPort}

STUN port to listen on.
See online docs [https://tailscale.com/kb/1118/custom-derp-servers#prerequisites](https://tailscale.com/kb/1118/custom-derp-servers#prerequisites) on how to configure a different external port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3478`

*Declared by:* [`nixos/modules/services/networking/tailscale-derper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-derper.nix)

## `services.tailscale.derper.verifyClients` {#opt-services.tailscale.derper.verifyClients}

Whether to verify clients against a locally running tailscale daemon if they are allowed to connect to this node or not.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tailscale-derper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-derper.nix)

## `services.tailscale.disableTaildrop` {#opt-services.tailscale.disableTaildrop}

Whether to disable the Taildrop feature for sending files between nodes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.disableUpstreamLogging` {#opt-services.tailscale.disableUpstreamLogging}

Whether to disable Tailscaled from sending debug logging upstream.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.enable` {#opt-services.tailscale.enable}

Whether to enable Tailscale client daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.extraDaemonFlags` {#opt-services.tailscale.extraDaemonFlags}

Extra flags to pass to `tailscaled`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--no-logs-no-support"
]
```

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.extraSetFlags` {#opt-services.tailscale.extraSetFlags}

Extra flags to pass to `tailscale set`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--advertise-exit-node"
]
```

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.extraUpFlags` {#opt-services.tailscale.extraUpFlags}

Extra flags to pass to `tailscale up`. Only applied if [`services.tailscale.authKeyFile`](#opt-services.tailscale.authKeyFile) is specified.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--ssh"
]
```

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.interfaceName` {#opt-services.tailscale.interfaceName}

The interface name for tunnel traffic. Use "userspace-networking" (beta) to not use TUN.

*Type:* string

*Default:* `"tailscale0"`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.openFirewall` {#opt-services.tailscale.openFirewall}

Whether to open the firewall for the specified port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.package` {#opt-services.tailscale.package}

The tailscale package to use.

*Type:* package

*Default:* `pkgs.tailscale`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.permitCertUid` {#opt-services.tailscale.permitCertUid}

Username or user ID of the user allowed to to fetch Tailscale TLS certificates for the node.

*Type:* null or non-empty string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.port` {#opt-services.tailscale.port}

The port to listen on for tunnel traffic (0=autoselect).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `41641`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.relayServerPort` {#opt-services.tailscale.relayServerPort}

The port to use for Tailscale peer relay.

Set to a port number to enable, `""` to explicitly disable, or `null` (default) to leave the setting unmanaged.

Note: Tailscale settings are persistent. If you previously set a port and now want to disable it, set this to `""`,
or run `tailscale set --relay-server-port=""` manually.
Setting it back to `null` will leave the last configured port active in Tailscale's state.

See [https://tailscale.com/docs/features/peer-relay](https://tailscale.com/docs/features/peer-relay)

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "" (singular enum)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscale.serve.configFile` {#opt-services.tailscale.serve.configFile}

Path to a Tailscale Serve configuration file in JSON format.
If set, this takes precedence over [`services.tailscale.serve.services`](#opt-services.tailscale.serve.services).

See [https://tailscale.com/kb/1589/tailscale-services-configuration-file](https://tailscale.com/kb/1589/tailscale-services-configuration-file) for the configuration format.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/tailscale-serve.json"`

*Declared by:* [`nixos/modules/services/networking/tailscale-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-serve.nix)

## `services.tailscale.serve.enable` {#opt-services.tailscale.serve.enable}

Whether to enable Tailscale Serve configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tailscale-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-serve.nix)

## `services.tailscale.serve.services` {#opt-services.tailscale.serve.services}

Services to configure for Tailscale Serve.

Each attribute name should be the service name (without the `svc:` prefix).
The `svc:` prefix will be added automatically.

See [https://tailscale.com/kb/1589/tailscale-services-configuration-file](https://tailscale.com/kb/1589/tailscale-services-configuration-file) for details.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  web-server = {
    endpoints = {
      "tcp:443" = "https://localhost:443";
    };
  };
  api = {
    endpoints = {
      "tcp:8080" = "http://localhost:8080";
    };
    advertised = true;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/tailscale-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-serve.nix)

## `services.tailscale.serve.services.<name>.advertised` {#opt-services.tailscale.serve.services._name_.advertised}

Whether the service should accept new connections.
Defaults to `true` when not specified.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tailscale-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-serve.nix)

## `services.tailscale.serve.services.<name>.endpoints` {#opt-services.tailscale.serve.services._name_.endpoints}

Map of incoming traffic patterns to local targets.

Keys should be in the format `<protocol>:<port>` or `<protocol>:<port-range>`.
Currently only `tcp` protocol is supported.

Values should be in the format `<protocol>://<host:port>` where protocol
is `http`, `https`, or `tcp`.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "tcp:443" = "https://localhost:443";
  "tcp:8080" = "http://localhost:8080";
}
```

*Declared by:* [`nixos/modules/services/networking/tailscale-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-serve.nix)

## `services.tailscale.useRoutingFeatures` {#opt-services.tailscale.useRoutingFeatures}

Enables settings required for Tailscale's routing features like subnet routers and exit nodes.

To use these these features, you will still need to call `sudo tailscale up` with the relevant flags like `--advertise-exit-node` and `--exit-node`.

When set to `client` or `both`, reverse path filtering will be set to loose instead of strict.
When set to `server` or `both`, IP forwarding will be enabled.

*Type:* one of "none", "client", "server", "both"

*Default:* `"none"`

*Example:* `"server"`

*Declared by:* [`nixos/modules/services/networking/tailscale.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale.nix)

## `services.tailscaleAuth.enable` {#opt-services.tailscaleAuth.enable}

Whether to enable tailscale.nginx-auth, to authenticate users via tailscale.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-auth.nix)

## `services.tailscaleAuth.group` {#opt-services.tailscaleAuth.group}

Group which runs tailscale-nginx-auth

*Type:* string

*Default:* `"tailscale-nginx-auth"`

*Declared by:* [`nixos/modules/services/networking/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-auth.nix)

## `services.tailscaleAuth.package` {#opt-services.tailscaleAuth.package}

The tailscale-nginx-auth package to use.

*Type:* package

*Default:* `pkgs.tailscale-nginx-auth`

*Declared by:* [`nixos/modules/services/networking/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-auth.nix)

## `services.tailscaleAuth.socketPath` {#opt-services.tailscaleAuth.socketPath}

Path of the socket listening to authorization requests.

*Type:* absolute path

*Default:* `"/run/tailscale-nginx-auth/tailscale-nginx-auth.sock"`

*Declared by:* [`nixos/modules/services/networking/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-auth.nix)

## `services.tailscaleAuth.user` {#opt-services.tailscaleAuth.user}

User which runs tailscale-nginx-auth

*Type:* string

*Default:* `"tailscale-nginx-auth"`

*Declared by:* [`nixos/modules/services/networking/tailscale-auth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tailscale-auth.nix)

## `services.taler.exchange.debug` {#opt-services.taler.exchange.debug}

Whether to enable debug logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.denominationConfig` {#opt-services.taler.exchange.denominationConfig}

This option configures the cash denomination for the coins that the exchange offers.
For more information, consult the [upstream docs](https://docs.taler.net/taler-exchange-manual.html#coins-denomination-keys).

You can either write these manually or you can use the `taler-harness deployment gen-coin-config`
command to generate it.

Warning: Do not modify existing denominations after deployment.
Please see the upstream docs for how to safely do that.

*Type:* strings concatenated with "\\n"

*Default:* `"None, you must set this yourself."`

*Example:*

``` nix
''
  [COIN_KUDOS-n1-t1718140083]
  VALUE = KUDOS:0.1
  DURATION_WITHDRAW = 7 days
  DURATION_SPEND = 2 years
  DURATION_LEGAL = 6 years
  FEE_WITHDRAW = KUDOS:0
  FEE_DEPOSIT = KUDOS:0.1
  FEE_REFRESH = KUDOS:0
  FEE_REFUND = KUDOS:0
  RSA_KEYSIZE = 2048
  CIPHER = RSA
''
```

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.enable` {#opt-services.taler.exchange.enable}

Whether to enable the GNU Taler exchange.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.openFirewall` {#opt-services.taler.exchange.openFirewall}

Whether to open ports in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.package` {#opt-services.taler.exchange.package}

The taler-exchange package to use.

*Type:* package

*Default:* `pkgs.taler-exchange`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.settings` {#opt-services.taler.exchange.settings}

Configuration options for the taler exchange config file.

For a list of all possible options, please see the man page [`taler-exchange.conf(5)`](https://docs.taler.net/manpages/taler-exchange.conf.5.html)

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.settings.exchange.CURRENCY` {#opt-services.taler.exchange.settings.exchange.CURRENCY}

The currency which the exchange will operate with. This cannot be changed later.

*Type:* non-empty string

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.settings.exchange.CURRENCY_ROUND_UNIT` {#opt-services.taler.exchange.settings.exchange.CURRENCY_ROUND_UNIT}

Smallest amount in this currency that can be transferred using the underlying RTGS. For example: "EUR:0.01" or "JPY:1"

*Type:* string

*Default:* ``"0.01 in {option}`CURRENCY`"``

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.settings.exchange.DB` {#opt-services.taler.exchange.settings.exchange.DB}

Plugin to use for the database.

*Type:* value "postgres" (singular enum)

*Default:* `"postgres"`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.settings.exchange.MASTER_PUBLIC_KEY` {#opt-services.taler.exchange.settings.exchange.MASTER_PUBLIC_KEY}

Used by the exchange to verify information signed by the offline system.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.settings.exchange.PORT` {#opt-services.taler.exchange.settings.exchange.PORT}

Port on which the HTTP server listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8081`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.exchange.settings.exchangedb-postgres.CONFIG` {#opt-services.taler.exchange.settings.exchangedb-postgres.CONFIG}

Database connection URI.

*Type:* non-empty string

*Default:* `"postgres:///taler-exchange-httpd"`

*Declared by:* [`nixos/modules/services/finance/taler/exchange.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/exchange.nix)

## `services.taler.includes` {#opt-services.taler.includes}

Files to include into the config file using Taler's `@inline@` directive.

This allows including arbitrary INI files, including imperatively managed ones.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/finance/taler/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/module.nix)

## `services.taler.merchant.debug` {#opt-services.taler.merchant.debug}

Whether to enable debug logging.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.enable` {#opt-services.taler.merchant.enable}

Whether to enable the GNU Taler merchant.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.openFirewall` {#opt-services.taler.merchant.openFirewall}

Whether to open ports in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.package` {#opt-services.taler.merchant.package}

The taler-merchant package to use.

*Type:* package

*Default:* `pkgs.taler-merchant`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.settings` {#opt-services.taler.merchant.settings}

Configuration options for the taler merchant config file.

For a list of all possible options, please see the man page [`taler-merchant.conf(5)`](https://docs.taler.net/manpages/taler-merchant.conf.5.html)

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.settings.merchant.DB` {#opt-services.taler.merchant.settings.merchant.DB}

Plugin to use for the database.

*Type:* value "postgres" (singular enum)

*Default:* `"postgres"`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.settings.merchant.LEGAL_PRESERVATION` {#opt-services.taler.merchant.settings.merchant.LEGAL_PRESERVATION}

How long to keep data in the database for tax audits after the transaction has completed.

*Type:* string

*Default:* `"10 years"`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.settings.merchant.PORT` {#opt-services.taler.merchant.settings.merchant.PORT}

Port on which the HTTP server listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8083`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.settings.merchant.SERVE` {#opt-services.taler.merchant.settings.merchant.SERVE}

Whether the HTTP server should listen on a UNIX domain socket ("unix") or on a TCP socket ("tcp").

*Type:* one of "tcp", "unix"

*Default:* `"tcp"`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.merchant.settings.merchantdb-postgres.CONFIG` {#opt-services.taler.merchant.settings.merchantdb-postgres.CONFIG}

Database connection URI.

*Type:* non-empty string

*Default:* `"postgres:///taler-merchant-httpd"`

*Declared by:* [`nixos/modules/services/finance/taler/merchant.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/merchant.nix)

## `services.taler.runtimeDir` {#opt-services.taler.runtimeDir}

Runtime directory shared between the taler services.

Crypto helpers put their sockets here for instance and the httpd
connects to them.

*Type:* string

*Default:* `"/run/taler-system-runtime/"`

*Declared by:* [`nixos/modules/services/finance/taler/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/module.nix)

## `services.taler.settings` {#opt-services.taler.settings}

Global configuration options for the taler config file.

For a list of all possible options, please see the man page [`taler.conf(5)`](https://docs.taler.net/manpages/taler.conf.5.html)

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/finance/taler/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/module.nix)

## `services.taler.settings.taler.CURRENCY` {#opt-services.taler.settings.taler.CURRENCY}

The currency which taler services will operate with. This cannot be changed later.

*Type:* non-empty string

*Declared by:* [`nixos/modules/services/finance/taler/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/module.nix)

## `services.taler.settings.taler.CURRENCY_ROUND_UNIT` {#opt-services.taler.settings.taler.CURRENCY_ROUND_UNIT}

Smallest amount in this currency that can be transferred using the underlying RTGS.

You should probably not touch this.

*Type:* string

*Default:*

``` nix
"${config.services.taler.settings.taler.CURRENCY}:0.01"
```

*Declared by:* [`nixos/modules/services/finance/taler/module.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/finance/taler/module.nix)

## `services.tandoor-recipes.address` {#opt-services.tandoor-recipes.address}

Web interface address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/tandoor-recipes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tandoor-recipes.nix)

## `services.tandoor-recipes.database.createLocally` {#opt-services.tandoor-recipes.database.createLocally}

Configure local PostgreSQL database server for Tandoor Recipes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tandoor-recipes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tandoor-recipes.nix)

## `services.tandoor-recipes.enable` {#opt-services.tandoor-recipes.enable}

Enable Tandoor Recipes.

When started, the Tandoor Recipes database is automatically created if
it doesn't exist and updated if the package has changed. Both tasks are
achieved by running a Django migration.

A script to manage the instance (by wrapping Django's manage.py) is linked to
`/var/lib/tandoor-recipes/tandoor-recipes-manage`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tandoor-recipes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tandoor-recipes.nix)

## `services.tandoor-recipes.extraConfig` {#opt-services.tandoor-recipes.extraConfig}

Extra tandoor recipes config options.

See [the example dot-env file](https://raw.githubusercontent.com/vabene1111/recipes/master/.env.template)
for available options.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  ENABLE_SIGNUP = "1";
}
```

*Declared by:* [`nixos/modules/services/misc/tandoor-recipes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tandoor-recipes.nix)

## `services.tandoor-recipes.group` {#opt-services.tandoor-recipes.group}

Group under which Tandoor runs.

*Type:* string

*Default:* `"tandoor_recipes"`

*Declared by:* [`nixos/modules/services/misc/tandoor-recipes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tandoor-recipes.nix)

## `services.tandoor-recipes.package` {#opt-services.tandoor-recipes.package}

The tandoor-recipes package to use.

*Type:* package

*Default:* `pkgs.tandoor-recipes`

*Declared by:* [`nixos/modules/services/misc/tandoor-recipes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tandoor-recipes.nix)

## `services.tandoor-recipes.port` {#opt-services.tandoor-recipes.port}

Web interface port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/tandoor-recipes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tandoor-recipes.nix)

## `services.tandoor-recipes.user` {#opt-services.tandoor-recipes.user}

User account under which Tandoor runs.

*Type:* string

*Default:* `"tandoor_recipes"`

*Declared by:* [`nixos/modules/services/misc/tandoor-recipes.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tandoor-recipes.nix)

## `services.tang.enable` {#opt-services.tang.enable}

Whether to enable tang.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tang.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tang.nix)

## `services.tang.ipAddressAllow` {#opt-services.tang.ipAddressAllow}

Whitelist a list of address prefixes.
Preferably, internal addresses should be used.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.1.0/24"
]
```

*Declared by:* [`nixos/modules/services/security/tang.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tang.nix)

## `services.tang.listenStream` {#opt-services.tang.listenStream}

Addresses and/or ports on which tang should listen.
For detailed syntax see ListenStream in `systemd.socket(5)`.

*Type:* list of string

*Default:*

``` nix
[
  "7654"
]
```

*Example:*

``` nix
[
  "198.168.100.1:7654"
  "[2001:db8::1]:7654"
  "7654"
]
```

*Declared by:* [`nixos/modules/services/security/tang.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tang.nix)

## `services.tang.package` {#opt-services.tang.package}

The tang package to use.

*Type:* package

*Default:* `pkgs.tang`

*Declared by:* [`nixos/modules/services/security/tang.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tang.nix)

## `services.tap.enable` {#opt-services.tap.enable}

Whether to enable Tap, ATProtocol firehose sync utility.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tap.nix)

## `services.tap.environmentFiles` {#opt-services.tap.environmentFiles}

Files to load environment variables from. Use for secrets such as
`TAP_ADMIN_PASSWORD` that should not be readable in the Nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/tap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tap.nix)

## `services.tap.package` {#opt-services.tap.package}

The tap package to use.

*Type:* package

*Default:* `pkgs.tap`

*Declared by:* [`nixos/modules/services/networking/tap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tap.nix)

## `services.tap.settings` {#opt-services.tap.settings}

Configuration for Tap as environment variables. See the
[README](https://github.com/bluesky-social/indigo/blob/main/cmd/tap/README.md)
for all available options.

Secrets such as `settings.TAP_ADMIN_PASSWORD` should be set via
`environmentFiles` rather than here, as values set here will
be readable in the Nix store.

*Type:* open submodule of attribute set of (null or boolean or signed integer or floating point number or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/tap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tap.nix)

## `services.tap.settings.TAP_BIND` {#opt-services.tap.settings.TAP_BIND}

Address and port the HTTP server will listen on.

*Type:* string

*Default:* `"127.0.0.1:2480"`

*Declared by:* [`nixos/modules/services/networking/tap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tap.nix)

## `services.tap.settings.TAP_DATABASE_URL` {#opt-services.tap.settings.TAP_DATABASE_URL}

Database connection string. Accepts SQLite (`sqlite://path`) or
PostgreSQL (`postgres://...`) connection strings.

*Type:* string

*Default:* `"sqlite:///var/lib/tap/tap.db"`

*Declared by:* [`nixos/modules/services/networking/tap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tap.nix)

## `services.target.config` {#opt-services.target.config}

Content of /etc/target/saveconfig.json
This file is normally read and written by targetcli

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/iscsi/target.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/target.nix)

## `services.target.enable` {#opt-services.target.enable}

Whether to enable the kernel's LIO iscsi target.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/iscsi/target.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/iscsi/target.nix)

## `services.tarsnap.archives` {#opt-services.tarsnap.archives}

Tarsnap archive configurations. Each attribute names an archive
to be created at a given time interval, according to the options
associated with it. When uploading to the tarsnap server,
archive names are suffixed by a 1 second resolution timestamp,
with the format `%Y%m%d%H%M%S`.

For each member of the set is created a timer which triggers the
instanced `tarsnap-archive-name` service unit. You may use
`systemctl start tarsnap-archive-name` to
manually trigger creation of `archive-name` at
any time.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  nixos =
    { directories = [ "/home" "/root/ssl" ];
    };

  gamedata =
    { directories = [ "/var/lib/minecraft" ];
      period      = "*:30";
    };
}
```

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.aggressiveNetworking` {#opt-services.tarsnap.archives._name_.aggressiveNetworking}

Upload data over multiple TCP connections, potentially
increasing tarsnap's bandwidth utilisation at the cost
of slowing down all other network traffic. Not
recommended unless TCP congestion is the dominant
limiting factor.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.cachedir` {#opt-services.tarsnap.archives._name_.cachedir}

The cache allows tarsnap to identify previously stored data
blocks, reducing archival time and bandwidth usage.

Should the cache become desynchronized or corrupted, tarsnap
will refuse to run until you manually rebuild the cache with
`tarsnap --fsck`.

Set to `null` to disable caching.

*Type:* null or absolute path

*Default:*

``` nix
"/var/cache/tarsnap/${utils.escapeSystemdPath config.services.tarsnap.archives.<name>.keyfile}"
```

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.checkpointBytes` {#opt-services.tarsnap.archives._name_.checkpointBytes}

Create a checkpoint every `checkpointBytes`
of uploaded data (optionally specified using an SI prefix).

1GB is the minimum value. A higher value is recommended,
as checkpointing is expensive.

Set to `null` to disable checkpointing.

*Type:* null or string

*Default:* `"1GB"`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.directories` {#opt-services.tarsnap.archives._name_.directories}

List of filesystem paths to archive.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.excludes` {#opt-services.tarsnap.archives._name_.excludes}

Exclude files and directories matching these patterns.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.explicitSymlinks` {#opt-services.tarsnap.archives._name_.explicitSymlinks}

Whether to follow symlinks specified as archives.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.followSymlinks` {#opt-services.tarsnap.archives._name_.followSymlinks}

Whether to follow all symlinks in archive trees.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.includes` {#opt-services.tarsnap.archives._name_.includes}

Include only files and directories matching these
patterns (the empty list includes everything).

Exclusions have precedence over inclusions.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.keyfile` {#opt-services.tarsnap.archives._name_.keyfile}

Set a specific keyfile for this archive. This defaults to
`"/root/tarsnap.key"` if left unspecified.

Use this option if you want to run multiple backups
concurrently - each archive must have a unique key. You can
generate a write-only key derived from your master key (which
is recommended) using `tarsnap-keymgmt(1)`.

Note: every archive must have an individual master key. You
must generate multiple keys with
`tarsnap-keygen(1)`, and then generate write
only keys from those.

The keyfile name should be given as a string and not a path, to
avoid the key being copied into the Nix store.

*Type:* string

*Default:* `config.services.tarsnap.keyfile`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.lowmem` {#opt-services.tarsnap.archives._name_.lowmem}

Reduce memory consumption by not caching small files.
Possibly beneficial if the average file size is smaller
than 1 MB and the number of files is lower than the
total amount of RAM in KB.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.maxbw` {#opt-services.tarsnap.archives._name_.maxbw}

Abort archival if upstream bandwidth usage in bytes
exceeds this threshold.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.maxbwRateDown` {#opt-services.tarsnap.archives._name_.maxbwRateDown}

Download bandwidth rate limit in bytes.

*Type:* null or signed integer

*Default:* `null`

*Example:* `50 * 1000`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.maxbwRateUp` {#opt-services.tarsnap.archives._name_.maxbwRateUp}

Upload bandwidth rate limit in bytes.

*Type:* null or signed integer

*Default:* `null`

*Example:* `25 * 1000`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.nodump` {#opt-services.tarsnap.archives._name_.nodump}

Exclude files with the `nodump` flag.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.period` {#opt-services.tarsnap.archives._name_.period}

Create archive at this interval.

The format is described in
`systemd.time(7)`.

*Type:* string

*Default:* `"01:15"`

*Example:* `"hourly"`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.printStats` {#opt-services.tarsnap.archives._name_.printStats}

Print global archive statistics upon completion.
The output is available via
`systemctl status tarsnap-archive-name`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.verbose` {#opt-services.tarsnap.archives._name_.verbose}

Whether to produce verbose logging output.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.archives.<name>.verylowmem` {#opt-services.tarsnap.archives._name_.verylowmem}

Reduce memory consumption by a factor of 2 beyond what
`lowmem` does, at the cost of significantly
slowing down the archiving process.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.enable` {#opt-services.tarsnap.enable}

Whether to enable periodic tarsnap backups.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.keyfile` {#opt-services.tarsnap.keyfile}

The keyfile which associates this machine with your tarsnap
account.
Create the keyfile with `tarsnap-keygen`.

Note that each individual archive (specified below) may also have its
own individual keyfile specified. Tarsnap does not allow multiple
concurrent backups with the same cache directory and key (starting a
new backup will cause another one to fail). If you have multiple
archives specified, you should either spread out your backups to be
far apart, or specify a separate key for each archive. By default
every archive defaults to using
`"/root/tarsnap.key"`.

It's recommended for backups that you generate a key for every archive
using `tarsnap-keygen(1)`, and then generate a
write-only tarsnap key using `tarsnap-keymgmt(1)`,
and keep your master key(s) for a particular machine off-site.

The keyfile name should be given as a string and not a path, to
avoid the key being copied into the Nix store.

*Type:* string

*Default:* `"/root/tarsnap.key"`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.tarsnap.package` {#opt-services.tarsnap.package}

The tarsnap package to use.

*Type:* package

*Default:* `pkgs.tarsnap`

*Declared by:* [`nixos/modules/services/backup/tarsnap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tarsnap.nix)

## `services.taskchampion-sync-server.allowClientIds` {#opt-services.taskchampion-sync-server.allowClientIds}

Client IDs to allow (can be repeated; if not specified, all clients are allowed)

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.dataDir` {#opt-services.taskchampion-sync-server.dataDir}

Directory in which to store data

*Type:* absolute path

*Default:* `"/var/lib/taskchampion-sync-server"`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.dynamicUser` {#opt-services.taskchampion-sync-server.dynamicUser}

Whether to use dynamic user

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.enable` {#opt-services.taskchampion-sync-server.enable}

Whether to enable TaskChampion Sync Server for Taskwarrior 3.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.group` {#opt-services.taskchampion-sync-server.group}

Unix Group to run the server under

*Type:* string

*Default:* `"taskchampion"`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.host` {#opt-services.taskchampion-sync-server.host}

Host address on which to serve

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.openFirewall` {#opt-services.taskchampion-sync-server.openFirewall}

Whether to enable Open firewall port for taskchampion-sync-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.package` {#opt-services.taskchampion-sync-server.package}

The taskchampion-sync-server package to use.

*Type:* package

*Default:* `pkgs.taskchampion-sync-server`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.port` {#opt-services.taskchampion-sync-server.port}

Port on which to serve

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10222`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.snapshot.days` {#opt-services.taskchampion-sync-server.snapshot.days}

Target number of days between snapshots

*Type:* positive integer, meaning \>0

*Default:* `14`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.snapshot.versions` {#opt-services.taskchampion-sync-server.snapshot.versions}

Target number of versions between snapshots

*Type:* positive integer, meaning \>0

*Default:* `100`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskchampion-sync-server.user` {#opt-services.taskchampion-sync-server.user}

Unix User to run the server under

*Type:* string

*Default:* `"taskchampion"`

*Declared by:* [`nixos/modules/services/misc/taskchampion-sync-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskchampion-sync-server.nix)

## `services.taskserver.allowedClientIDs` {#opt-services.taskserver.allowedClientIDs}

A list of regular expressions that are matched against the reported
client id (such as `task 2.3.0`).

The values `all` or `none` have
special meaning. Overridden by any entry in the option
[`services.taskserver.disallowedClientIDs`](#opt-services.taskserver.disallowedClientIDs).

*Type:* string or list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "[Tt]ask [2-9]+"
]
```

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.ciphers` {#opt-services.taskserver.ciphers}

List of GnuTLS ciphers to use. See the GnuTLS documentation about
priority strings at [https://gnutls.org/manual/html\_node/Priority-Strings.html](https://gnutls.org/manual/html_node/Priority-Strings.html) for full details.

*Type:* null or strings concatenated with ":"

*Default:* `null`

*Example:* `"NORMAL:-VERS-SSL3.0"`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.config` {#opt-services.taskserver.config}

Configuration options to pass to Taskserver.

The options here are the same as described in
`taskdrc(5)` from the `taskwarrior2` package, but with one difference:

The `server` option is
`server.listen` here, because the
`server` option would collide with other options
like `server.cert` and we would run in a type error
(attribute set versus string).

Nix types like integers or booleans are automatically converted to
the right values Taskserver would expect.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  client = {
    cert = "/tmp/debugging.cert";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.confirmation` {#opt-services.taskserver.confirmation}

Determines whether certain commands are confirmed.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.dataDir` {#opt-services.taskserver.dataDir}

Data directory for Taskserver.

*Type:* absolute path

*Default:* `"/var/lib/taskserver"`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.debug` {#opt-services.taskserver.debug}

Logs debugging information.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.disallowedClientIDs` {#opt-services.taskserver.disallowedClientIDs}

A list of regular expressions that are matched against the reported
client id (such as `task 2.3.0`).

The values `all` or `none` have
special meaning. Any entry here overrides those in
[`services.taskserver.allowedClientIDs`](#opt-services.taskserver.allowedClientIDs).

*Type:* string or list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "[Tt]ask [2-9]+"
]
```

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.enable` {#opt-services.taskserver.enable}

Whether to enable the Taskwarrior 2 server.

More instructions about NixOS in conjunction with Taskserver can be
found [in the NixOS manual](https://nixos.org/manual/nixos/stable/index.html#module-services-taskserver).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.extensions` {#opt-services.taskserver.extensions}

Fully qualified path of the Taskserver extension scripts.
Currently there are none.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.fqdn` {#opt-services.taskserver.fqdn}

The fully qualified domain name of this server, which is also used
as the common name in the certificates.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.group` {#opt-services.taskserver.group}

Group for Taskserver.

*Type:* string

*Default:* `"taskd"`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.ipLog` {#opt-services.taskserver.ipLog}

Logs the IP addresses of incoming requests.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.listenHost` {#opt-services.taskserver.listenHost}

The address (IPv4, IPv6 or DNS) to listen on.

*Type:* string

*Default:* `"localhost"`

*Example:* `"::"`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.listenPort` {#opt-services.taskserver.listenPort}

Port number of the Taskserver.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53589`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.openFirewall` {#opt-services.taskserver.openFirewall}

Whether to open the firewall for the specified Taskserver port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.organisations` {#opt-services.taskserver.organisations}

An attribute set where the keys name the organisation and the values
are a set of lists of `users` and
`groups`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  myShinyOrganisation = {
    groups = [
      "staff"
      "outsiders"
    ];
    users = [
      "alice"
      "bob"
    ];
  };
  yetAnotherOrganisation = {
    users = [
      "foo"
      "bar"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.organisations.<name>.groups` {#opt-services.taskserver.organisations._name_.groups}

A list of group names that belong to the organization.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "workers"
  "slackers"
]
```

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.organisations.<name>.users` {#opt-services.taskserver.organisations._name_.users}

A list of user names that belong to the organization.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice"
  "bob"
]
```

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.auto.bits` {#opt-services.taskserver.pki.auto.bits}

The bit size for generated keys.

::: note
This option is for the automatically handled CA and will be ignored if any
of the `services.taskserver.pki.manual.*` options are set.
:::

*Type:* signed integer

*Default:* `4096`

*Example:* `2048`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.auto.expiration.ca` {#opt-services.taskserver.pki.auto.expiration.ca}

The expiration time of the CA certificate in days or `null` for no
expiration time.

::: note
This option is for the automatically handled CA and will be ignored if any
of the `services.taskserver.pki.manual.*` options are set.
:::

*Type:* null or signed integer

*Default:* `null`

*Example:* `365`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.auto.expiration.client` {#opt-services.taskserver.pki.auto.expiration.client}

The expiration time of client certificates in days or `null` for no
expiration time.

::: note
This option is for the automatically handled CA and will be ignored if any
of the `services.taskserver.pki.manual.*` options are set.
:::

*Type:* null or signed integer

*Default:* `null`

*Example:* `365`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.auto.expiration.crl` {#opt-services.taskserver.pki.auto.expiration.crl}

The expiration time of the certificate revocation list (CRL) in days or `null` for no
expiration time.

::: note
This option is for the automatically handled CA and will be ignored if any
of the `services.taskserver.pki.manual.*` options are set.
:::

*Type:* null or signed integer

*Default:* `null`

*Example:* `365`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.auto.expiration.server` {#opt-services.taskserver.pki.auto.expiration.server}

The expiration time of the server certificate in days or `null` for no
expiration time.

::: note
This option is for the automatically handled CA and will be ignored if any
of the `services.taskserver.pki.manual.*` options are set.
:::

*Type:* null or signed integer

*Default:* `null`

*Example:* `365`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.manual.ca.cert` {#opt-services.taskserver.pki.manual.ca.cert}

Fully qualified path to the CA certificate.

::: note
Setting this option will prevent automatic CA creation and handling.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.manual.server.cert` {#opt-services.taskserver.pki.manual.server.cert}

Fully qualified path to the server certificate.

::: note
Setting this option will prevent automatic CA creation and handling.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.manual.server.crl` {#opt-services.taskserver.pki.manual.server.crl}

Fully qualified path to the server certificate revocation list.

::: note
Setting this option will prevent automatic CA creation and handling.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.pki.manual.server.key` {#opt-services.taskserver.pki.manual.server.key}

Fully qualified path to the server key.

::: note
Setting this option will prevent automatic CA creation and handling.
:::

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.queueSize` {#opt-services.taskserver.queueSize}

Size of the connection backlog, see `listen(2)`.

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.requestLimit` {#opt-services.taskserver.requestLimit}

Size limit of incoming requests, in bytes.

*Type:* signed integer

*Default:* `1048576`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.trust` {#opt-services.taskserver.trust}

Determines how client certificates are validated.

The value `allow all` performs no client
certificate validation. This is not recommended. The value
`strict` causes the client certificate to be
validated against a CA.

*Type:* one of "allow all", "strict"

*Default:* `"strict"`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.taskserver.user` {#opt-services.taskserver.user}

User for Taskserver.

*Type:* string

*Default:* `"taskd"`

*Declared by:* [`nixos/modules/services/misc/taskserver`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/taskserver)

## `services.tautulli.configFile` {#opt-services.tautulli.configFile}

The location of Tautulli's config file.

*Type:* string

*Default:* `"/var/lib/plexpy/config.ini"`

*Declared by:* [`nixos/modules/services/misc/tautulli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tautulli.nix)

## `services.tautulli.dataDir` {#opt-services.tautulli.dataDir}

The directory where Tautulli stores its data files.

*Type:* string

*Default:* `"/var/lib/plexpy"`

*Declared by:* [`nixos/modules/services/misc/tautulli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tautulli.nix)

## `services.tautulli.enable` {#opt-services.tautulli.enable}

Whether to enable Tautulli Plex Monitor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tautulli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tautulli.nix)

## `services.tautulli.group` {#opt-services.tautulli.group}

Group under which Tautulli runs.

*Type:* string

*Default:* `"nogroup"`

*Declared by:* [`nixos/modules/services/misc/tautulli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tautulli.nix)

## `services.tautulli.openFirewall` {#opt-services.tautulli.openFirewall}

Open ports in the firewall for Tautulli.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tautulli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tautulli.nix)

## `services.tautulli.package` {#opt-services.tautulli.package}

The tautulli package to use.

*Type:* package

*Default:* `pkgs.tautulli`

*Declared by:* [`nixos/modules/services/misc/tautulli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tautulli.nix)

## `services.tautulli.port` {#opt-services.tautulli.port}

TCP port where Tautulli listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8181`

*Declared by:* [`nixos/modules/services/misc/tautulli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tautulli.nix)

## `services.tautulli.user` {#opt-services.tautulli.user}

User account under which Tautulli runs.

*Type:* string

*Default:* `"plexpy"`

*Declared by:* [`nixos/modules/services/misc/tautulli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tautulli.nix)

## `services.tayga.dataDir` {#opt-services.tayga.dataDir}

Directory for persistent data.

*Type:* absolute path

*Default:* `"/var/lib/tayga"`

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.enable` {#opt-services.tayga.enable}

Whether to enable Tayga.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv4` {#opt-services.tayga.ipv4}

IPv4-specific configuration.

*Type:* submodule

*Example:*

``` nix
{
  address = "192.0.2.0";
  router = {
    address = "192.0.2.1";
  };
  pool = {
    address = "192.0.2.1";
    prefixLength = 24;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv4.address` {#opt-services.tayga.ipv4.address}

The source IPv4 address of the TAYGA server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv4.pool` {#opt-services.tayga.ipv4.pool}

The pool of IPv4 addresses which are used for translation.

*Type:* null or (submodule)

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv4.pool.address` {#opt-services.tayga.ipv4.pool.address}

IPv4 address.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv4.pool.prefixLength` {#opt-services.tayga.ipv4.pool.prefixLength}

Subnet mask of the interface, specified as the number of
bits in the prefix ("24").

*Type:* integer between 0 and 32 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv4.router.address` {#opt-services.tayga.ipv4.router.address}

The IPv4 address of the router.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv6` {#opt-services.tayga.ipv6}

IPv6-specific configuration.

*Type:* submodule

*Example:*

``` nix
{
  address = "2001:db8::1";
  router = {
    address = "64:ff9b::1";
  };
  pool = {
    address = "64:ff9b::";
    prefixLength = 96;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv6.address` {#opt-services.tayga.ipv6.address}

The source IPv6 address of the TAYGA server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv6.pool` {#opt-services.tayga.ipv6.pool}

The pool of IPv6 addresses which are used for translation.

*Type:* null or (submodule)

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv6.pool.address` {#opt-services.tayga.ipv6.pool.address}

IPv6 address.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv6.pool.prefixLength` {#opt-services.tayga.ipv6.pool.prefixLength}

Subnet mask of the interface, specified as the number of
bits in the prefix ("64").

*Type:* integer between 0 and 128 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.ipv6.router.address` {#opt-services.tayga.ipv6.router.address}

The IPv6 address of the router.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.log` {#opt-services.tayga.log}

Packet errors to log (drop, reject, icmp, self)

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "drop" "reject" "icmp" "self" ]
```

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.mappings` {#opt-services.tayga.mappings}

Static IPv4 -\> IPv6 host mappings.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  "192.168.5.42" = "2001:db8:1:4444::1";
  "192.168.5.43" = "2001:db8:1:4444::2";
  "192.168.255.2" = "2001:db8:1:569::143";
}
```

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.package` {#opt-services.tayga.package}

The tayga package to use.

*Type:* package

*Default:* `pkgs.tayga`

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.tunDevice` {#opt-services.tayga.tunDevice}

Name of the nat64 tun device.

*Type:* string

*Default:* `"nat64"`

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tayga.wkpfStrict` {#opt-services.tayga.wkpfStrict}

Enable restrictions on the use of the well-known prefix (64:ff9b::/96) - prevents translation of non-global IPv4 ranges when using the well-known prefix. Must be enabled for RFC 6052 compatibility.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/tayga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tayga.nix)

## `services.tcsd.conformanceCred` {#opt-services.tcsd.conformanceCred}

Path to the conformance credential for your TPM.
See also the platformCred option

*Type:* absolute path

*Default:* `"${config.services.tcsd.stateDir}/conformance.cert"`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tcsd.enable` {#opt-services.tcsd.enable}

Whether to enable tcsd, a Trusted Computing management service
that provides TCG Software Stack (TSS).  The tcsd daemon is
the only portal to the Trusted Platform Module (TPM), a hardware
chip on the motherboard.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tcsd.endorsementCred` {#opt-services.tcsd.endorsementCred}

Path to the endorsement credential for your TPM.
See also the platformCred option

*Type:* absolute path

*Default:* `"${config.services.tcsd.stateDir}/endorsement.cert"`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tcsd.firmwarePCRs` {#opt-services.tcsd.firmwarePCRs}

PCR indices used in the TPM for firmware measurements.

*Type:* string

*Default:* `"0,1,2,3,4,5,6,7"`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tcsd.group` {#opt-services.tcsd.group}

Group account under which tcsd runs.

*Type:* string

*Default:* `"tss"`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tcsd.kernelPCRs` {#opt-services.tcsd.kernelPCRs}

PCR indices used in the TPM for kernel measurements.

*Type:* string

*Default:* `"8,9,10,11,12"`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tcsd.platformCred` {#opt-services.tcsd.platformCred}

Path to the platform credential for your TPM. Your TPM
manufacturer may have provided you with a set of credentials
(certificates) that should be used when creating identities
using your TPM. When a user of your TPM makes an identity,
this credential will be encrypted as part of that process.
See the 1.1b TPM Main specification section 9.3 for information
on this process.

*Type:* absolute path

*Default:* `"${config.services.tcsd.stateDir}/platform.cert"`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tcsd.stateDir` {#opt-services.tcsd.stateDir}

The location of the system persistent storage file.
The system persistent storage file holds keys and data across
restarts of the TCSD and system reboots.

*Type:* absolute path

*Default:* `"/var/lib/tpm"`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tcsd.user` {#opt-services.tcsd.user}

User account under which tcsd runs.

*Type:* string

*Default:* `"tss"`

*Declared by:* [`nixos/modules/services/hardware/tcsd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tcsd.nix)

## `services.tdarr.dataDir` {#opt-services.tdarr.dataDir}

Base directory for Tdarr data.

*Type:* absolute path

*Default:* `"/var/lib/tdarr"`

*Declared by:* [`nixos/modules/services/misc/tdarr`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr)

## `services.tdarr.enable` {#opt-services.tdarr.enable}

Whether to enable Tdarr. This is a convenience option that enables both
the server and all configured nodes. For more granular control, use
[`services.tdarr.server.enable`](#opt-services.tdarr.server.enable) and configure nodes individually.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tdarr`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr)

## `services.tdarr.group` {#opt-services.tdarr.group}

Group under which Tdarr runs.

*Type:* string

*Default:* `"tdarr"`

*Declared by:* [`nixos/modules/services/misc/tdarr`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr)

## `services.tdarr.libraryDir` {#opt-services.tdarr.libraryDir}

Additional directories where your media library is stored

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/mnt/library1"
  "/mnt/library2"
]
```

*Declared by:* [`nixos/modules/services/misc/tdarr`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr)

## `services.tdarr.nodes` {#opt-services.tdarr.nodes}

Attribute set of Tdarr processing nodes to run on this machine.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.cronPluginUpdate` {#opt-services.tdarr.nodes._name_.cronPluginUpdate}

Cron expression for automatic plugin updates. Empty string disables.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.dataDir` {#opt-services.tdarr.nodes._name_.dataDir}

Data directory for this node.

*Type:* absolute path

*Default:* `"${config.services.tdarr.dataDir}/nodes/${name}"`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.enable` {#opt-services.tdarr.nodes._name_.enable}

Whether to enable this Tdarr node.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.environmentFile` {#opt-services.tdarr.nodes._name_.environmentFile}

File containing environment variable overrides for this node,
in the format accepted by systemd's `EnvironmentFile`.

Useful for passing secrets like `apiKey` without putting them
in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/tdarr-node-env"`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.maxLogSizeMB` {#opt-services.tdarr.nodes._name_.maxLogSizeMB}

Maximum log file size in megabytes.

*Type:* unsigned integer, meaning \>=0

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.name` {#opt-services.tdarr.nodes._name_.name}

Display name for this node in the Tdarr web UI.

*Type:* string

*Default:* `"${config.networking.hostName}-${name}"`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.package` {#opt-services.tdarr.nodes._name_.package}

Package to use for this Tdarr node.

*Type:* package

*Default:* `config.services.tdarr.package.node`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.pathTranslators` {#opt-services.tdarr.nodes._name_.pathTranslators}

Path translations between server and node for cross-platform or
cross-mount-point file access.

These are written to the node config JSON file because tdarr does
not support setting `pathTranslators` via environment variables.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  { server = "/media"; node = "/mnt/media"; }
  { server = "/cache"; node = "/mnt/cache"; }
]
```

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.pathTranslators.*.node` {#opt-services.tdarr.nodes._name_.pathTranslators._.node}

Node-side path for path translation.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.pathTranslators.*.server` {#opt-services.tdarr.nodes._name_.pathTranslators._.server}

Server-side path for path translation.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.pollInterval` {#opt-services.tdarr.nodes._name_.pollInterval}

How often the node checks the server for work, in milliseconds.

*Type:* unsigned integer, meaning \>=0

*Default:* `2000`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.priority` {#opt-services.tdarr.nodes._name_.priority}

Node priority for job assignment.

`-1` means no priority. `0` is the highest priority, `1` is next, and so on.

*Type:* signed integer

*Default:* `-1`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.serverIP` {#opt-services.tdarr.nodes._name_.serverIP}

IP address of the Tdarr server.

Although deprecated in favour of
[`services.tdarr.nodes.<name>.serverURL`](#opt-services.tdarr.nodes._name_.serverURL), the node
binary still reads this field for internal API calls such as
`/api/v2/update-node`.  Without it the node falls back to the
compiled-in default of `0.0.0.0` and cannot reach the server.

Set this to the same host as `serverURL`.  For a remote
server this should be the server's IP address, e.g.
`"192.168.1.100"`.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"192.168.1.100"`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.serverPort` {#opt-services.tdarr.nodes._name_.serverPort}

Port of the Tdarr server API.

Although deprecated in favour of
[`services.tdarr.nodes.<name>.serverURL`](#opt-services.tdarr.nodes._name_.serverURL), the node
binary still reads this field for internal API calls.  Must
match the port in `serverURL` and the server's
[`services.tdarr.server.serverPort`](#opt-services.tdarr.server.serverPort).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `config.services.tdarr.server.serverPort`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.serverURL` {#opt-services.tdarr.nodes._name_.serverURL}

Full URL of the Tdarr server this node connects to.

This is the recommended way to specify the server location.
When running a local server, the default value is correct.
For a remote server set this to e.g. `"http://192.168.1.100:8266"`.

*Type:* string

*Default:* `"http://127.0.0.1:${toString config.services.tdarr.server.serverPort}"`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.startPaused` {#opt-services.tdarr.nodes._name_.startPaused}

Whether the node starts in a paused state.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.type` {#opt-services.tdarr.nodes._name_.type}

Node type.

- `mapped`: Node accesses files directly from the library paths.
- `unmapped`: Node receives files over the network API.

*Type:* one of "mapped", "unmapped"

*Default:* `"mapped"`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.workers.healthcheckCPU` {#opt-services.tdarr.nodes._name_.workers.healthcheckCPU}

Number of CPU healthcheck workers. Can be overridden in the web UI.

*Type:* unsigned integer, meaning \>=0

*Default:* `1`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.workers.healthcheckGPU` {#opt-services.tdarr.nodes._name_.workers.healthcheckGPU}

Number of GPU healthcheck workers. Can be overridden in the web UI.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.workers.transcodeCPU` {#opt-services.tdarr.nodes._name_.workers.transcodeCPU}

Number of CPU transcode workers. Can be overridden in the web UI.

*Type:* unsigned integer, meaning \>=0

*Default:* `2`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.nodes.<name>.workers.transcodeGPU` {#opt-services.tdarr.nodes._name_.workers.transcodeGPU}

Number of GPU transcode workers. Can be overridden in the web UI.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/misc/tdarr/node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/node.nix)

## `services.tdarr.package` {#opt-services.tdarr.package}

The tdarr package to use.

*Type:* package

*Default:* `pkgs.tdarr`

*Declared by:* [`nixos/modules/services/misc/tdarr`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr)

## `services.tdarr.server.auth.enable` {#opt-services.tdarr.server.auth.enable}

Whether to enable authentication for the Tdarr web UI and API.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.cronPluginUpdate` {#opt-services.tdarr.server.cronPluginUpdate}

Cron expression for automatic plugin updates. Empty string disables.

*Type:* string

*Default:* `""`

*Example:* `"0 2 * * *"`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.enable` {#opt-services.tdarr.server.enable}

Whether to enable Tdarr server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.environmentFile` {#opt-services.tdarr.server.environmentFile}

File containing environment variable overrides for the server,
in the format accepted by systemd's `EnvironmentFile`.

Useful for setting secrets such as `authSecretKey` or `seededApiKey`
without exposing them in the Nix store.

Example file contents:

```
authSecretKey=your-secret-key
seededApiKey=tapi_your_api_key_here
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/tdarr-server-env"`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.maxLogSizeMB` {#opt-services.tdarr.server.maxLogSizeMB}

Maximum log file size in megabytes.

*Type:* unsigned integer, meaning \>=0

*Default:* `10`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.openFirewall` {#opt-services.tdarr.server.openFirewall}

Whether to open the firewall for the Tdarr server web UI and API ports.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.package` {#opt-services.tdarr.server.package}

Package to use for the Tdarr server.

*Type:* package

*Default:* `config.services.tdarr.package.server`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.serverBindIP` {#opt-services.tdarr.server.serverBindIP}

Whether to bind to the specific IP in [`services.tdarr.server.serverIP`](#opt-services.tdarr.server.serverIP).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.serverDualStack` {#opt-services.tdarr.server.serverDualStack}

Enable dual-stack (IPv4/IPv6) networking.

When enabled, the server binds to `::` if IPv6 is available, accepting both
IPv4 and IPv6 connections. Useful in Kubernetes and other modern networking setups.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.serverIP` {#opt-services.tdarr.server.serverIP}

IP address the server binds to.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.serverPort` {#opt-services.tdarr.server.serverPort}

Port for server API communication.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8266`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.server.webUIPort` {#opt-services.tdarr.server.webUIPort}

Port for the Tdarr web UI.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8265`

*Declared by:* [`nixos/modules/services/misc/tdarr/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr/server.nix)

## `services.tdarr.user` {#opt-services.tdarr.user}

User account under which Tdarr runs.

*Type:* string

*Default:* `"tdarr"`

*Declared by:* [`nixos/modules/services/misc/tdarr`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tdarr)

## `services.teamspeak3.dataDir` {#opt-services.teamspeak3.dataDir}

Directory to store TS3 database and other state/data files.

*Type:* absolute path

*Default:* `"/var/lib/teamspeak3-server"`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.defaultVoicePort` {#opt-services.teamspeak3.defaultVoicePort}

Default UDP port for clients to connect to virtual servers - used for first virtual server, subsequent ones will open on incrementing port numbers by default.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9987`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.enable` {#opt-services.teamspeak3.enable}

Whether to run the Teamspeak3 voice communication server daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.fileTransferIP` {#opt-services.teamspeak3.fileTransferIP}

IP on which the server instance will listen for incoming file transfer connections. Defaults to any IP.

*Type:* null or string

*Default:* `null`

*Example:* `"[::]"`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.fileTransferPort` {#opt-services.teamspeak3.fileTransferPort}

TCP port opened for file transfers.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `30033`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.logPath` {#opt-services.teamspeak3.logPath}

Directory to store log files in.

*Type:* absolute path

*Default:* `"/var/log/teamspeak3-server/"`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.openFirewall` {#opt-services.teamspeak3.openFirewall}

Open ports in the firewall for the TeamSpeak3 server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.openFirewallServerQuery` {#opt-services.teamspeak3.openFirewallServerQuery}

Open ports in the firewall for the TeamSpeak3 serverquery (administration) system. Requires openFirewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.queryHttpPort` {#opt-services.teamspeak3.queryHttpPort}

TCP port opened for ServerQuery connections using the HTTP protocol.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10080`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.queryIP` {#opt-services.teamspeak3.queryIP}

IP on which the server instance will listen for incoming ServerQuery connections. Defaults to any IP.

*Type:* null or string

*Default:* `null`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.queryPort` {#opt-services.teamspeak3.queryPort}

TCP port opened for ServerQuery connections using the raw telnet protocol.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10011`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.querySshPort` {#opt-services.teamspeak3.querySshPort}

TCP port opened for ServerQuery connections using the SSH protocol.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10022`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamspeak3.voiceIP` {#opt-services.teamspeak3.voiceIP}

IP on which the server instance will listen for incoming voice connections. Defaults to any IP.

*Type:* null or string

*Default:* `null`

*Example:* `"[::]"`

*Declared by:* [`nixos/modules/services/networking/teamspeak3.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teamspeak3.nix)

## `services.teamviewer.enable` {#opt-services.teamviewer.enable}

Whether to enable TeamViewer daemon & system package.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/teamviewer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/teamviewer.nix)

## `services.teamviewer.package` {#opt-services.teamviewer.package}

The teamviewer package to use.

*Type:* package

*Default:* `pkgs.teamviewer`

*Declared by:* [`nixos/modules/services/monitoring/teamviewer.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/teamviewer.nix)

## `services.technitium-dns-server.enable` {#opt-services.technitium-dns-server.enable}

Whether to enable Technitium DNS Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/technitium-dns-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/technitium-dns-server.nix)

## `services.technitium-dns-server.firewallTCPPorts` {#opt-services.technitium-dns-server.firewallTCPPorts}

List of TCP ports to open in firewall.
You might want to open ports 443 and 853 if you intend to use DNS over HTTPS or DNS over TLS.

*Type:* list of signed integer

*Default:*

``` nix
[
  53
  5380
  53443
]
```

*Declared by:* [`nixos/modules/services/networking/technitium-dns-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/technitium-dns-server.nix)

## `services.technitium-dns-server.firewallUDPPorts` {#opt-services.technitium-dns-server.firewallUDPPorts}

List of UDP ports to open in firewall.

*Type:* list of signed integer

*Default:*

``` nix
[
  53
]
```

*Declared by:* [`nixos/modules/services/networking/technitium-dns-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/technitium-dns-server.nix)

## `services.technitium-dns-server.openFirewall` {#opt-services.technitium-dns-server.openFirewall}

Whether to open ports in the firewall.
Standard ports are 53 (UDP and TCP, for DNS), 5380 and 53443 (TCP, HTTP and HTTPS for web interface).
Specify different or additional ports in options firewallUDPPorts and firewallTCPPorts if necessary.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/technitium-dns-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/technitium-dns-server.nix)

## `services.technitium-dns-server.package` {#opt-services.technitium-dns-server.package}

The technitium-dns-server package to use.

*Type:* package

*Default:* `pkgs.technitium-dns-server`

*Declared by:* [`nixos/modules/services/networking/technitium-dns-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/technitium-dns-server.nix)

## `services.tee-supplicant.enable` {#opt-services.tee-supplicant.enable}

Whether to enable OP-TEE userspace supplicant.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tee-supplicant`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tee-supplicant)

## `services.tee-supplicant.package` {#opt-services.tee-supplicant.package}

The optee-client package to use.

*Type:* package

*Default:* `pkgs.optee-client`

*Declared by:* [`nixos/modules/services/misc/tee-supplicant`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tee-supplicant)

## `services.tee-supplicant.pluginPath` {#opt-services.tee-supplicant.pluginPath}

The directory where plugins will be loaded from on startup.

*Type:* absolute path

*Default:* `"/run/current-system/sw/lib/tee-supplicant/plugins"`

*Declared by:* [`nixos/modules/services/misc/tee-supplicant`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tee-supplicant)

## `services.tee-supplicant.reeFsParentPath` {#opt-services.tee-supplicant.reeFsParentPath}

The directory where the secure filesystem will be stored in the rich
execution environment (REE FS).

*Type:* absolute path

*Default:* `"/var/lib/tee"`

*Declared by:* [`nixos/modules/services/misc/tee-supplicant`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tee-supplicant)

## `services.tee-supplicant.trustedApplications` {#opt-services.tee-supplicant.trustedApplications}

A list of full paths to trusted applications that will be loaded at
runtime by tee-supplicant.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/tee-supplicant`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tee-supplicant)

## `services.teeworlds.enable` {#opt-services.teeworlds.enable}

Whether to enable Teeworlds Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.environmentFile` {#opt-services.teeworlds.environmentFile}

Environment file as defined in `systemd.exec(5)`.

Secrets may be passed to the service without adding them to the world-readable
Nix store, by specifying placeholder variables as the option value in Nix and
setting these variables accordingly in the environment file.

```
  # snippet of teeworlds-related config
  services.teeworlds.password = "$TEEWORLDS_PASSWORD";
```

```
  # content of the environment file
  TEEWORLDS_PASSWORD=verysecretpassword
```

Note that this file needs to be available on the host on which
`teeworlds` is running.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/teeworlds/teeworlds.env"`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.extraOptions` {#opt-services.teeworlds.extraOptions}

Extra configuration lines for the `teeworlds.cfg`. See [Teeworlds Documentation](https://www.teeworlds.com/?page=docs&wiki=server_settings).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "sv_map dm1"
  "sv_gametype dm"
]
```

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.enablePowerups` {#opt-services.teeworlds.game.enablePowerups}

Whether to allow powerups such as the ninja.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.enableReadyMode` {#opt-services.teeworlds.game.enableReadyMode}

Whether to enable "ready mode"; where players can pause/unpause the game
and start the game in warmup, using their ready state.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.enableTeamDamage` {#opt-services.teeworlds.game.enableTeamDamage}

Whether to enable team damage; whether to allow team mates to inflict damage on one another.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.enableVoteKick` {#opt-services.teeworlds.game.enableVoteKick}

Whether to enable voting to kick players.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.gameType` {#opt-services.teeworlds.game.gameType}

The game type to use on the server.

The default gametypes are `dm`, `tdm`, `ctf`, `lms`, and `lts`.

*Type:* string

*Default:* `"dm"`

*Example:* `"ctf"`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.map` {#opt-services.teeworlds.game.map}

The map to use on the server.

*Type:* string

*Default:* `"dm1"`

*Example:* `"ctf5"`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.playerSlots` {#opt-services.teeworlds.game.playerSlots}

The amount of slots to reserve for players (as opposed to spectators).

*Type:* unsigned integer, meaning \>=0

*Default:* `8`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.restrictSpectators` {#opt-services.teeworlds.game.restrictSpectators}

Whether to restrict access to information such as health, ammo and armour in spectator mode.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.scoreLimit` {#opt-services.teeworlds.game.scoreLimit}

The score limit needed to win a round.

*Type:* unsigned integer, meaning \>=0

*Default:* `20`

*Example:* `400`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.swapTeams` {#opt-services.teeworlds.game.swapTeams}

Whether to swap teams each round.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.timeLimit` {#opt-services.teeworlds.game.timeLimit}

Time limit of the game. In cases of equal points, there will be sudden death.
Setting this to 0 disables a time limit.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.tournamentMode` {#opt-services.teeworlds.game.tournamentMode}

Whether to enable tournament mode. In tournament mode, players join as spectators.
If this is set to `restrictSpectators`, tournament mode is enabled but spectator chat is restricted.

*Type:* one of "disable", "enable", "restrictSpectators"

*Default:* `"disable"`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.voteKickBanTime` {#opt-services.teeworlds.game.voteKickBanTime}

The amount of minutes that a player is banned for if they get kicked by a vote.

*Type:* unsigned integer, meaning \>=0

*Default:* `5`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.game.voteKickMinimumPlayers` {#opt-services.teeworlds.game.voteKickMinimumPlayers}

The minimum amount of players required to start a kick vote.

*Type:* unsigned integer, meaning \>=0

*Default:* `5`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.motd` {#opt-services.teeworlds.motd}

The server's message of the day text.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.name` {#opt-services.teeworlds.name}

Name of the server.

*Type:* string

*Default:* `"unnamed server"`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.openPorts` {#opt-services.teeworlds.openPorts}

Whether to open firewall ports for Teeworlds.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.package` {#opt-services.teeworlds.package}

The teeworlds-server package to use.

*Type:* package

*Default:* `pkgs.teeworlds-server`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.password` {#opt-services.teeworlds.password}

Password to connect to the server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.port` {#opt-services.teeworlds.port}

Port the server will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8303`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.rconPassword` {#opt-services.teeworlds.rconPassword}

Password to access the remote console. If not set, a randomly generated one is displayed in the server log.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.register` {#opt-services.teeworlds.register}

Whether the server registers as a public server in the global server list. This is disabled by default for privacy reasons.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.bindAddr` {#opt-services.teeworlds.server.bindAddr}

The address the server will bind to.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.enableHighBandwidth` {#opt-services.teeworlds.server.enableHighBandwidth}

Whether to enable high bandwidth mode on LAN servers. This will double the amount of bandwidth required for running the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.enableSpamProtection` {#opt-services.teeworlds.server.enableSpamProtection}

Whether to enable chat spam protection.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.hostName` {#opt-services.teeworlds.server.hostName}

Hostname for the server.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.inactivePenalty` {#opt-services.teeworlds.server.inactivePenalty}

Specify what to do when a client goes inactive (see [services (T)](#opt-services.teeworlds.server.inactiveTime)).

- `spectator`: send the client into spectator mode

- `spectator/kick`: send the client into a free spectator slot, otherwise kick the client

- `kick`: kick the client

*Type:* one of "spectator", "spectator/kick", "kick"

*Default:* `"spectator/kick"`

*Example:* `"spectator"`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.inactiveTime` {#opt-services.teeworlds.server.inactiveTime}

The amount of minutes a client has to idle before it is considered inactive.

*Type:* unsigned integer, meaning \>=0

*Default:* `3`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.kickInactiveSpectators` {#opt-services.teeworlds.server.kickInactiveSpectators}

Whether to kick inactive spectators.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.maxClients` {#opt-services.teeworlds.server.maxClients}

The maximum amount of clients that can be connected to the server at the same time.

*Type:* unsigned integer, meaning \>=0

*Default:* `12`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.maxClientsPerIP` {#opt-services.teeworlds.server.maxClientsPerIP}

The maximum amount of clients with the same IP address that can be connected to the server at the same time.

*Type:* unsigned integer, meaning \>=0

*Default:* `12`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.teeworlds.server.skillLevel` {#opt-services.teeworlds.server.skillLevel}

The skill level shown in the server browser.

*Type:* one of "casual", "normal", "competitive"

*Default:* `"normal"`

*Declared by:* [`nixos/modules/services/games/teeworlds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/teeworlds.nix)

## `services.telegraf.enable` {#opt-services.telegraf.enable}

Whether to enable telegraf server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/telegraf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/telegraf.nix)

## `services.telegraf.environmentFiles` {#opt-services.telegraf.environmentFiles}

File to load as environment file. Environment variables from this file
will be interpolated into the config file using envsubst with this
syntax: `$ENVIRONMENT` or `${VARIABLE}`.
This is useful to avoid putting secrets into the nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/keys/telegraf.env"
]
```

*Declared by:* [`nixos/modules/services/monitoring/telegraf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/telegraf.nix)

## `services.telegraf.extraConfig` {#opt-services.telegraf.extraConfig}

Extra configuration options for telegraf

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  inputs = {
    statsd = {
      delete_timings = true;
      service_address = ":8125";
    };
  };
  outputs = {
    influxdb = {
      database = "telegraf";
      urls = [
        "http://localhost:8086"
      ];
    };
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/telegraf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/telegraf.nix)

## `services.telegraf.package` {#opt-services.telegraf.package}

The telegraf package to use.

*Type:* package

*Default:* `pkgs.telegraf`

*Declared by:* [`nixos/modules/services/monitoring/telegraf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/telegraf.nix)

## `services.telepathy.enable` {#opt-services.telepathy.enable}

Whether to enable Telepathy service, a communications framework
that enables real-time communication via pluggable protocol backends.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/desktops/telepathy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/telepathy.nix)

## `services.teleport.diag.addr` {#opt-services.teleport.diag.addr}

Metrics and diagnostics address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/teleport.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teleport.nix)

## `services.teleport.diag.enable` {#opt-services.teleport.diag.enable}

Whether to enable endpoints for monitoring purposes.

See [https://goteleport.com/docs/setup/admin/troubleshooting/#troubleshooting/](https://goteleport.com/docs/setup/admin/troubleshooting/#troubleshooting/)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/teleport.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teleport.nix)

## `services.teleport.diag.port` {#opt-services.teleport.diag.port}

Metrics and diagnostics port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/networking/teleport.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teleport.nix)

## `services.teleport.enable` {#opt-services.teleport.enable}

Whether to enable the Teleport service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/teleport.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teleport.nix)

## `services.teleport.insecure.enable` {#opt-services.teleport.insecure.enable}

Whether to enable starting teleport in insecure mode.

This is dangerous!
Sensitive information will be logged to console and certificates will not be verified.
Proceed with caution!

Teleport starts with disabled certificate validation on Proxy Service, validation still occurs on Auth Service
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/teleport.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teleport.nix)

## `services.teleport.package` {#opt-services.teleport.package}

The teleport package to use.

*Type:* package

*Default:* `pkgs.teleport`

*Example:* `teleport_11`

*Declared by:* [`nixos/modules/services/networking/teleport.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teleport.nix)

## `services.teleport.settings` {#opt-services.teleport.settings}

Contents of the `teleport.yaml` config file.
The `--config` arguments will only be passed if this set is not empty.

See [https://goteleport.com/docs/setup/reference/config/](https://goteleport.com/docs/setup/reference/config/).

*Type:* YAML 1.1 value

*Default:* `{ }`

*Example:*

``` nix
{
  teleport = {
    nodename = "client";
    advertise_ip = "192.168.1.2";
    auth_token = "60bdc117-8ff4-478d-95e4-9914597847eb";
    auth_servers = [ "192.168.1.1:3025" ];
    log.severity = "DEBUG";
  };
  ssh_service = {
    enabled = true;
    labels = {
      role = "client";
    };
  };
  proxy_service.enabled = false;
  auth_service.enabled = false;
}
```

*Declared by:* [`nixos/modules/services/networking/teleport.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/teleport.nix)

## `services.tempo.configFile` {#opt-services.tempo.configFile}

Specify a path to a configuration file that Tempo should use.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/tracing/tempo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/tracing/tempo.nix)

## `services.tempo.enable` {#opt-services.tempo.enable}

Whether to enable Grafana Tempo.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/tracing/tempo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/tracing/tempo.nix)

## `services.tempo.extraFlags` {#opt-services.tempo.extraFlags}

Additional flags to pass to the `ExecStart=` in `tempo.service`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "-config.expand-env=true" ]
```

*Declared by:* [`nixos/modules/services/tracing/tempo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/tracing/tempo.nix)

## `services.tempo.settings` {#opt-services.tempo.settings}

Specify the configuration for Tempo in Nix.

See [https://grafana.com/docs/tempo/latest/configuration/](https://grafana.com/docs/tempo/latest/configuration/) for available options.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/tracing/tempo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/tracing/tempo.nix)

## `services.temporal.dataDir` {#opt-services.temporal.dataDir}

Data directory for Temporal. If you change this, you need to
manually create the directory. You also need to create the
`temporal` user and group, or change
[services (T)](#opt-services.temporal.user) and
[services (T)](#opt-services.temporal.group) to existing ones with
access to the directory.

*Type:* absolute path

*Default:* `"/var/lib/temporal"`

*Declared by:* [`nixos/modules/services/cluster/temporal/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/temporal/default.nix)

## `services.temporal.enable` {#opt-services.temporal.enable}

Whether to enable Temporal.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/temporal/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/temporal/default.nix)

## `services.temporal.group` {#opt-services.temporal.group}

The group temporal runs as. Should be left at default unless
you have very specific needs.

*Type:* string

*Default:* `"temporal"`

*Declared by:* [`nixos/modules/services/cluster/temporal/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/temporal/default.nix)

## `services.temporal.package` {#opt-services.temporal.package}

The Temporal package to use.

*Type:* package

*Default:* `pkgs.temporal`

*Declared by:* [`nixos/modules/services/cluster/temporal/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/temporal/default.nix)

## `services.temporal.restartIfChanged` {#opt-services.temporal.restartIfChanged}

Automatically restart the service on config change.
This can be set to false to defer restarts on a server or cluster.
Please consider the security implications of inadvertently running an older version,
and the possibility of unexpected behavior caused by inconsistent versions across a cluster when disabling this option.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/temporal/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/temporal/default.nix)

## `services.temporal.settings` {#opt-services.temporal.settings}

Temporal configuration.

See [https://docs.temporal.io/references/configuration](https://docs.temporal.io/references/configuration) for more
information about Temporal configuration options

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/cluster/temporal/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/temporal/default.nix)

## `services.temporal.user` {#opt-services.temporal.user}

The user Temporal runs as. Should be left at default unless
you have very specific needs.

*Type:* string

*Default:* `"temporal"`

*Declared by:* [`nixos/modules/services/cluster/temporal/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/temporal/default.nix)

## `services.terraria.autoCreatedWorldSize` {#opt-services.terraria.autoCreatedWorldSize}

Specifies the size of the auto-created world if `worldPath` does not
point to an existing world.

*Type:* one of "small", "medium", "large"

*Default:* `"medium"`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.banListPath` {#opt-services.terraria.banListPath}

The path to the ban list.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.dataDir` {#opt-services.terraria.dataDir}

Path to variable state data directory for terraria.

*Type:* string

*Default:* `"/var/lib/terraria"`

*Example:* `"/srv/terraria"`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.enable` {#opt-services.terraria.enable}

If enabled, starts a Terraria server. The server can be connected to via `tmux -S ${config.services.terraria.dataDir}/terraria.sock attach`
for administration by users who are a part of the `terraria` group (use `C-b d` shortcut to detach again).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.maxPlayers` {#opt-services.terraria.maxPlayers}

Sets the max number of players (between 1 and 255).

*Type:* 8 bit unsigned integer; between 0 and 255 (both inclusive)

*Default:* `255`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.messageOfTheDay` {#opt-services.terraria.messageOfTheDay}

Set the server message of the day text.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.noUPnP` {#opt-services.terraria.noUPnP}

Disables automatic Universal Plug and Play.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.openFirewall` {#opt-services.terraria.openFirewall}

Whether to open ports in the firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.package` {#opt-services.terraria.package}

The terraria package to use.

*Type:* package

*Default:* `pkgs.terraria-server`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.password` {#opt-services.terraria.password}

Sets the server password. Leave `null` for no password.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.port` {#opt-services.terraria.port}

Specifies the port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7777`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.secure` {#opt-services.terraria.secure}

Adds additional cheat protection to the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.terraria.worldPath` {#opt-services.terraria.worldPath}

The path to the world file (`.wld`) which should be loaded.
If no world exists at this path, one will be created with the size
specified by `autoCreatedWorldSize`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/games/terraria.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/games/terraria.nix)

## `services.tetrd.enable` {#opt-services.tetrd.enable}

Whether to enable tetrd.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tetrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tetrd.nix)

## `services.tetrd.package` {#opt-services.tetrd.package}

The tetrd package to use.

*Type:* package

*Default:* `pkgs.tetrd`

*Declared by:* [`nixos/modules/services/networking/tetrd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tetrd.nix)

## `services.tftpd.enable` {#opt-services.tftpd.enable}

Whether to enable tftpd, a Trivial File Transfer Protocol server.
The server will be run as an xinetd service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tftpd.nix)

## `services.tftpd.path` {#opt-services.tftpd.path}

Where the tftp server files are stored.

*Type:* absolute path

*Default:* `"/srv/tftp"`

*Declared by:* [`nixos/modules/services/networking/tftpd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tftpd.nix)

## `services.thanos.compact.arguments` {#opt-services.thanos.compact.arguments}

Arguments to the `thanos compact` command.

Defaults to a list of arguments formed by converting the structured
options of `services.thanos.compact` to a list of arguments.

Overriding this option will cause none of the structured options to have
any effect. So only set this if you know what you're doing!

*Type:* list of string

*Default:* calculated from `config.services.thanos.compact`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.compact.concurrency` {#opt-services.thanos.compact.compact.concurrency}

Number of goroutines to use when compacting groups.

Defaults to `1` in Thanos
when set to `null`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.consistency-delay` {#opt-services.thanos.compact.consistency-delay}

Minimum age of fresh (non-compacted) blocks before they are being
processed. Malformed blocks older than the maximum of consistency-delay
and 30m0s will be removed.

Defaults to `30m` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.downsampling.disable` {#opt-services.thanos.compact.downsampling.disable}

Disables downsampling.

This is not recommended as querying long time ranges without
non-downsampled data is not efficient and useful e.g it is not possible
to render all samples for a human eye anyway

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.enable` {#opt-services.thanos.compact.enable}

Whether to enable the Thanos compactor which continuously compacts blocks in an object store bucket.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.http-address` {#opt-services.thanos.compact.http-address}

Listen `host:port` for HTTP endpoints.

Defaults to `0.0.0.0:10902` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.log.format` {#opt-services.thanos.compact.log.format}

Log format to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.log.level` {#opt-services.thanos.compact.log.level}

Log filtering level.

Defaults to `info` in Thanos
when set to `null`.

*Type:* null or one of "debug", "info", "warn", "error", "fatal"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.objstore.config` {#opt-services.thanos.compact.objstore.config}

Object store configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`objstore.config-file` will default to its path.

If `objstore.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.objstore.config-file` {#opt-services.thanos.compact.objstore.config-file}

Path to YAML file that contains object store configuration.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.objstore.config == null then null
else toString (format.generate "objstore.yaml" config.services.thanos.<cmd>.objstore.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.retention.resolution-1h` {#opt-services.thanos.compact.retention.resolution-1h}

How long to retain samples of resolution 2 (1 hour) in bucket.

`0d` - disables this retention

Defaults to `0d` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.retention.resolution-5m` {#opt-services.thanos.compact.retention.resolution-5m}

How long to retain samples of resolution 1 (5 minutes) in bucket.

`0d` - disables this retention

Defaults to `0d` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.retention.resolution-raw` {#opt-services.thanos.compact.retention.resolution-raw}

How long to retain raw samples in bucket.

`0d` - disables this retention

Defaults to `0d` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.startAt` {#opt-services.thanos.compact.startAt}

When this option is set to a `systemd.time`
specification the Thanos compactor will run at the specified period.

When this option is `null` the Thanos compactor service
will run continuously. So it will not exit after all compactions have
been processed but wait for new work.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.stateDir` {#opt-services.thanos.compact.stateDir}

Data directory relative to `/var/lib`
in which to cache blocks and process compactions.

*Type:* string

*Default:* `"thanos-compact"`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.tracing.config` {#opt-services.thanos.compact.tracing.config}

Tracing configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`tracing.config-file` will default to its path.

If `tracing.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.compact.tracing.config-file` {#opt-services.thanos.compact.tracing.config-file}

Path to YAML file that contains tracing configuration.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.tracing.config == null then null
else toString (format.generate "tracing.yaml" config.services.thanos.<cmd>.tracing.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.arguments` {#opt-services.thanos.downsample.arguments}

Arguments to the `thanos downsample` command.

Defaults to a list of arguments formed by converting the structured
options of `services.thanos.downsample` to a list of arguments.

Overriding this option will cause none of the structured options to have
any effect. So only set this if you know what you're doing!

*Type:* list of string

*Default:* calculated from `config.services.thanos.downsample`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.enable` {#opt-services.thanos.downsample.enable}

Whether to enable the Thanos downsampler which continuously downsamples blocks in an object store bucket.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.log.format` {#opt-services.thanos.downsample.log.format}

Log format to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.log.level` {#opt-services.thanos.downsample.log.level}

Log filtering level.

Defaults to `info` in Thanos
when set to `null`.

*Type:* null or one of "debug", "info", "warn", "error", "fatal"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.objstore.config` {#opt-services.thanos.downsample.objstore.config}

Object store configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`objstore.config-file` will default to its path.

If `objstore.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.objstore.config-file` {#opt-services.thanos.downsample.objstore.config-file}

Path to YAML file that contains object store configuration.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.objstore.config == null then null
else toString (format.generate "objstore.yaml" config.services.thanos.<cmd>.objstore.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.stateDir` {#opt-services.thanos.downsample.stateDir}

Data directory relative to `/var/lib`
in which to cache blocks and process downsamplings.

*Type:* string

*Default:* `"thanos-downsample"`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.tracing.config` {#opt-services.thanos.downsample.tracing.config}

Tracing configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`tracing.config-file` will default to its path.

If `tracing.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.downsample.tracing.config-file` {#opt-services.thanos.downsample.tracing.config-file}

Path to YAML file that contains tracing configuration.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.tracing.config == null then null
else toString (format.generate "tracing.yaml" config.services.thanos.<cmd>.tracing.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.package` {#opt-services.thanos.package}

The thanos package to use.

*Type:* package

*Default:* `pkgs.thanos`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.arguments` {#opt-services.thanos.query-frontend.arguments}

Arguments to the `thanos query-frontend` command.

Defaults to a list of arguments formed by converting the structured
options of `services.thanos.query-frontend` to a list of arguments.

Overriding this option will cause none of the structured options to have
any effect. So only set this if you know what you're doing!

*Type:* list of string

*Default:* calculated from `config.services.thanos.query-frontend`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.enable` {#opt-services.thanos.query-frontend.enable}

Whether to enable the Thanos query frontend implements a service deployed in front of queriers to
improve query parallelization and caching..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.grpc-address` {#opt-services.thanos.query-frontend.grpc-address}

Listen `ip:port` address for gRPC endpoints (StoreAPI).

Make sure this address is routable from other components.

Defaults to `0.0.0.0:10901` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.grpc-server-tls-cert` {#opt-services.thanos.query-frontend.grpc-server-tls-cert}

TLS Certificate for gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.grpc-server-tls-client-ca` {#opt-services.thanos.query-frontend.grpc-server-tls-client-ca}

TLS CA to verify clients against.

If no client CA is specified, there is no client verification on server side.
(tls.NoClientCert)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.grpc-server-tls-key` {#opt-services.thanos.query-frontend.grpc-server-tls-key}

TLS Key for the gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.http-address` {#opt-services.thanos.query-frontend.http-address}

Listen `host:port` for HTTP endpoints.

Defaults to `0.0.0.0:10902` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.log.format` {#opt-services.thanos.query-frontend.log.format}

Log format to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.log.level` {#opt-services.thanos.query-frontend.log.level}

Log filtering level.

Defaults to `info` in Thanos
when set to `null`.

*Type:* null or one of "debug", "info", "warn", "error", "fatal"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.query-frontend.downstream-url` {#opt-services.thanos.query-frontend.query-frontend.downstream-url}

URL of downstream Prometheus Query compatible API.

Defaults to `http://localhost:9090` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.tracing.config` {#opt-services.thanos.query-frontend.tracing.config}

Tracing configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`tracing.config-file` will default to its path.

If `tracing.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query-frontend.tracing.config-file` {#opt-services.thanos.query-frontend.tracing.config-file}

Path to YAML file that contains tracing configuration.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.tracing.config == null then null
else toString (format.generate "tracing.yaml" config.services.thanos.<cmd>.tracing.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.arguments` {#opt-services.thanos.query.arguments}

Arguments to the `thanos query` command.

Defaults to a list of arguments formed by converting the structured
options of `services.thanos.query` to a list of arguments.

Overriding this option will cause none of the structured options to have
any effect. So only set this if you know what you're doing!

*Type:* list of string

*Default:* calculated from `config.services.thanos.query`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.enable` {#opt-services.thanos.query.enable}

Whether to enable the Thanos query node exposing PromQL enabled Query API with data retrieved from multiple store nodes.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.endpoints` {#opt-services.thanos.query.endpoints}

Addresses of statically configured Thanos API servers (repeatable).

The scheme may be prefixed with 'dns+' or 'dnssrv+' to detect
Thanos API servers through respective DNS lookups.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-address` {#opt-services.thanos.query.grpc-address}

Listen `ip:port` address for gRPC endpoints (StoreAPI).

Make sure this address is routable from other components.

Defaults to `0.0.0.0:10901` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-client-server-name` {#opt-services.thanos.query.grpc-client-server-name}

Server name to verify the hostname on the returned gRPC certificates.
See [https://tools.ietf.org/html/rfc4366#section-3.1](https://tools.ietf.org/html/rfc4366#section-3.1)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-client-tls-ca` {#opt-services.thanos.query.grpc-client-tls-ca}

TLS CA Certificates to use to verify gRPC servers

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-client-tls-cert` {#opt-services.thanos.query.grpc-client-tls-cert}

TLS Certificates to use to identify this client to the server

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-client-tls-key` {#opt-services.thanos.query.grpc-client-tls-key}

TLS Key for the client's certificate

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-client-tls-secure` {#opt-services.thanos.query.grpc-client-tls-secure}

Use TLS when talking to the gRPC server

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-compression` {#opt-services.thanos.query.grpc-compression}

Compression algorithm to use for gRPC requests to other clients.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-server-tls-cert` {#opt-services.thanos.query.grpc-server-tls-cert}

TLS Certificate for gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-server-tls-client-ca` {#opt-services.thanos.query.grpc-server-tls-client-ca}

TLS CA to verify clients against.

If no client CA is specified, there is no client verification on server side.
(tls.NoClientCert)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.grpc-server-tls-key` {#opt-services.thanos.query.grpc-server-tls-key}

TLS Key for the gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.http-address` {#opt-services.thanos.query.http-address}

Listen `host:port` for HTTP endpoints.

Defaults to `0.0.0.0:10902` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.log.format` {#opt-services.thanos.query.log.format}

Log format to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.log.level` {#opt-services.thanos.query.log.level}

Log filtering level.

Defaults to `info` in Thanos
when set to `null`.

*Type:* null or one of "debug", "info", "warn", "error", "fatal"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.query.auto-downsampling` {#opt-services.thanos.query.query.auto-downsampling}

Enable automatic adjustment (step / 5) to what source of data should
be used in store gateways if no
`max_source_resolution` param is specified.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.query.default-evaluation-interval` {#opt-services.thanos.query.query.default-evaluation-interval}

Set default evaluation interval for sub queries.

Defaults to `1m` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.query.max-concurrent` {#opt-services.thanos.query.query.max-concurrent}

Maximum number of queries processed concurrently by query node.

Defaults to `20` in Thanos
when set to `null`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.query.partial-response` {#opt-services.thanos.query.query.partial-response}

Enable partial response for queries if no
`partial_response` param is specified.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.query.replica-labels` {#opt-services.thanos.query.query.replica-labels}

Labels to treat as a replica indicator along which data is
deduplicated.

Still you will be able to query without deduplication using
'dedup=false' parameter. Data includes time series, recording
rules, and alerting rules.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.query.timeout` {#opt-services.thanos.query.query.timeout}

Maximum time to process query by query node.

Defaults to `2m` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.selector-labels` {#opt-services.thanos.query.selector-labels}

Query selector labels that will be exposed in info endpoint.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.store.response-timeout` {#opt-services.thanos.query.store.response-timeout}

If a Store doesn't send any data in this specified duration then a
Store will be ignored and partial data will be returned if it's
enabled. `0` disables timeout.

Defaults to `0ms` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.store.sd-dns-interval` {#opt-services.thanos.query.store.sd-dns-interval}

Interval between DNS resolutions.

Defaults to `30s` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.store.sd-files` {#opt-services.thanos.query.store.sd-files}

Path to files that contain addresses of store API servers. The path
can be a glob pattern.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.store.sd-interval` {#opt-services.thanos.query.store.sd-interval}

Refresh interval to re-read file SD files. It is used as a resync fallback.

Defaults to `5m` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.store.unhealthy-timeout` {#opt-services.thanos.query.store.unhealthy-timeout}

Timeout before an unhealthy store is cleaned from the store UI page.

Defaults to `5m` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.tracing.config` {#opt-services.thanos.query.tracing.config}

Tracing configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`tracing.config-file` will default to its path.

If `tracing.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.tracing.config-file` {#opt-services.thanos.query.tracing.config-file}

Path to YAML file that contains tracing configuration.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.tracing.config == null then null
else toString (format.generate "tracing.yaml" config.services.thanos.<cmd>.tracing.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.web.external-prefix` {#opt-services.thanos.query.web.external-prefix}

Static prefix for all HTML links and redirect URLs in the UI query web
interface.

Actual endpoints are still served on / or the
`web.route-prefix`. This allows thanos UI to be served
behind a reverse proxy that strips a URL sub-path.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.web.prefix-header` {#opt-services.thanos.query.web.prefix-header}

Name of HTTP request header used for dynamic prefixing of UI links and
redirects.

This option is ignored if the option
`web.external-prefix` is set.

Security risk: enable this option only if a reverse proxy in front of
thanos is resetting the header.

The setting `web.prefix-header="X-Forwarded-Prefix"`
can be useful, for example, if Thanos UI is served via Traefik reverse
proxy with `PathPrefixStrip` option enabled, which
sends the stripped prefix value in `X-Forwarded-Prefix`
header. This allows thanos UI to be served on a sub-path.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.query.web.route-prefix` {#opt-services.thanos.query.web.route-prefix}

Prefix for API and UI endpoints.

This allows thanos UI to be served on a sub-path. This option is
analogous to `web.route-prefix` of Promethus.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.arguments` {#opt-services.thanos.receive.arguments}

Arguments to the `thanos receive` command.

Defaults to a list of arguments formed by converting the structured
options of `services.thanos.receive` to a list of arguments.

Overriding this option will cause none of the structured options to have
any effect. So only set this if you know what you're doing!

*Type:* list of string

*Default:* calculated from `config.services.thanos.receive`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.enable` {#opt-services.thanos.receive.enable}

Whether to enable the Thanos receiver which accept Prometheus remote write API requests and write to local tsdb.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.grpc-address` {#opt-services.thanos.receive.grpc-address}

Listen `ip:port` address for gRPC endpoints (StoreAPI).

Make sure this address is routable from other components.

Defaults to `0.0.0.0:10901` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.grpc-server-tls-cert` {#opt-services.thanos.receive.grpc-server-tls-cert}

TLS Certificate for gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.grpc-server-tls-client-ca` {#opt-services.thanos.receive.grpc-server-tls-client-ca}

TLS CA to verify clients against.

If no client CA is specified, there is no client verification on server side.
(tls.NoClientCert)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.grpc-server-tls-key` {#opt-services.thanos.receive.grpc-server-tls-key}

TLS Key for the gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.http-address` {#opt-services.thanos.receive.http-address}

Listen `host:port` for HTTP endpoints.

Defaults to `0.0.0.0:10902` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.labels` {#opt-services.thanos.receive.labels}

External labels to announce.

This flag will be removed in the future when handling multiple tsdb
instances is added.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.log.format` {#opt-services.thanos.receive.log.format}

Log format to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.log.level` {#opt-services.thanos.receive.log.level}

Log filtering level.

Defaults to `info` in Thanos
when set to `null`.

*Type:* null or one of "debug", "info", "warn", "error", "fatal"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.objstore.config` {#opt-services.thanos.receive.objstore.config}

Object store configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`objstore.config-file` will default to its path.

If `objstore.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.objstore.config-file` {#opt-services.thanos.receive.objstore.config-file}

Path to YAML file that contains object store configuration.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.objstore.config == null then null
else toString (format.generate "objstore.yaml" config.services.thanos.<cmd>.objstore.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.receive.grpc-compression` {#opt-services.thanos.receive.receive.grpc-compression}

Compression algorithm to use for gRPC requests to other receivers.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.remote-write.address` {#opt-services.thanos.receive.remote-write.address}

Address to listen on for remote write requests.

Defaults to `0.0.0.0:19291` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.stateDir` {#opt-services.thanos.receive.stateDir}

Data directory relative to `/var/lib` of TSDB.

*Type:* string

*Default:* `"thanos-receive"`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.tracing.config` {#opt-services.thanos.receive.tracing.config}

Tracing configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`tracing.config-file` will default to its path.

If `tracing.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.tracing.config-file` {#opt-services.thanos.receive.tracing.config-file}

Path to YAML file that contains tracing configuration.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.tracing.config == null then null
else toString (format.generate "tracing.yaml" config.services.thanos.<cmd>.tracing.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.receive.tsdb.retention` {#opt-services.thanos.receive.tsdb.retention}

How long to retain raw samples on local storage.

`0d` - disables this retention

Defaults to `15d` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.alert.label-drop` {#opt-services.thanos.rule.alert.label-drop}

Labels by name to drop before sending to alertmanager.

This allows alert to be deduplicated on replica label.

Similar Prometheus alert relabelling

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.alert.query-url` {#opt-services.thanos.rule.alert.query-url}

The external Thanos Query URL that would be set in all alerts 'Source' field.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.alertmanagers.send-timeout` {#opt-services.thanos.rule.alertmanagers.send-timeout}

Timeout for sending alerts to alertmanager.

Defaults to `10s` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.alertmanagers.urls` {#opt-services.thanos.rule.alertmanagers.urls}

Alertmanager replica URLs to push firing alerts.

Ruler claims success if push to at least one alertmanager from
discovered succeeds. The scheme may be prefixed with
`dns+` or `dnssrv+` to detect
Alertmanager IPs through respective DNS lookups. The port defaults to
`9093` or the SRV record's value. The URL path is
used as a prefix for the regular Alertmanager API path.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.arguments` {#opt-services.thanos.rule.arguments}

Arguments to the `thanos rule` command.

Defaults to a list of arguments formed by converting the structured
options of `services.thanos.rule` to a list of arguments.

Overriding this option will cause none of the structured options to have
any effect. So only set this if you know what you're doing!

*Type:* list of string

*Default:* calculated from `config.services.thanos.rule`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.enable` {#opt-services.thanos.rule.enable}

Whether to enable the Thanos ruler service which evaluates Prometheus rules against given Query nodes, exposing Store API and storing old blocks in bucket.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.eval-interval` {#opt-services.thanos.rule.eval-interval}

The default evaluation interval to use.

Defaults to `1m` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.grpc-address` {#opt-services.thanos.rule.grpc-address}

Listen `ip:port` address for gRPC endpoints (StoreAPI).

Make sure this address is routable from other components.

Defaults to `0.0.0.0:10901` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.grpc-server-tls-cert` {#opt-services.thanos.rule.grpc-server-tls-cert}

TLS Certificate for gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.grpc-server-tls-client-ca` {#opt-services.thanos.rule.grpc-server-tls-client-ca}

TLS CA to verify clients against.

If no client CA is specified, there is no client verification on server side.
(tls.NoClientCert)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.grpc-server-tls-key` {#opt-services.thanos.rule.grpc-server-tls-key}

TLS Key for the gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.http-address` {#opt-services.thanos.rule.http-address}

Listen `host:port` for HTTP endpoints.

Defaults to `0.0.0.0:10902` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.labels` {#opt-services.thanos.rule.labels}

Labels to be applied to all generated metrics.

Similar to external labels for Prometheus,
used to identify ruler and its blocks as unique source.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.log.format` {#opt-services.thanos.rule.log.format}

Log format to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.log.level` {#opt-services.thanos.rule.log.level}

Log filtering level.

Defaults to `info` in Thanos
when set to `null`.

*Type:* null or one of "debug", "info", "warn", "error", "fatal"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.objstore.config` {#opt-services.thanos.rule.objstore.config}

Object store configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`objstore.config-file` will default to its path.

If `objstore.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.objstore.config-file` {#opt-services.thanos.rule.objstore.config-file}

Path to YAML file that contains object store configuration.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.objstore.config == null then null
else toString (format.generate "objstore.yaml" config.services.thanos.<cmd>.objstore.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.query.addresses` {#opt-services.thanos.rule.query.addresses}

Addresses of statically configured query API servers.

The scheme may be prefixed with `dns+` or
`dnssrv+` to detect query API servers through
respective DNS lookups.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.query.sd-dns-interval` {#opt-services.thanos.rule.query.sd-dns-interval}

Interval between DNS resolutions.

Defaults to `30s` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.query.sd-files` {#opt-services.thanos.rule.query.sd-files}

Path to file that contain addresses of query peers.
The path can be a glob pattern.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.query.sd-interval` {#opt-services.thanos.rule.query.sd-interval}

Refresh interval to re-read file SD files. (used as a fallback)

Defaults to `5m` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.rule-files` {#opt-services.thanos.rule.rule-files}

Rule files that should be used by rule manager. Can be in glob format.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.stateDir` {#opt-services.thanos.rule.stateDir}

Data directory relative to `/var/lib`.

*Type:* string

*Default:* `"thanos-rule"`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.tracing.config` {#opt-services.thanos.rule.tracing.config}

Tracing configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`tracing.config-file` will default to its path.

If `tracing.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.tracing.config-file` {#opt-services.thanos.rule.tracing.config-file}

Path to YAML file that contains tracing configuration.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.tracing.config == null then null
else toString (format.generate "tracing.yaml" config.services.thanos.<cmd>.tracing.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.tsdb.block-duration` {#opt-services.thanos.rule.tsdb.block-duration}

Block duration for TSDB block.

Defaults to `2h` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.tsdb.retention` {#opt-services.thanos.rule.tsdb.retention}

Block retention time on local disk.

Defaults to `48h` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.web.external-prefix` {#opt-services.thanos.rule.web.external-prefix}

Static prefix for all HTML links and redirect URLs in the UI query web
interface.

Actual endpoints are still served on / or the
`web.route-prefix`. This allows thanos UI to be served
behind a reverse proxy that strips a URL sub-path.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.web.prefix-header` {#opt-services.thanos.rule.web.prefix-header}

Name of HTTP request header used for dynamic prefixing of UI links and
redirects.

This option is ignored if the option
`web.external-prefix` is set.

Security risk: enable this option only if a reverse proxy in front of
thanos is resetting the header.

The header `X-Forwarded-Prefix` can be useful, for
example, if Thanos UI is served via Traefik reverse proxy with
`PathPrefixStrip` option enabled, which sends the
stripped prefix value in `X-Forwarded-Prefix`
header. This allows thanos UI to be served on a sub-path.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.rule.web.route-prefix` {#opt-services.thanos.rule.web.route-prefix}

Prefix for API and UI endpoints.

This allows thanos UI to be served on a sub-path.

This option is analogous to `--web.route-prefix` of Promethus.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.arguments` {#opt-services.thanos.sidecar.arguments}

Arguments to the `thanos sidecar` command.

Defaults to a list of arguments formed by converting the structured
options of `services.thanos.sidecar` to a list of arguments.

Overriding this option will cause none of the structured options to have
any effect. So only set this if you know what you're doing!

*Type:* list of string

*Default:* calculated from `config.services.thanos.sidecar`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.enable` {#opt-services.thanos.sidecar.enable}

Whether to enable the Thanos sidecar for Prometheus server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.grpc-address` {#opt-services.thanos.sidecar.grpc-address}

Listen `ip:port` address for gRPC endpoints (StoreAPI).

Make sure this address is routable from other components.

Defaults to `0.0.0.0:10901` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.grpc-server-tls-cert` {#opt-services.thanos.sidecar.grpc-server-tls-cert}

TLS Certificate for gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.grpc-server-tls-client-ca` {#opt-services.thanos.sidecar.grpc-server-tls-client-ca}

TLS CA to verify clients against.

If no client CA is specified, there is no client verification on server side.
(tls.NoClientCert)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.grpc-server-tls-key` {#opt-services.thanos.sidecar.grpc-server-tls-key}

TLS Key for the gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.http-address` {#opt-services.thanos.sidecar.http-address}

Listen `host:port` for HTTP endpoints.

Defaults to `0.0.0.0:10902` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.log.format` {#opt-services.thanos.sidecar.log.format}

Log format to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.log.level` {#opt-services.thanos.sidecar.log.level}

Log filtering level.

Defaults to `info` in Thanos
when set to `null`.

*Type:* null or one of "debug", "info", "warn", "error", "fatal"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.objstore.config` {#opt-services.thanos.sidecar.objstore.config}

Object store configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`objstore.config-file` will default to its path.

If `objstore.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.objstore.config-file` {#opt-services.thanos.sidecar.objstore.config-file}

Path to YAML file that contains object store configuration.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.objstore.config == null then null
else toString (format.generate "objstore.yaml" config.services.thanos.<cmd>.objstore.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.prometheus.url` {#opt-services.thanos.sidecar.prometheus.url}

URL at which to reach Prometheus's API.

For better performance use local network.

Defaults to `http://localhost:9090` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.reloader.config-envsubst-file` {#opt-services.thanos.sidecar.reloader.config-envsubst-file}

Output file for environment variable substituted config file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.reloader.config-file` {#opt-services.thanos.sidecar.reloader.config-file}

Config file watched by the reloader.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.reloader.rule-dirs` {#opt-services.thanos.sidecar.reloader.rule-dirs}

Rule directories for the reloader to refresh.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.tracing.config` {#opt-services.thanos.sidecar.tracing.config}

Tracing configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`tracing.config-file` will default to its path.

If `tracing.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.tracing.config-file` {#opt-services.thanos.sidecar.tracing.config-file}

Path to YAML file that contains tracing configuration.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.tracing.config == null then null
else toString (format.generate "tracing.yaml" config.services.thanos.<cmd>.tracing.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.sidecar.tsdb.path` {#opt-services.thanos.sidecar.tsdb.path}

Data directory of TSDB.

*Type:* string

*Default:* `"/var/lib/${config.services.prometheus.stateDir}/data"`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.arguments` {#opt-services.thanos.store.arguments}

Arguments to the `thanos store` command.

Defaults to a list of arguments formed by converting the structured
options of `services.thanos.store` to a list of arguments.

Overriding this option will cause none of the structured options to have
any effect. So only set this if you know what you're doing!

*Type:* list of string

*Default:* calculated from `config.services.thanos.store`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.block-sync-concurrency` {#opt-services.thanos.store.block-sync-concurrency}

Number of goroutines to use when syncing blocks from object storage.

Defaults to `20` in Thanos
when set to `null`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.chunk-pool-size` {#opt-services.thanos.store.chunk-pool-size}

Maximum size of concurrently allocatable bytes for chunks.

Defaults to `2GB` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.enable` {#opt-services.thanos.store.enable}

Whether to enable the Thanos store node giving access to blocks in a bucket provider.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.grpc-address` {#opt-services.thanos.store.grpc-address}

Listen `ip:port` address for gRPC endpoints (StoreAPI).

Make sure this address is routable from other components.

Defaults to `0.0.0.0:10901` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.grpc-server-tls-cert` {#opt-services.thanos.store.grpc-server-tls-cert}

TLS Certificate for gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.grpc-server-tls-client-ca` {#opt-services.thanos.store.grpc-server-tls-client-ca}

TLS CA to verify clients against.

If no client CA is specified, there is no client verification on server side.
(tls.NoClientCert)

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.grpc-server-tls-key` {#opt-services.thanos.store.grpc-server-tls-key}

TLS Key for the gRPC server, leave blank to disable TLS

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.http-address` {#opt-services.thanos.store.http-address}

Listen `host:port` for HTTP endpoints.

Defaults to `0.0.0.0:10902` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.index-cache-size` {#opt-services.thanos.store.index-cache-size}

Maximum size of items held in the index cache.

Defaults to `250MB` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.log.format` {#opt-services.thanos.store.log.format}

Log format to use.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.log.level` {#opt-services.thanos.store.log.level}

Log filtering level.

Defaults to `info` in Thanos
when set to `null`.

*Type:* null or one of "debug", "info", "warn", "error", "fatal"

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.max-time` {#opt-services.thanos.store.max-time}

End of time range limit to serve.

Thanos Store serves only blocks, which happened earlier than this
value. Option can be a constant time in RFC3339 format or time duration
relative to current time, such as -1d or 2h45m. Valid duration units are
ms, s, m, h, d, w, y.

Defaults to `9999-12-31T23:59:59Z` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.min-time` {#opt-services.thanos.store.min-time}

Start of time range limit to serve.

Thanos Store serves only metrics, which happened later than this
value. Option can be a constant time in RFC3339 format or time duration
relative to current time, such as -1d or 2h45m. Valid duration units are
ms, s, m, h, d, w, y.

Defaults to `0000-01-01T00:00:00Z` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.objstore.config` {#opt-services.thanos.store.objstore.config}

Object store configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`objstore.config-file` will default to its path.

If `objstore.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.objstore.config-file` {#opt-services.thanos.store.objstore.config-file}

Path to YAML file that contains object store configuration.

See format details: [https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage](https://thanos.io/tip/thanos/storage.md/#configuring-access-to-object-storage)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.objstore.config == null then null
else toString (format.generate "objstore.yaml" config.services.thanos.<cmd>.objstore.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.stateDir` {#opt-services.thanos.store.stateDir}

Data directory relative to `/var/lib`
in which to cache remote blocks.

*Type:* string

*Default:* `"thanos-store"`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.store.grpc.series-max-concurrency` {#opt-services.thanos.store.store.grpc.series-max-concurrency}

Maximum number of concurrent Series calls.

Defaults to `20` in Thanos
when set to `null`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.store.limits.request-samples` {#opt-services.thanos.store.store.limits.request-samples}

The maximum samples allowed for a single Series request.
The Series call fails if this limit is exceeded.

`0` means no limit.

NOTE: For efficiency the limit is internally implemented as 'chunks limit'
considering each chunk contains a maximum of 120 samples.

Defaults to `0` in Thanos
when set to `null`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.sync-block-duration` {#opt-services.thanos.store.sync-block-duration}

Repeat interval for syncing the blocks between local and remote view.

Defaults to `3m` in Thanos
when set to `null`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.tracing.config` {#opt-services.thanos.store.tracing.config}

Tracing configuration.

When not `null` the attribute set gets converted to
a YAML file and stored in the Nix store. The option
`tracing.config-file` will default to its path.

If `tracing.config-file` is set this option has no effect.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thanos.store.tracing.config-file` {#opt-services.thanos.store.tracing.config-file}

Path to YAML file that contains tracing configuration.

See format details: [https://thanos.io/tip/thanos/tracing.md/#configuration](https://thanos.io/tip/thanos/tracing.md/#configuration)

*Type:* null or string

*Default:*

``` nix
if config.services.thanos.<cmd>.tracing.config == null then null
else toString (format.generate "tracing.yaml" config.services.thanos.<cmd>.tracing.config);
```

*Declared by:* [`nixos/modules/services/monitoring/thanos.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/thanos.nix)

## `services.thelounge.enable` {#opt-services.thelounge.enable}

Whether to enable The Lounge web IRC client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/thelounge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/thelounge.nix)

## `services.thelounge.extraConfig` {#opt-services.thelounge.extraConfig}

The Lounge's `config.js` contents as attribute set (will be
converted to JSON to generate the configuration file).

The options defined here will be merged to the default configuration file.
Note: In case of duplicate configuration, options from `extraConfig` have priority.

Documentation: [https://thelounge.chat/docs/server/configuration](https://thelounge.chat/docs/server/configuration)

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  reverseProxy = true;
  defaults = {
    name = "Your Network";
    host = "localhost";
    port = 6697;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/thelounge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/thelounge.nix)

## `services.thelounge.package` {#opt-services.thelounge.package}

The thelounge package to use.

*Type:* package

*Default:* `pkgs.thelounge`

*Declared by:* [`nixos/modules/services/networking/thelounge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/thelounge.nix)

## `services.thelounge.plugins` {#opt-services.thelounge.plugins}

The Lounge plugins to install. Plugins can be found in
`pkgs.theLoungePlugins.plugins` and `pkgs.theLoungePlugins.themes`.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.theLoungePlugins.themes.solarized ]`

*Declared by:* [`nixos/modules/services/networking/thelounge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/thelounge.nix)

## `services.thelounge.port` {#opt-services.thelounge.port}

TCP port to listen on for http connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9000`

*Declared by:* [`nixos/modules/services/networking/thelounge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/thelounge.nix)

## `services.thelounge.public` {#opt-services.thelounge.public}

Make your The Lounge instance public.
Setting this to `false` will require you to configure user
accounts by using the (`thelounge`) command or by adding
entries in `/var/lib/thelounge/users`. You might need to restart
The Lounge after making changes to the state directory.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/thelounge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/thelounge.nix)

## `services.thermald.configFile` {#opt-services.thermald.configFile}

The thermald manual configuration file.

Leave unspecified to run with the `--adaptive` flag instead which will have thermald use your computer's DPTF adaptive tables.

See `man thermald` for more information.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/thermald.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thermald.nix)

## `services.thermald.debug` {#opt-services.thermald.debug}

Whether to enable debug logging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/thermald.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thermald.nix)

## `services.thermald.enable` {#opt-services.thermald.enable}

Whether to enable thermald, the temperature management daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/thermald.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thermald.nix)

## `services.thermald.ignoreCpuidCheck` {#opt-services.thermald.ignoreCpuidCheck}

Whether to ignore the cpuid check to allow running on unsupported platforms

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/thermald.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thermald.nix)

## `services.thermald.package` {#opt-services.thermald.package}

The thermald package to use.

*Type:* package

*Default:* `pkgs.thermald`

*Declared by:* [`nixos/modules/services/hardware/thermald.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thermald.nix)

## `services.thinkfan.enable` {#opt-services.thinkfan.enable}

Whether to enable thinkfan, a fan control program.

::: note
This module targets IBM/Lenovo thinkpads by default, for
other hardware you will have configure it more carefully.
:::

*Type:* boolean

*Default:* `false`

*Related packages:*

- [`pkgs.thinkfan`](https://search.nixos.org/packages?show=thinkfan&sort=relevance&query=thinkfan)

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.extraArgs` {#opt-services.thinkfan.extraArgs}

A list of extra command line arguments to pass to thinkfan.
Check the `thinkfan(1)` manpage for available arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-b"
  "0"
]
```

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.fans` {#opt-services.thinkfan.fans}

List of fans thinkfan will control.

::: note
This section slightly departs from the thinkfan.conf syntax.
The type and path must be specified like this:

```
  type = "tpacpi";
  query = "/proc/acpi/ibm/fan";
```

instead of a single declaration like:

```
  - tpacpi: /proc/acpi/ibm/fan
```
:::

*Type:* list of (open submodule of attribute set of (YAML 1.1 value))

*Default:*

``` nix
[
  {
    query = "/proc/acpi/ibm/fan";
    type = "tpacpi";
  }
]
```

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.fans.*.indices` {#opt-services.thinkfan.fans._.indices}

A list of fans to pick in case multiple fans match the query.

::: note
Indices start from 0.
:::

*Type:* null or (list of (unsigned integer, meaning \>=0))

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.fans.*.query` {#opt-services.thinkfan.fans._.query}

The query string used to match one or more fans: can be
a fullpath to the temperature file (single fan) or a fullpath
to a driver directory (multiple fans).

::: note
When multiple fans match, the query can be restricted using the
`name` or `indices` options.
:::

*Type:* string

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.fans.*.type` {#opt-services.thinkfan.fans._.type}

The fan type, can be
`hwmon` for standard fans,

`atasmart` to read the temperature via
S.M.A.R.T (requires smartSupport to be enabled),

`tpacpi` for the legacy thinkpac\_acpi driver, or

`nvml` for the (proprietary) nVidia driver.

*Type:* one of "hwmon", "atasmart", "tpacpi", "nvml"

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.levels` {#opt-services.thinkfan.levels}

\[LEVEL LOW HIGH\]

LEVEL is the fan level to use: it can be an integer (0-7 with thinkpad\_acpi),
"level auto" (to keep the default firmware behavior), "level full-speed" or
"level disengaged" (to run the fan as fast as possible).
LOW is the temperature at which to step down to the previous level.
HIGH is the temperature at which to step up to the next level.
All numbers are integers.

*Type:* list of (tuple of (unsigned integer, meaning \>=0, or one of "level auto", "level full-speed", "level disengaged") (unsigned integer, meaning \>=0) (unsigned integer, meaning \>=0))

*Default:*

``` nix
[
  [
    0
    0
    55
  ]
  [
    1
    48
    60
  ]
  [
    2
    50
    61
  ]
  [
    3
    52
    63
  ]
  [
    6
    56
    65
  ]
  [
    7
    60
    85
  ]
  [
    "level auto"
    80
    32767
  ]
]
```

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.sensors` {#opt-services.thinkfan.sensors}

List of temperature sensors thinkfan will monitor.

::: note
This section slightly departs from the thinkfan.conf syntax.
The type and path must be specified like this:

```
  type = "tpacpi";
  query = "/proc/acpi/ibm/thermal";
```

instead of a single declaration like:

```
  - tpacpi: /proc/acpi/ibm/thermal
```
:::

*Type:* list of (open submodule of attribute set of (YAML 1.1 value))

*Default:*

``` nix
[
  {
    query = "/proc/acpi/ibm/thermal";
    type = "tpacpi";
  }
]
```

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.sensors.*.correction` {#opt-services.thinkfan.sensors._.correction}

A list of values to be added to the temperature of each sensor,
can be used to equalize small discrepancies in temperature ratings.

*Type:* null or (list of signed integer)

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.sensors.*.indices` {#opt-services.thinkfan.sensors._.indices}

A list of sensors to pick in case multiple sensors match the query.

::: note
Indices start from 0.
:::

*Type:* null or (list of (unsigned integer, meaning \>=0))

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.sensors.*.query` {#opt-services.thinkfan.sensors._.query}

The query string used to match one or more sensors: can be
a fullpath to the temperature file (single sensor) or a fullpath
to a driver directory (multiple sensors).

::: note
When multiple sensors match, the query can be restricted using the
`name` or `indices` options.
:::

*Type:* string

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.sensors.*.type` {#opt-services.thinkfan.sensors._.type}

The sensor type, can be
`hwmon` for standard sensors,

`atasmart` to read the temperature via
S.M.A.R.T (requires smartSupport to be enabled),

`tpacpi` for the legacy thinkpac\_acpi driver, or

`nvml` for the (proprietary) nVidia driver.

*Type:* one of "hwmon", "atasmart", "tpacpi", "nvml"

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.settings` {#opt-services.thinkfan.settings}

Thinkfan settings. Use this option to configure thinkfan
settings not exposed in a NixOS option or to bypass one.
Before changing this, read the `thinkfan.conf(5)`
manpage and take a look at the example config file at
[https://github.com/vmatare/thinkfan/blob/master/examples/thinkfan.yaml](https://github.com/vmatare/thinkfan/blob/master/examples/thinkfan.yaml)

*Type:* attribute set of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.thinkfan.smartSupport` {#opt-services.thinkfan.smartSupport}

Whether to build thinkfan with S.M.A.R.T. support to read temperatures
directly from hard disks.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/thinkfan.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/thinkfan.nix)

## `services.throttled.enable` {#opt-services.throttled.enable}

Whether to enable fix for Intel CPU throttling.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/throttled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/throttled.nix)

## `services.throttled.extraConfig` {#opt-services.throttled.extraConfig}

Alternative configuration

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/throttled.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/throttled.nix)

## `services.tiddlywiki.enable` {#opt-services.tiddlywiki.enable}

Whether to enable TiddlyWiki nodejs server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tiddlywiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tiddlywiki.nix)

## `services.tiddlywiki.listenOptions` {#opt-services.tiddlywiki.listenOptions}

Parameters passed to `--listen` command.
Refer to [https://tiddlywiki.com/#WebServer](https://tiddlywiki.com/#WebServer)
for details on supported values.

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
  credentials = "../credentials.csv";
  port = 3456;
  readers = "(authenticated)";
}
```

*Declared by:* [`nixos/modules/services/misc/tiddlywiki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tiddlywiki.nix)

## `services.tigerbeetle.addresses` {#opt-services.tigerbeetle.addresses}

The addresses of all replicas in the cluster.
This should be a list of IPv4/IPv6 addresses with port numbers.
Either the address or port number (but not both) may be omitted, in which case a default of 127.0.0.1 or 3001 will be used.
The first address in the list corresponds to the address for replica 0, the second address for replica 1, and so on.

*Type:* list of non-empty string

*Default:*

``` nix
[
  "3001"
]
```

*Declared by:* [`nixos/modules/services/databases/tigerbeetle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/tigerbeetle.nix)

## `services.tigerbeetle.cacheGridSize` {#opt-services.tigerbeetle.cacheGridSize}

The grid cache size.
The grid cache acts like a page cache for TigerBeetle.
It is recommended to set this as large as possible.

*Type:* string matching the pattern \[0-9\]+(K|M|G)iB

*Default:* `"1GiB"`

*Declared by:* [`nixos/modules/services/databases/tigerbeetle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/tigerbeetle.nix)

## `services.tigerbeetle.clusterId` {#opt-services.tigerbeetle.clusterId}

The 128-bit cluster ID used to create the replica data file (if needed).
Since Nix only supports integers up to 64 bits, you need to pass a string to this if the cluster ID can't fit in 64 bits.
Otherwise, you can pass the cluster ID as either an integer or a string.

*Type:* unsigned integer, meaning \>=0, or string matching the pattern \[0-9\]+

*Default:* `0`

*Declared by:* [`nixos/modules/services/databases/tigerbeetle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/tigerbeetle.nix)

## `services.tigerbeetle.enable` {#opt-services.tigerbeetle.enable}

Whether to enable TigerBeetle server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/tigerbeetle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/tigerbeetle.nix)

## `services.tigerbeetle.package` {#opt-services.tigerbeetle.package}

The tigerbeetle package to use.

*Type:* package

*Default:* `pkgs.tigerbeetle`

*Declared by:* [`nixos/modules/services/databases/tigerbeetle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/tigerbeetle.nix)

## `services.tigerbeetle.replicaCount` {#opt-services.tigerbeetle.replicaCount}

The number of replicas participating in replication of the cluster.

*Type:* unsigned integer, meaning \>=0

*Default:* `1`

*Declared by:* [`nixos/modules/services/databases/tigerbeetle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/tigerbeetle.nix)

## `services.tigerbeetle.replicaIndex` {#opt-services.tigerbeetle.replicaIndex}

The index (starting at 0) of the replica in the cluster.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Declared by:* [`nixos/modules/services/databases/tigerbeetle.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/tigerbeetle.nix)

## `services.tika.configFile` {#opt-services.tika.configFile}

The Apache Tika configuration (XML) file to use.

*Type:* null or absolute path

*Default:* `null`

*Example:* `./tika/tika-config.xml`

*Declared by:* [`nixos/modules/services/search/tika.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/tika.nix)

## `services.tika.enable` {#opt-services.tika.enable}

Whether to enable Apache Tika server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/tika.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/tika.nix)

## `services.tika.enableOcr` {#opt-services.tika.enableOcr}

Whether to enable OCR support by adding the `tesseract` package as a dependency.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/search/tika.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/tika.nix)

## `services.tika.listenAddress` {#opt-services.tika.listenAddress}

The Apache Tika bind address.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/search/tika.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/tika.nix)

## `services.tika.openFirewall` {#opt-services.tika.openFirewall}

Whether to open the firewall for Apache Tika.
This adds `services.tika.port` to `networking.firewall.allowedTCPPorts`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/search/tika.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/tika.nix)

## `services.tika.package` {#opt-services.tika.package}

The tika package to use.

*Type:* package

*Default:* `pkgs.tika`

*Declared by:* [`nixos/modules/services/search/tika.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/tika.nix)

## `services.tika.port` {#opt-services.tika.port}

The Apache Tike port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9998`

*Declared by:* [`nixos/modules/services/search/tika.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/tika.nix)

## `services.timekpr.adminUsers` {#opt-services.timekpr.adminUsers}

All listed users will become part of the `timekpr` group so they can manage timekpr settings without requiring sudo.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "alice"
  "bob"
]
```

*Declared by:* [`nixos/modules/services/security/timekpr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/timekpr.nix)

## `services.timekpr.enable` {#opt-services.timekpr.enable}

Whether to enable Timekpr-nExT, a screen time managing application that helps optimizing time spent at computer for your subordinates, children or even for yourself.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/timekpr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/timekpr.nix)

## `services.timekpr.package` {#opt-services.timekpr.package}

The timekpr package to use.

*Type:* package

*Default:* `pkgs.timekpr`

*Declared by:* [`nixos/modules/services/security/timekpr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/timekpr.nix)

## `services.timesyncd.enable` {#opt-services.timesyncd.enable}

Enables the systemd NTP client daemon.

*Type:* boolean

*Default:* `!config.boot.isContainer`

*Declared by:* [`nixos/modules/system/boot/timesyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/timesyncd.nix)

## `services.timesyncd.fallbackServers` {#opt-services.timesyncd.fallbackServers}

The set of fallback NTP servers from which to synchronise.

Setting this option to an empty list will write `FallbackNTP=` to the
`timesyncd.conf` file as opposed to setting this option to null which
will remove `FallbackNTP=` entirely.

See `timesyncd.conf(5)` for details.

*Type:* null or (list of string)

*Default:* `config.networking.timeServers`

*Declared by:* [`nixos/modules/system/boot/timesyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/timesyncd.nix)

## `services.timesyncd.servers` {#opt-services.timesyncd.servers}

The set of NTP servers from which to synchronise.

Setting this option to an empty list will write `NTP=` to the
`timesyncd.conf` file as opposed to setting this option to null which
will remove `NTP=` entirely.

See `timesyncd.conf(5)` for details.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/system/boot/timesyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/timesyncd.nix)

## `services.timesyncd.settings.Time` {#opt-services.timesyncd.settings.Time}

Settings for systemd-timesyncd. See `timesyncd.conf(5)` for
available options.

*Type:* open submodule of attribute set of (systemd option)

*Default:* `{ }`

*Example:*

``` nix
{
  PollIntervalMaxSec = 180;
}
```

*Declared by:* [`nixos/modules/system/boot/timesyncd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/timesyncd.nix)

## `services.tinc.networks` {#opt-services.tinc.networks}

Defines the tinc networks which will be started.
Each network invokes a different daemon.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.bindToAddress` {#opt-services.tinc.networks._name_.bindToAddress}

The ip address to bind to (both listen on and send packets from).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.chroot` {#opt-services.tinc.networks._name_.chroot}

Change process root directory to the directory where the config file is located (/etc/tinc/netname/), for added security.
The chroot is performed after all the initialization is done, after writing pid files and opening network sockets.

Note that this currently breaks dns resolution and tinc can't run scripts anymore (such as tinc-down or host-up), unless it is setup to be runnable inside chroot environment.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.debugLevel` {#opt-services.tinc.networks._name_.debugLevel}

The amount of debugging information to add to the log. 0 means little
logging while 5 is the most logging. `man tincd` for
more details.

*Type:* integer between 0 and 5 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.ed25519PrivateKeyFile` {#opt-services.tinc.networks._name_.ed25519PrivateKeyFile}

Path of the private ed25519 keyfile.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.extraConfig` {#opt-services.tinc.networks._name_.extraConfig}

Extra lines to add to the tinc service configuration file.

Note that using the declarative `service.tinc.networks.<name>.settings`
option is preferred.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings` {#opt-services.tinc.networks._name_.hostSettings}

The name of the host in the network as well as the configuration for that host.
This name should only contain alphanumerics and underscores.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  host1 = {
    addresses = [
      { address = "192.168.1.42"; }
      { address = "192.168.1.42"; port = 1655; }
    ];
    subnets = [ { address = "10.0.0.42"; } ];
    rsaPublicKey = "...";
    settings = {
      Ed25519PublicKey = "...";
    };
  };
  host2 = {
    subnets = [ { address = "10.0.1.0"; prefixLength = 24; weight = 2; } ];
    rsaPublicKey = "...";
    settings = {
      Compression = 10;
    };
  };
}
```

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.addresses` {#opt-services.tinc.networks._name_.hostSettings._name_.addresses}

The external address where the host can be reached. This will set this
host's `settings.Address` option.

This variable is only required if you want to connect to this host.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.addresses.*.address` {#opt-services.tinc.networks._name_.hostSettings._name_.addresses._.address}

The external IP address or hostname where the host can be reached.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.addresses.*.port` {#opt-services.tinc.networks._name_.hostSettings._name_.addresses._.port}

The port where the host can be reached.

If no port is specified, the default Port is used.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.rsaPublicKey` {#opt-services.tinc.networks._name_.hostSettings._name_.rsaPublicKey}

Legacy RSA public key of the host in PEM format, including start and
end markers.

This will be appended as-is in the host's configuration file.

The ed25519 public key can be specified using the
`settings.Ed25519PublicKey` option instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.settings` {#opt-services.tinc.networks._name_.hostSettings._name_.settings}

Configuration for this host.

See [https://tinc-vpn.org/documentation-1.1/Host-configuration-variables.html](https://tinc-vpn.org/documentation-1.1/Host-configuration-variables.html)
for supported values.

*Type:* open submodule of attribute set of (boolean or string or signed integer or list of (boolean or string or signed integer))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.subnets` {#opt-services.tinc.networks._name_.hostSettings._name_.subnets}

The subnets which this tinc daemon will serve. This will set this
host's `settings.Subnet` option.

Tinc tries to look up which other daemon it should send a packet to by
searching the appropriate subnet. If the packet matches a subnet, it
will be sent to the daemon who has this subnet in his host
configuration file.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.subnets.*.address` {#opt-services.tinc.networks._name_.hostSettings._name_.subnets._.address}

The subnet of this host.

Subnets can either be single MAC, IPv4 or IPv6 addresses, in which case
a subnet consisting of only that single address is assumed, or they can
be a IPv4 or IPv6 network address with a prefix length.

IPv4 subnets are notated like 192.168.1.0/24, IPv6 subnets are notated
like fec0:0:0:1::/64. MAC addresses are notated like 0:1a:2b:3c:4d:5e.

Note that subnets like 192.168.1.1/24 are invalid.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.subnets.*.prefixLength` {#opt-services.tinc.networks._name_.hostSettings._name_.subnets._.prefixLength}

The prefix length of the subnet.

If null, a subnet consisting of only that single address is assumed.

This conforms to standard CIDR notation as described in RFC1519.

*Type:* null or integer between 0 and 128 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hostSettings.<name>.subnets.*.weight` {#opt-services.tinc.networks._name_.hostSettings._name_.subnets._.weight}

Indicates the priority over identical Subnets owned by different nodes.

Lower values indicate higher priority. Packets will be sent to the
node with the highest priority, unless that node is not reachable, in
which case the node with the next highest priority will be tried, and
so on.

*Type:* unsigned integer, meaning \>=0

*Default:* `10`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.hosts` {#opt-services.tinc.networks._name_.hosts}

The name of the host in the network as well as the configuration for that host.
This name should only contain alphanumerics and underscores.

Note that using the declarative `service.tinc.networks.<name>.hostSettings`
option is preferred.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.interfaceType` {#opt-services.tinc.networks._name_.interfaceType}

The type of virtual interface used for the network connection.

*Type:* one of "tun", "tap"

*Default:* `"tun"`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.listenAddress` {#opt-services.tinc.networks._name_.listenAddress}

The ip address to listen on for incoming connections.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.name` {#opt-services.tinc.networks._name_.name}

The name of the node which is used as an identifier when communicating
with the remote nodes in the mesh. If null then the hostname of the system
is used to derive a name (note that tinc may replace non-alphanumeric characters in
hostnames by underscores).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.package` {#opt-services.tinc.networks._name_.package}

The tinc\_pre package to use.

*Type:* package

*Default:* `pkgs.tinc_pre`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.rsaPrivateKeyFile` {#opt-services.tinc.networks._name_.rsaPrivateKeyFile}

Path of the private RSA keyfile.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinc.networks.<name>.settings` {#opt-services.tinc.networks._name_.settings}

Configuration of the Tinc daemon for this network.

See [https://tinc-vpn.org/documentation-1.1/Main-configuration-variables.html](https://tinc-vpn.org/documentation-1.1/Main-configuration-variables.html)
for supported values.

*Type:* open submodule of attribute set of (boolean or string or signed integer or list of (boolean or string or signed integer))

*Default:* `{ }`

*Example:*

``` nix
{
  Interface = "custom.interface";
  DirectOnly = true;
  Mode = "switch";
}
```

*Declared by:* [`nixos/modules/services/networking/tinc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinc.nix)

## `services.tinyauth.dataDir` {#opt-services.tinyauth.dataDir}

The directory where Tinyauth will store its data.

*Type:* absolute path

*Default:* `"/var/lib/tinyauth"`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.enable` {#opt-services.tinyauth.enable}

Whether to enable Tinyauth server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.enableUnixSocket` {#opt-services.tinyauth.enableUnixSocket}

Whether to enable a UNIX domain socket at `/run/tinyauth/tinyauth.sock` instead of listening on an IP address and port..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.environmentFile` {#opt-services.tinyauth.environmentFile}

Path to an environment file loaded for Tinyauth.

This can be used to securely store tokens and secrets outside of the world-readable Nix store.

Example contents of the file:

```
TINYAUTH_AUTH_USERS=user-hash
TINYAUTH_OAUTH_PROVIDERS_GOOGLE_CLIENTSECRET=client-secret
```

*Type:* absolute path

*Default:* `"/dev/null"`

*Example:* `"/var/lib/secrets/tinyauth"`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.group` {#opt-services.tinyauth.group}

Group account under which Tinyauth runs.

*Type:* string

*Default:* `"tinyauth"`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.package` {#opt-services.tinyauth.package}

The tinyauth package to use.

*Type:* package

*Default:* `pkgs.tinyauth`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings` {#opt-services.tinyauth.settings}

Environment variables that will be passed to Tinyauth.
The "TINYAUTH\_" prefix will be prepended to the setting names.
See [configuration options](https://tinyauth.app/docs/reference/configuration)
for supported values.

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings.ANALYTICS_ENABLED` {#opt-services.tinyauth.settings.ANALYTICS_ENABLED}

Whether to enable anonymous version collection.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings.APPURL` {#opt-services.tinyauth.settings.APPURL}

URL of the app.

*Type:* string

*Example:* `"https://auth.example.com"`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings.AUTH_LOGINMAXRETRIES` {#opt-services.tinyauth.settings.AUTH_LOGINMAXRETRIES}

Maximum login attempts before timeout (0 to disable).

*Type:* unsigned integer, meaning \>=0

*Default:* `3`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings.AUTH_LOGINTIMEOUT` {#opt-services.tinyauth.settings.AUTH_LOGINTIMEOUT}

Login timeout in seconds after max retries reached (0 to disable).

*Type:* unsigned integer, meaning \>=0

*Default:* `300`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings.AUTH_TRUSTEDPROXIES` {#opt-services.tinyauth.settings.AUTH_TRUSTEDPROXIES}

Comma-separated list of trusted proxy addresses.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings.RESOURCES_ENABLED` {#opt-services.tinyauth.settings.RESOURCES_ENABLED}

Whether to enable the resources server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings.SERVER_ADDRESS` {#opt-services.tinyauth.settings.SERVER_ADDRESS}

Address to bind the server to.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.settings.SERVER_PORT` {#opt-services.tinyauth.settings.SERVER_PORT}

The port to run the server on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinyauth.user` {#opt-services.tinyauth.user}

User account under which Tinyauth runs.

*Type:* string

*Default:* `"tinyauth"`

*Declared by:* [`nixos/modules/services/security/tinyauth.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tinyauth.nix)

## `services.tinydns.data` {#opt-services.tinydns.data}

The DNS data to serve, in the format described by `tinydns-data(8)`

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/tinydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinydns.nix)

## `services.tinydns.enable` {#opt-services.tinydns.enable}

Whether to run the tinydns dns server

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tinydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinydns.nix)

## `services.tinydns.ip` {#opt-services.tinydns.ip}

IP address on which to listen for connections

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/networking/tinydns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinydns.nix)

## `services.tinyproxy.enable` {#opt-services.tinyproxy.enable}

Whether to enable Tinyproxy daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tinyproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinyproxy.nix)

## `services.tinyproxy.package` {#opt-services.tinyproxy.package}

The tinyproxy package to use.

*Type:* package

*Default:* `pkgs.tinyproxy`

*Declared by:* [`nixos/modules/services/networking/tinyproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinyproxy.nix)

## `services.tinyproxy.settings` {#opt-services.tinyproxy.settings}

Configuration for [tinyproxy](https://tinyproxy.github.io/).

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  Port 8888;
  Listen 127.0.0.1;
  Timeout 600;
  Allow 127.0.0.1;
  Anonymous = ['"Host"' '"Authorization"'];
  ReversePath = '"/example/" "http://www.example.com/"';
}
```

*Declared by:* [`nixos/modules/services/networking/tinyproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinyproxy.nix)

## `services.tinyproxy.settings.Anonymous` {#opt-services.tinyproxy.settings.Anonymous}

If an `Anonymous` keyword is present, then anonymous proxying is enabled. The headers listed with `Anonymous` are allowed through, while all others are denied. If no Anonymous keyword is present, then all headers are allowed through. You must include quotes around the headers.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/tinyproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinyproxy.nix)

## `services.tinyproxy.settings.Filter` {#opt-services.tinyproxy.settings.Filter}

Tinyproxy supports filtering of web sites based on URLs or domains. This option specifies the location of the file containing the filter rules, one rule per line.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tinyproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinyproxy.nix)

## `services.tinyproxy.settings.Listen` {#opt-services.tinyproxy.settings.Listen}

Specify which address to listen to.

*Type:* null or string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/tinyproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinyproxy.nix)

## `services.tinyproxy.settings.Port` {#opt-services.tinyproxy.settings.Port}

Specify which port to listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8888`

*Declared by:* [`nixos/modules/services/networking/tinyproxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tinyproxy.nix)

## `services.tlp.enable` {#opt-services.tlp.enable}

Whether to enable the TLP power management daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/tlp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tlp.nix)

## `services.tlp.extraConfig` {#opt-services.tlp.extraConfig}

Verbatim additional configuration variables for TLP.
DEPRECATED: use services.tlp.settings instead.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/tlp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tlp.nix)

## `services.tlp.package` {#opt-services.tlp.package}

The tlp package to use.

*Type:* package

*Default:* `"pkgs.tlp.override { enableRDW = config.networking.networkmanager.enable; }"`

*Declared by:* [`nixos/modules/services/hardware/tlp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tlp.nix)

## `services.tlp.pd.enable` {#opt-services.tlp.pd.enable}

Whether to enable the power-profiles-daemon like DBus interface for TLP.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tlp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tlp.nix)

## `services.tlp.pd.package` {#opt-services.tlp.pd.package}

The tlp-pd package to use.

*Type:* package

*Default:* `pkgs.tlp-pd`

*Declared by:* [`nixos/modules/services/hardware/tlp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tlp.nix)

## `services.tlp.settings` {#opt-services.tlp.settings}

Options passed to TLP. See [https://linrunner.de/tlp](https://linrunner.de/tlp) for all supported options..

*Type:* attribute set of (boolean or signed integer or floating point number or string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  SATA_LINKPWR_ON_BAT = "med_power_with_dipm";
  USB_BLACKLIST_PHONE = 1;
}
```

*Declared by:* [`nixos/modules/services/hardware/tlp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tlp.nix)

## `services.tlsrouter.enable` {#opt-services.tlsrouter.enable}

Whether to enable TLS SNI router.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tlsrouter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tlsrouter.nix)

## `services.tlsrouter.helloTimeout` {#opt-services.tlsrouter.helloTimeout}

How long to wait for the start of the TLS handshake.

*Type:* string

*Default:* `"3s"`

*Declared by:* [`nixos/modules/services/networking/tlsrouter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tlsrouter.nix)

## `services.tlsrouter.listen` {#opt-services.tlsrouter.listen}

Set the listen address.

*Type:* string

*Default:* `":443"`

*Declared by:* [`nixos/modules/services/networking/tlsrouter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tlsrouter.nix)

## `services.tlsrouter.package` {#opt-services.tlsrouter.package}

The tlsrouter package to use.

*Type:* package

*Default:* `pkgs.tlsrouter`

*Declared by:* [`nixos/modules/services/networking/tlsrouter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tlsrouter.nix)

## `services.tlsrouter.routes` {#opt-services.tlsrouter.routes}

TLSRouter requires a configuration that tells it what backend to use for a given hostname

*Type:* attribute set of (submodule)

*Example:*

``` nix
{
  # Basic hostname -> backend mapping
  "go.universe.tf".backend = "localhost:1234";

  # DNS wildcards are understood as well.
  "*.go.universe.tf".backend = "1.2.3.4:8080";

  # DNS wildcards can go anywhere in name.
  "google.*".backend = "10.20.30.40:443";

  # RE2 regexes are also available
  "/(alpha|beta|gamma)\\.mon(itoring)?\\.dave\\.tf/".backend = "100.200.100.200:443";

  # If your backend supports HAProxy's PROXY protocol, you can enable
  # it to receive the real client ip:port.
  "fancy.backend" = {
    backend = "2.3.4.5:443";
    proxy = true;
  };
}
```

*Declared by:* [`nixos/modules/services/networking/tlsrouter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tlsrouter.nix)

## `services.tlsrouter.routes.<name>.backend` {#opt-services.tlsrouter.routes._name_.backend}

Backend address

*Type:* non-empty string

*Example:* `"localhost:1234"`

*Declared by:* [`nixos/modules/services/networking/tlsrouter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tlsrouter.nix)

## `services.tlsrouter.routes.<name>.proxy` {#opt-services.tlsrouter.routes._name_.proxy}

If your backend supports HAProxy's PROXY protocol, you can enable it to receive the real client ip:port

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tlsrouter.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tlsrouter.nix)

## `services.tlsrpt.collectd.extraFlags` {#opt-services.tlsrpt.collectd.extraFlags}

List of extra flags to pass to the tlsrpt-reportd executable.

See `tlsrpt-collectd(1)` for possible flags.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.collectd.settings` {#opt-services.tlsrpt.collectd.settings}

Flags from `tlsrpt-collectd(1)` as key-value pairs.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.collectd.settings.log_level` {#opt-services.tlsrpt.collectd.settings.log_level}

Level of log messages to emit.

*Type:* one of "debug", "info", "warning", "error", "critical"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.collectd.settings.socketmode` {#opt-services.tlsrpt.collectd.settings.socketmode}

Permissions on the UNIX socket.

*Type:* string

*Default:* `"0220"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.collectd.settings.socketname` {#opt-services.tlsrpt.collectd.settings.socketname}

Path at which the UNIX socket will be created.

*Type:* absolute path

*Default:* `"/run/tlsrpt/collectd.sock"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.collectd.settings.storage` {#opt-services.tlsrpt.collectd.settings.storage}

Storage backend definition.

*Type:* string

*Default:* `"sqlite:///var/lib/tlsrpt/collectd.sqlite"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.configurePostfix` {#opt-services.tlsrpt.configurePostfix}

Whether to configure permissions to allow integration with Postfix.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.enable` {#opt-services.tlsrpt.enable}

Whether to enable the TLSRPT services.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.fetcher.settings` {#opt-services.tlsrpt.fetcher.settings}

Flags from `tlsrpt-fetcher(1)` as key-value pairs.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.fetcher.settings.log_level` {#opt-services.tlsrpt.fetcher.settings.log_level}

Level of log messages to emit.

*Type:* one of "debug", "info", "warning", "error", "critical"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.fetcher.settings.storage` {#opt-services.tlsrpt.fetcher.settings.storage}

Path to the collectd sqlite database.

*Type:* string

*Default:*

``` nix
config.services.tlsrpt.collectd.settings.storage
```

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.package` {#opt-services.tlsrpt.package}

The tlsrpt-reporter package to use.

*Type:* package

*Default:* `pkgs.tlsrpt-reporter`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.extraFlags` {#opt-services.tlsrpt.reportd.extraFlags}

List of extra flags to pass to the tlsrpt-reportd executable.

See `tlsrpt-report(1)` for possible flags.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings` {#opt-services.tlsrpt.reportd.settings}

Flags from `tlsrpt-reportd(1)` as key-value pairs.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings.contact_info` {#opt-services.tlsrpt.reportd.settings.contact_info}

Contact information embedded into the reports.

*Type:* string

*Example:* `"smtp-tls-reporting@example.com"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings.dbname` {#opt-services.tlsrpt.reportd.settings.dbname}

Path to the sqlite database.

*Type:* string

*Default:* `"/var/lib/tlsrpt/reportd.sqlite"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings.fetchers` {#opt-services.tlsrpt.reportd.settings.fetchers}

Comma-separated list of fetcher programs that retrieve collectd data.

*Type:* string

*Default:*

``` nix
lib.getExe' cfg.package "tlsrpt-fetcher"
```

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings.http_script` {#opt-services.tlsrpt.reportd.settings.http_script}

Call to an HTTPS client, that accepts the URL on the commandline and the request body from stdin.

*Type:* null or string

*Default:*

``` nix
${lib.getExe pkgs.curl} --silent --header 'Content-Type: application/tlsrpt+gzip' --data-binary @-
```

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings.log_level` {#opt-services.tlsrpt.reportd.settings.log_level}

Level of log messages to emit.

*Type:* one of "debug", "info", "warning", "error", "critical"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings.organization_name` {#opt-services.tlsrpt.reportd.settings.organization_name}

Name of the organization sending out the reports.

*Type:* string

*Example:* `"ACME Corp."`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings.sender_address` {#opt-services.tlsrpt.reportd.settings.sender_address}

Sender address used for reports.

*Type:* string

*Example:* `"noreply@example.com"`

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tlsrpt.reportd.settings.sendmail_script` {#opt-services.tlsrpt.reportd.settings.sendmail_script}

Path to a sendmail-compatible executable for delivery reports.

*Type:* null or string

*Default:*

``` nix
if config.services.postfix.enable && config.services.postfix.setSendmail then
  "/run/wrappers/bin/sendmail -i -t -f $${cfg.reportd.settings.sender_address}"
else
  null
```

*Declared by:* [`nixos/modules/services/mail/tlsrpt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/mail/tlsrpt.nix)

## `services.tmate-ssh-server.advertisedPort` {#opt-services.tmate-ssh-server.advertisedPort}

External port advertised to clients

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/tmate-ssh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tmate-ssh-server.nix)

## `services.tmate-ssh-server.enable` {#opt-services.tmate-ssh-server.enable}

Whether to enable tmate ssh server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tmate-ssh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tmate-ssh-server.nix)

## `services.tmate-ssh-server.host` {#opt-services.tmate-ssh-server.host}

External host name

*Type:* string

*Default:* `config.networking.domain or config.networking.hostName`

*Declared by:* [`nixos/modules/services/networking/tmate-ssh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tmate-ssh-server.nix)

## `services.tmate-ssh-server.keysDir` {#opt-services.tmate-ssh-server.keysDir}

Directory containing ssh keys, defaulting to auto-generation

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/tmate-ssh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tmate-ssh-server.nix)

## `services.tmate-ssh-server.openFirewall` {#opt-services.tmate-ssh-server.openFirewall}

Whether to automatically open the specified ports in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tmate-ssh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tmate-ssh-server.nix)

## `services.tmate-ssh-server.package` {#opt-services.tmate-ssh-server.package}

The tmate-ssh-server package to use.

*Type:* package

*Default:* `pkgs.tmate-ssh-server`

*Declared by:* [`nixos/modules/services/networking/tmate-ssh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tmate-ssh-server.nix)

## `services.tmate-ssh-server.port` {#opt-services.tmate-ssh-server.port}

Listen port for the ssh server

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2222`

*Declared by:* [`nixos/modules/services/networking/tmate-ssh-server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tmate-ssh-server.nix)

## `services.todesk.enable` {#opt-services.todesk.enable}

Whether to enable ToDesk daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/todesk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/todesk.nix)

## `services.todesk.package` {#opt-services.todesk.package}

The todesk package to use.

*Type:* package

*Default:* `pkgs.todesk`

*Declared by:* [`nixos/modules/services/monitoring/todesk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/todesk.nix)

## `services.tomcat.axis2.enable` {#opt-services.tomcat.axis2.enable}

Whether to enable Apache Axis2 container.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.axis2.services` {#opt-services.tomcat.axis2.services}

List containing AAR files or directories with AAR files which are web services to be deployed on Axis2

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.baseDir` {#opt-services.tomcat.baseDir}

Location where Tomcat stores configuration files, web applications
and logfiles. Note that it is partially cleared on each service startup
if `purifyOnStart` is enabled.

*Type:* absolute path

*Default:* `"/var/tomcat"`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.catalinaOpts` {#opt-services.tomcat.catalinaOpts}

Parameters to pass to the Java Virtual Machine which spawns the Catalina servlet container

*Type:* (list of string) or string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.commonLibs` {#opt-services.tomcat.commonLibs}

List containing JAR files or directories with JAR files which are libraries shared by the web applications and the servlet container

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.enable` {#opt-services.tomcat.enable}

Whether to enable Apache Tomcat.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.extraConfigFiles` {#opt-services.tomcat.extraConfigFiles}

Extra configuration files to pull into the tomcat conf directory

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.extraEnvironment` {#opt-services.tomcat.extraEnvironment}

Environment Variables to pass to the tomcat service

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ENVIRONMENT=production"
]
```

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.extraGroups` {#opt-services.tomcat.extraGroups}

Defines extra groups to which the tomcat user belongs.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "users"
]
```

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.group` {#opt-services.tomcat.group}

Group account under which Apache Tomcat runs.

*Type:* string

*Default:* `"tomcat"`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.javaOpts` {#opt-services.tomcat.javaOpts}

Parameters to pass to the Java Virtual Machine which spawns Apache Tomcat

*Type:* (list of string) or string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.jdk` {#opt-services.tomcat.jdk}

The jdk package to use.

*Type:* package

*Default:* `pkgs.jdk`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.logDirs` {#opt-services.tomcat.logDirs}

Directories to create in baseDir/logs/

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.logPerVirtualHost` {#opt-services.tomcat.logPerVirtualHost}

Whether to enable logging per virtual host.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.package` {#opt-services.tomcat.package}

The tomcat9 package to use.

*Type:* package

*Default:* `pkgs.tomcat9`

*Example:* `tomcat10`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.port` {#opt-services.tomcat.port}

The TCP port Tomcat should listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.purifyOnStart` {#opt-services.tomcat.purifyOnStart}

On startup, the `baseDir` directory is populated with various files,
subdirectories and symlinks. If this option is enabled, these items
(except for the `logs` and `work` subdirectories) are first removed.
This prevents interference from remainders of an old configuration
(libraries, webapps, etc.), so it's recommended to enable this option.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.serverXml` {#opt-services.tomcat.serverXml}

Verbatim server.xml configuration.
This is mutually exclusive with the virtualHosts options.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.sharedLibs` {#opt-services.tomcat.sharedLibs}

List containing JAR files or directories with JAR files which are libraries shared by the web applications

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.user` {#opt-services.tomcat.user}

User account under which Apache Tomcat runs.

*Type:* string

*Default:* `"tomcat"`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.virtualHosts` {#opt-services.tomcat.virtualHosts}

List consisting of a virtual host name and a list of web applications to deploy on each virtual host

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.virtualHosts.*.aliases` {#opt-services.tomcat.virtualHosts._.aliases}

aliases of the virtualhost

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.virtualHosts.*.name` {#opt-services.tomcat.virtualHosts._.name}

name of the virtualhost

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.virtualHosts.*.webapps` {#opt-services.tomcat.virtualHosts._.webapps}

List containing web application WAR files and/or directories containing
web applications and configuration files for the virtual host.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tomcat.webapps` {#opt-services.tomcat.webapps}

List containing WAR files or directories with WAR files which are web applications to be deployed on Tomcat

*Type:* list of absolute path

*Default:* `[ config.services.tomcat.package.webapps ]`

*Declared by:* [`nixos/modules/services/web-servers/tomcat.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tomcat.nix)

## `services.tor.client.dns.enable` {#opt-services.tor.client.dns.enable}

Whether to enable DNS resolver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.client.enable` {#opt-services.tor.client.enable}

Whether to enable the routing of application connections.
You might want to disable this if you plan running a dedicated Tor relay.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.client.onionServices` {#opt-services.tor.client.onionServices}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceDir).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx = {
    clientAuthorizations = [
      "/run/keys/tor/alice.prv.x25519"
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.client.onionServices.<name>.clientAuthorizations` {#opt-services.tor.client.onionServices._name_.clientAuthorizations}

Clients' authorizations for a v3 onion service,
as a list of files containing each one private key, in the format:

```
descriptor:x25519:<base32-private-key>
```

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#_client_authorization).

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/keys/tor/alice.prv.x25519"
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.client.socksListenAddress` {#opt-services.tor.client.socksListenAddress}

Bind to this address to listen for connections from
Socks-speaking applications.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or (submodule)

*Default:*

``` nix
{
  IsolateDestAddr = true;
  addr = "127.0.0.1";
  port = 9050;
}
```

*Example:*

``` nix
{
  IsolateDestAddr = true;
  addr = "192.168.0.1";
  port = 9090;
}
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.client.transparentProxy.enable` {#opt-services.tor.client.transparentProxy.enable}

Whether to enable transparent proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.controlSocket.enable` {#opt-services.tor.controlSocket.enable}

Whether to enable control socket,
created in `/run/tor/control`.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.enable` {#opt-services.tor.enable}

Whether to enable Tor daemon.
By default, the daemon is run without
relay, exit, bridge or client connectivity.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.enableGeoIP` {#opt-services.tor.enableGeoIP}

Whether to enable use of GeoIP databases.
Disabling this will disable by-country statistics for bridges and relays
and some client and third-party software functionality.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.obfs4Package` {#opt-services.tor.obfs4Package}

The obfs4 package to use.

*Type:* package

*Default:* `pkgs.obfs4`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.openFirewall` {#opt-services.tor.openFirewall}

Whether to enable opening of the relay port(s) in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.package` {#opt-services.tor.package}

The tor package to use.

*Type:* package

*Default:* `pkgs.tor`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.enable` {#opt-services.tor.relay.enable}

Whether to enable relaying of Tor traffic for others.

See [https://www.torproject.org/docs/tor-doc-relay](https://www.torproject.org/docs/tor-doc-relay)
for details.

Setting this to true requires setting
[`services.tor.relay.role`](#opt-services.tor.relay.role)
and
[`services.tor.settings.ORPort`](#opt-services.tor.settings.ORPort)
options.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices` {#opt-services.tor.relay.onionServices}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceDir).

::: warning
Because `tor.service` runs in its own `RootDirectory=`,
when using a onion service to reverse-proxy to a Unix socket,
you need to make that Unix socket available
within the mount namespace of `tor.service`.

When you can configure your service to create its socket in `/tmp`,
this can be done with:

``` nix
systemd.services.${your-service} = {
  unitConfig.JoinsNamespaceOf = [ "tor.service" ];`
  serviceConfig.PrivateTmp = true;
};
```

Otherwise, you can use:

``` nix
systemd.services.tor.serviceConfig.BindPaths = [ "/path/to/your-service/socket/directory" ];
```

but you have to be sure that `/path/to/socket/directory`
exists before `tor.service` is started
and is not deleted and recreated between restarts of `your-service`,
or you'll need to restart `tor.service` to refresh the `BindPaths=`.
:::

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "example.org/www" = {
    authorizedClients = [
      "descriptor:x25519:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    ];
    map = [
      80
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.authorizeClient` {#opt-services.tor.relay.onionServices._name_.authorizeClient}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceAuthorizeClient).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.authorizeClient.authType` {#opt-services.tor.relay.onionServices._name_.authorizeClient.authType}

Either `"basic"` for a general-purpose authorization protocol
or `"stealth"` for a less scalable protocol
that also hides service activity from unauthorized clients.

*Type:* one of "basic", "stealth"

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.authorizeClient.clientNames` {#opt-services.tor.relay.onionServices._name_.authorizeClient.clientNames}

Only clients that are listed here are authorized to access the hidden service.
Generated authorization data can be found in `/var/lib/tor/onion/$name/hostname`.
Clients need to put this authorization data in their configuration file using
[services (T)](#opt-services.tor.settings.HidServAuth).

*Type:* non-empty (list of string matching the pattern \[A-Za-z0-9+-\_\]+)

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.authorizedClients` {#opt-services.tor.relay.onionServices._name_.authorizedClients}

Authorized clients for a v3 onion service,
as a list of public key, in the format:

```
descriptor:x25519:<base32-public-key>
```

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#_client_authorization).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "descriptor:x25519:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.map` {#opt-services.tor.relay.onionServices._name_.map}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServicePort).

*Type:* list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or (submodule))

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    port = 9000;
    target = {
      addr = "127.0.0.1";
      port = 9123;
    };
  }
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.path` {#opt-services.tor.relay.onionServices._name_.path}

Path where to store the data files of the hidden service.
If the `secretKey` is null
this defaults to `/var/lib/tor/onion/$onion`,
otherwise to `/run/tor/onion/$onion`.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.secretKey` {#opt-services.tor.relay.onionServices._name_.secretKey}

Secret key of the onion service.
If null, Tor reuses any preexisting secret key (in `path`)
or generates a new one.
The associated public key and hostname are deterministically regenerated
from this file if they do not exist.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/tor/onion/expyuzz4wqqyqhjn/hs_ed25519_secret_key"`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings` {#opt-services.tor.relay.onionServices._name_.settings}

Settings of the onion service.
See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#_hidden_service_options).

*Type:* open submodule of settings option

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings.HiddenServiceAllowUnknownPorts` {#opt-services.tor.relay.onionServices._name_.settings.HiddenServiceAllowUnknownPorts}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceAllowUnknownPorts).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings.HiddenServiceDirGroupReadable` {#opt-services.tor.relay.onionServices._name_.settings.HiddenServiceDirGroupReadable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceDirGroupReadable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings.HiddenServiceExportCircuitID` {#opt-services.tor.relay.onionServices._name_.settings.HiddenServiceExportCircuitID}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceExportCircuitID).

*Type:* null or value "haproxy" (singular enum)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings.HiddenServiceMaxStreams` {#opt-services.tor.relay.onionServices._name_.settings.HiddenServiceMaxStreams}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceMaxStreams).

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings.HiddenServiceMaxStreamsCloseCircuit` {#opt-services.tor.relay.onionServices._name_.settings.HiddenServiceMaxStreamsCloseCircuit}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceMaxStreamsCloseCircuit).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings.HiddenServiceNumIntroductionPoints` {#opt-services.tor.relay.onionServices._name_.settings.HiddenServiceNumIntroductionPoints}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceNumIntroductionPoints).

*Type:* null or integer between 0 and 20 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings.HiddenServiceSingleHopMode` {#opt-services.tor.relay.onionServices._name_.settings.HiddenServiceSingleHopMode}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceSingleHopMode).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.settings.RendPostPeriod` {#opt-services.tor.relay.onionServices._name_.settings.RendPostPeriod}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#RendPostPeriod).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.onionServices.<name>.version` {#opt-services.tor.relay.onionServices._name_.version}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceVersion).

*Type:* null or one of 2, 3

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.relay.role` {#opt-services.tor.relay.role}

Your role in Tor network. There're several options:

- `exit`:
  An exit relay. This allows Tor users to access regular
  Internet services through your public IP.

  You can specify which services Tor users may access via
  your exit relay using `settings.ExitPolicy` option.

- `relay`:
  Regular relay. This allows Tor users to relay onion
  traffic to other Tor nodes, but not to public
  Internet.

  See
  [https://www.torproject.org/docs/tor-doc-relay.html.en](https://www.torproject.org/docs/tor-doc-relay.html.en)
  for more info.

- `bridge`:
  Regular bridge. Works like a regular relay, but
  doesn't list you in the public relay directory and
  hides your Tor node behind obfs4proxy.

  Using this option will make Tor advertise your bridge
  to users through various mechanisms like
  [https://bridges.torproject.org/](https://bridges.torproject.org/), though.

  See [https://www.torproject.org/docs/bridges.html.en](https://www.torproject.org/docs/bridges.html.en)
  for more info.

- `private-bridge`:
  Private bridge. Works like regular bridge, but does
  not advertise your node in any way.

  Using this role means that you won't contribute to Tor
  network in any way unless you advertise your node
  yourself in some way.

  Use this if you want to run a private bridge, for
  example because you'll give out your bridge addr
  manually to your friends.

  Switching to this role after measurable time in
  "bridge" role is pretty useless as some Tor users
  would have learned about your node already. In the
  latter case you can still change
  `port` option.

  See [https://www.torproject.org/docs/bridges.html.en](https://www.torproject.org/docs/bridges.html.en)
  for more info.

::: important
Running an exit relay may expose you to abuse
complaints. See
[https://www.torproject.org/faq.html.en#ExitPolicies](https://www.torproject.org/faq.html.en#ExitPolicies)
for more info.
:::

::: important
Note that some misconfigured and/or disrespectful
towards privacy sites will block you even if your
relay is not an exit relay. That is, just being listed
in a public relay directory can have unwanted
consequences.

Which means you might not want to use
this role if you browse public Internet from the same
network as your relay, unless you want to write
e-mails to those sites (you should!).
:::

::: important
WARNING: THE FOLLOWING PARAGRAPH IS NOT LEGAL ADVICE.
Consult with your lawyer when in doubt.

The `bridge` role should be safe to use in most situations
(unless the act of forwarding traffic for others is
a punishable offence under your local laws, which
would be pretty insane as it would make ISP illegal).
:::

*Type:* one of "exit", "relay", "bridge", "private-bridge"

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings` {#opt-services.tor.settings}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en)
for documentation.

*Type:* open submodule of settings option

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AccountingMax` {#opt-services.tor.settings.AccountingMax}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AccountingMax).

*Type:* null or signed integer or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AccountingStart` {#opt-services.tor.settings.AccountingStart}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AccountingStart).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.Address` {#opt-services.tor.settings.Address}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#Address).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AssumeReachable` {#opt-services.tor.settings.AssumeReachable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AssumeReachable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AuthDirHasIPv6Connectivity` {#opt-services.tor.settings.AuthDirHasIPv6Connectivity}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AuthDirHasIPv6Connectivity).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AuthDirListBadExits` {#opt-services.tor.settings.AuthDirListBadExits}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AuthDirListBadExits).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AuthDirPinKeys` {#opt-services.tor.settings.AuthDirPinKeys}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AuthDirPinKeys).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AuthDirSharedRandomness` {#opt-services.tor.settings.AuthDirSharedRandomness}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AuthDirSharedRandomness).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AuthDirTestEd25519LinkKeys` {#opt-services.tor.settings.AuthDirTestEd25519LinkKeys}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AuthDirTestEd25519LinkKeys).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AuthoritativeDirectory` {#opt-services.tor.settings.AuthoritativeDirectory}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AuthoritativeDirectory).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AutomapHostsOnResolve` {#opt-services.tor.settings.AutomapHostsOnResolve}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AutomapHostsOnResolve).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.AutomapHostsSuffixes` {#opt-services.tor.settings.AutomapHostsSuffixes}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#AutomapHostsSuffixes).

*Type:* list of string

*Default:*

``` nix
[
  ".onion"
  ".exit"
]
```

*Example:*

``` nix
[
  ".onion"
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.BandwidthBurst` {#opt-services.tor.settings.BandwidthBurst}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#BandwidthBurst).

*Type:* null or signed integer or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.BandwidthRate` {#opt-services.tor.settings.BandwidthRate}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#BandwidthRate).

*Type:* null or signed integer or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.BridgeAuthoritativeDir` {#opt-services.tor.settings.BridgeAuthoritativeDir}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#BridgeAuthoritativeDir).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.BridgeRecordUsageByCountry` {#opt-services.tor.settings.BridgeRecordUsageByCountry}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#BridgeRecordUsageByCountry).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.BridgeRelay` {#opt-services.tor.settings.BridgeRelay}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#BridgeRelay).

*Type:* null or boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.CacheDirectory` {#opt-services.tor.settings.CacheDirectory}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#CacheDirectory).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.CacheDirectoryGroupReadable` {#opt-services.tor.settings.CacheDirectoryGroupReadable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#CacheDirectoryGroupReadable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.CellStatistics` {#opt-services.tor.settings.CellStatistics}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#CellStatistics).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ClientAutoIPv6ORPort` {#opt-services.tor.settings.ClientAutoIPv6ORPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ClientAutoIPv6ORPort).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ClientDNSRejectInternalAddresses` {#opt-services.tor.settings.ClientDNSRejectInternalAddresses}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ClientDNSRejectInternalAddresses).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ClientOnionAuthDir` {#opt-services.tor.settings.ClientOnionAuthDir}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ClientOnionAuthDir).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ClientPreferIPv6DirPort` {#opt-services.tor.settings.ClientPreferIPv6DirPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ClientPreferIPv6DirPort).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ClientPreferIPv6ORPort` {#opt-services.tor.settings.ClientPreferIPv6ORPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ClientPreferIPv6ORPort).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ClientRejectInternalAddresses` {#opt-services.tor.settings.ClientRejectInternalAddresses}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ClientRejectInternalAddresses).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ClientUseIPv4` {#opt-services.tor.settings.ClientUseIPv4}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ClientUseIPv4).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ClientUseIPv6` {#opt-services.tor.settings.ClientUseIPv6}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ClientUseIPv6).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ConnDirectionStatistics` {#opt-services.tor.settings.ConnDirectionStatistics}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ConnDirectionStatistics).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ConstrainedSockets` {#opt-services.tor.settings.ConstrainedSockets}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ConstrainedSockets).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ContactInfo` {#opt-services.tor.settings.ContactInfo}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ContactInfo).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ControlPort` {#opt-services.tor.settings.ControlPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ControlPort).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule))

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    port = 9051;
  }
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ControlPortFileGroupReadable` {#opt-services.tor.settings.ControlPortFileGroupReadable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ControlPortFileGroupReadable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ControlPortWriteToFile` {#opt-services.tor.settings.ControlPortWriteToFile}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ControlPortWriteToFile).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ControlSocket` {#opt-services.tor.settings.ControlSocket}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ControlSocket).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ControlSocketsGroupWritable` {#opt-services.tor.settings.ControlSocketsGroupWritable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ControlSocketsGroupWritable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.CookieAuthFile` {#opt-services.tor.settings.CookieAuthFile}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#CookieAuthFile).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.CookieAuthFileGroupReadable` {#opt-services.tor.settings.CookieAuthFileGroupReadable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#CookieAuthFileGroupReadable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.CookieAuthentication` {#opt-services.tor.settings.CookieAuthentication}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#CookieAuthentication).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DNSPort` {#opt-services.tor.settings.DNSPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DNSPort).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule) or list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DataDirectory` {#opt-services.tor.settings.DataDirectory}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DataDirectory).

*Type:* null or absolute path

*Default:* `"/var/lib/tor"`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DataDirectoryGroupReadable` {#opt-services.tor.settings.DataDirectoryGroupReadable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DataDirectoryGroupReadable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DirAllowPrivateAddresses` {#opt-services.tor.settings.DirAllowPrivateAddresses}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DirAllowPrivateAddresses).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DirCache` {#opt-services.tor.settings.DirCache}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DirCache).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DirPolicy` {#opt-services.tor.settings.DirPolicy}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DirPolicy).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "accept *:*"
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DirPort` {#opt-services.tor.settings.DirPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DirPort).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule))

*Default:* `[ ]`

*Example:* `443`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DirPortFrontPage` {#opt-services.tor.settings.DirPortFrontPage}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DirPortFrontPage).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DirReqStatistics` {#opt-services.tor.settings.DirReqStatistics}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DirReqStatistics).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DisableAllSwap` {#opt-services.tor.settings.DisableAllSwap}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DisableAllSwap).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DisableDebuggerAttachment` {#opt-services.tor.settings.DisableDebuggerAttachment}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DisableDebuggerAttachment).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DisableNetwork` {#opt-services.tor.settings.DisableNetwork}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DisableNetwork).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DisableOOSCheck` {#opt-services.tor.settings.DisableOOSCheck}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DisableOOSCheck).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DoSCircuitCreationEnabled` {#opt-services.tor.settings.DoSCircuitCreationEnabled}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DoSCircuitCreationEnabled).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DoSConnectionEnabled` {#opt-services.tor.settings.DoSConnectionEnabled}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DoSConnectionEnabled).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DoSRefuseSingleHopClientRendezvous` {#opt-services.tor.settings.DoSRefuseSingleHopClientRendezvous}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DoSRefuseSingleHopClientRendezvous).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DormantCanceledByStartup` {#opt-services.tor.settings.DormantCanceledByStartup}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DormantCanceledByStartup).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DormantOnFirstStartup` {#opt-services.tor.settings.DormantOnFirstStartup}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DormantOnFirstStartup).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DormantTimeoutDisabledByIdleStreams` {#opt-services.tor.settings.DormantTimeoutDisabledByIdleStreams}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DormantTimeoutDisabledByIdleStreams).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.DownloadExtraInfo` {#opt-services.tor.settings.DownloadExtraInfo}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#DownloadExtraInfo).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.EnforceDistinctSubnets` {#opt-services.tor.settings.EnforceDistinctSubnets}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#EnforceDistinctSubnets).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.EntryStatistics` {#opt-services.tor.settings.EntryStatistics}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#EntryStatistics).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExitPolicy` {#opt-services.tor.settings.ExitPolicy}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExitPolicy).

*Type:* list of string

*Default:*

``` nix
[
  "reject *:*"
]
```

*Example:*

``` nix
[
  "accept *:*"
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExitPolicyRejectLocalInterfaces` {#opt-services.tor.settings.ExitPolicyRejectLocalInterfaces}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExitPolicyRejectLocalInterfaces).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExitPolicyRejectPrivate` {#opt-services.tor.settings.ExitPolicyRejectPrivate}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExitPolicyRejectPrivate).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExitPortStatistics` {#opt-services.tor.settings.ExitPortStatistics}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExitPortStatistics).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExitRelay` {#opt-services.tor.settings.ExitRelay}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExitRelay).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExtORPort` {#opt-services.tor.settings.ExtORPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExtORPort).

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExtORPortCookieAuthFile` {#opt-services.tor.settings.ExtORPortCookieAuthFile}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExtORPortCookieAuthFile).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExtORPortCookieAuthFileGroupReadable` {#opt-services.tor.settings.ExtORPortCookieAuthFileGroupReadable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExtORPortCookieAuthFileGroupReadable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExtendAllowPrivateAddresses` {#opt-services.tor.settings.ExtendAllowPrivateAddresses}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExtendAllowPrivateAddresses).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ExtraInfoStatistics` {#opt-services.tor.settings.ExtraInfoStatistics}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ExtraInfoStatistics).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.FascistFirewall` {#opt-services.tor.settings.FascistFirewall}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#FascistFirewall).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.FetchDirInfoEarly` {#opt-services.tor.settings.FetchDirInfoEarly}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#FetchDirInfoEarly).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.FetchDirInfoExtraEarly` {#opt-services.tor.settings.FetchDirInfoExtraEarly}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#FetchDirInfoExtraEarly).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.FetchHidServDescriptors` {#opt-services.tor.settings.FetchHidServDescriptors}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#FetchHidServDescriptors).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.FetchServerDescriptors` {#opt-services.tor.settings.FetchServerDescriptors}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#FetchServerDescriptors).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.FetchUselessDescriptors` {#opt-services.tor.settings.FetchUselessDescriptors}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#FetchUselessDescriptors).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.GeoIPFile` {#opt-services.tor.settings.GeoIPFile}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#GeoIPFile).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.GeoIPv6File` {#opt-services.tor.settings.GeoIPv6File}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#GeoIPv6File).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.GuardfractionFile` {#opt-services.tor.settings.GuardfractionFile}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#GuardfractionFile).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.HSLayer2Nodes` {#opt-services.tor.settings.HSLayer2Nodes}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HSLayer2Nodes).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.HSLayer3Nodes` {#opt-services.tor.settings.HSLayer3Nodes}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HSLayer3Nodes).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.HTTPTunnelPort` {#opt-services.tor.settings.HTTPTunnelPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HTTPTunnelPort).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule) or list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.HidServAuth` {#opt-services.tor.settings.HidServAuth}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HidServAuth).

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    auth = "xxxxxxxxxxxxxxxxxxxxxx";
    onion = "xxxxxxxxxxxxxxxx.onion";
  }
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.HidServAuth.*.auth` {#opt-services.tor.settings.HidServAuth._.auth}

Authentication cookie.

*Type:* string matching the pattern \[A-Za-z0-9+/\]{22}

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.HidServAuth.*.onion` {#opt-services.tor.settings.HidServAuth._.onion}

Onion address.

*Type:* string matching the pattern \[a-z2-7\]{16}.onion

*Example:* `"xxxxxxxxxxxxxxxx.onion"`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.HiddenServiceNonAnonymousMode` {#opt-services.tor.settings.HiddenServiceNonAnonymousMode}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceNonAnonymousMode).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.HiddenServiceStatistics` {#opt-services.tor.settings.HiddenServiceStatistics}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#HiddenServiceStatistics).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.IPv6Exit` {#opt-services.tor.settings.IPv6Exit}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#IPv6Exit).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.KeyDirectory` {#opt-services.tor.settings.KeyDirectory}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#KeyDirectory).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.KeyDirectoryGroupReadable` {#opt-services.tor.settings.KeyDirectoryGroupReadable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#KeyDirectoryGroupReadable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.LogMessageDomains` {#opt-services.tor.settings.LogMessageDomains}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#LogMessageDomains).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.LongLivedPorts` {#opt-services.tor.settings.LongLivedPorts}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#LongLivedPorts).

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.MainloopStats` {#opt-services.tor.settings.MainloopStats}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#MainloopStats).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.MaxAdvertisedBandwidth` {#opt-services.tor.settings.MaxAdvertisedBandwidth}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#MaxAdvertisedBandwidth).

*Type:* null or signed integer or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.MaxCircuitDirtiness` {#opt-services.tor.settings.MaxCircuitDirtiness}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#MaxCircuitDirtiness).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.MaxClientCircuitsPending` {#opt-services.tor.settings.MaxClientCircuitsPending}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#MaxClientCircuitsPending).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.NATDPort` {#opt-services.tor.settings.NATDPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#NATDPort).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule) or list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.NewCircuitPeriod` {#opt-services.tor.settings.NewCircuitPeriod}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#NewCircuitPeriod).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.Nickname` {#opt-services.tor.settings.Nickname}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#Nickname).

*Type:* null or string matching the pattern ^\[a-zA-Z0-9\]{1,19}$

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ORPort` {#opt-services.tor.settings.ORPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ORPort).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule))

*Default:* `[ ]`

*Example:* `443`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.OfflineMasterKey` {#opt-services.tor.settings.OfflineMasterKey}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#OfflineMasterKey).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.OptimisticData` {#opt-services.tor.settings.OptimisticData}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#OptimisticData).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.PaddingStatistics` {#opt-services.tor.settings.PaddingStatistics}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#PaddingStatistics).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.PerConnBWBurst` {#opt-services.tor.settings.PerConnBWBurst}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#PerConnBWBurst).

*Type:* null or signed integer or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.PerConnBWRate` {#opt-services.tor.settings.PerConnBWRate}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#PerConnBWRate).

*Type:* null or signed integer or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.PidFile` {#opt-services.tor.settings.PidFile}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#PidFile).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ProtocolWarnings` {#opt-services.tor.settings.ProtocolWarnings}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ProtocolWarnings).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.PublishHidServDescriptors` {#opt-services.tor.settings.PublishHidServDescriptors}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#PublishHidServDescriptors).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.PublishServerDescriptor` {#opt-services.tor.settings.PublishServerDescriptor}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#PublishServerDescriptor).

*Type:* null or one of false, true, 0, 1, "0", "1", "v3", "bridge"

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ReachableAddresses` {#opt-services.tor.settings.ReachableAddresses}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ReachableAddresses).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ReachableDirAddresses` {#opt-services.tor.settings.ReachableDirAddresses}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ReachableDirAddresses).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ReachableORAddresses` {#opt-services.tor.settings.ReachableORAddresses}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ReachableORAddresses).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ReducedExitPolicy` {#opt-services.tor.settings.ReducedExitPolicy}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ReducedExitPolicy).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.RefuseUnknownExits` {#opt-services.tor.settings.RefuseUnknownExits}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#RefuseUnknownExits).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.RejectPlaintextPorts` {#opt-services.tor.settings.RejectPlaintextPorts}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#RejectPlaintextPorts).

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.RelayBandwidthBurst` {#opt-services.tor.settings.RelayBandwidthBurst}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#RelayBandwidthBurst).

*Type:* null or signed integer or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.RelayBandwidthRate` {#opt-services.tor.settings.RelayBandwidthRate}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#RelayBandwidthRate).

*Type:* null or signed integer or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.SOCKSPort` {#opt-services.tor.settings.SOCKSPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#SOCKSPort).

*Type:* list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or (submodule))

*Default:*

``` nix
if config.services.tor.settings.HiddenServiceNonAnonymousMode == true
then [ { port = 0; } ]
else [ ]
```

*Example:*

``` nix
[
  {
    port = 9090;
  }
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.Sandbox` {#opt-services.tor.settings.Sandbox}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#Sandbox).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerDNSAllowBrokenConfig` {#opt-services.tor.settings.ServerDNSAllowBrokenConfig}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ServerDNSAllowBrokenConfig).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerDNSAllowNonRFC953Hostnames` {#opt-services.tor.settings.ServerDNSAllowNonRFC953Hostnames}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ServerDNSAllowNonRFC953Hostnames).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerDNSDetectHijacking` {#opt-services.tor.settings.ServerDNSDetectHijacking}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ServerDNSDetectHijacking).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerDNSRandomizeCase` {#opt-services.tor.settings.ServerDNSRandomizeCase}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ServerDNSRandomizeCase).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerDNSResolvConfFile` {#opt-services.tor.settings.ServerDNSResolvConfFile}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ServerDNSResolvConfFile).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerDNSSearchDomains` {#opt-services.tor.settings.ServerDNSSearchDomains}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ServerDNSSearchDomains).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerTransportPlugin` {#opt-services.tor.settings.ServerTransportPlugin}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ServerTransportPlugin).

*Type:* null or (submodule)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerTransportPlugin.exec` {#opt-services.tor.settings.ServerTransportPlugin.exec}

Command of pluggable transport.

*Type:* string

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ServerTransportPlugin.transports` {#opt-services.tor.settings.ServerTransportPlugin.transports}

List of pluggable transports.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "obfs2"
  "obfs3"
  "obfs4"
  "scramblesuit"
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.ShutdownWaitLength` {#opt-services.tor.settings.ShutdownWaitLength}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#ShutdownWaitLength).

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.SocksPolicy` {#opt-services.tor.settings.SocksPolicy}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#SocksPolicy).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "accept *:*"
]
```

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.TestingTorNetwork` {#opt-services.tor.settings.TestingTorNetwork}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#TestingTorNetwork).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.TransPort` {#opt-services.tor.settings.TransPort}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#TransPort).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule) or list of (16 bit unsigned integer; between 0 and 65535 (both inclusive) or value "auto" (singular enum) or (submodule))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.TransProxyType` {#opt-services.tor.settings.TransProxyType}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#TransProxyType).

*Type:* null or one of "default", "TPROXY", "ipfw", "pf-divert"

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.UnixSocksGroupWritable` {#opt-services.tor.settings.UnixSocksGroupWritable}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#UnixSocksGroupWritable).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.UseDefaultFallbackDirs` {#opt-services.tor.settings.UseDefaultFallbackDirs}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#UseDefaultFallbackDirs).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.UseMicrodescriptors` {#opt-services.tor.settings.UseMicrodescriptors}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#UseMicrodescriptors).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.V3AuthUseLegacyKey` {#opt-services.tor.settings.V3AuthUseLegacyKey}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#V3AuthUseLegacyKey).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.V3AuthoritativeDirectory` {#opt-services.tor.settings.V3AuthoritativeDirectory}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#V3AuthoritativeDirectory).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.VersioningAuthoritativeDirectory` {#opt-services.tor.settings.VersioningAuthoritativeDirectory}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#VersioningAuthoritativeDirectory).

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.VirtualAddrNetworkIPv4` {#opt-services.tor.settings.VirtualAddrNetworkIPv4}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#VirtualAddrNetworkIPv4).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.VirtualAddrNetworkIPv6` {#opt-services.tor.settings.VirtualAddrNetworkIPv6}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#VirtualAddrNetworkIPv6).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.settings.WarnPlaintextPorts` {#opt-services.tor.settings.WarnPlaintextPorts}

See [torrc manual](https://2019.www.torproject.org/docs/tor-manual.html.en#WarnPlaintextPorts).

*Type:* list of 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/tor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tor.nix)

## `services.tor.torsocks.allowInbound` {#opt-services.tor.torsocks.allowInbound}

Set Torsocks to accept inbound connections. If set to
`true`, listen() and accept() will be
allowed to be used with non localhost address.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/torsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torsocks.nix)

## `services.tor.torsocks.enable` {#opt-services.tor.torsocks.enable}

Whether to build `/etc/tor/torsocks.conf`
containing the specified global torsocks configuration.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/torsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torsocks.nix)

## `services.tor.torsocks.fasterServer` {#opt-services.tor.torsocks.fasterServer}

IP/Port of the Tor SOCKS server for torsocks-faster wrapper suitable for HTTP.
Currently, hostnames are NOT supported by torsocks.

*Type:* string

*Default:* `"127.0.0.1:9063"`

*Example:* `"192.168.0.20:1234"`

*Declared by:* [`nixos/modules/services/security/torsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torsocks.nix)

## `services.tor.torsocks.onionAddrRange` {#opt-services.tor.torsocks.onionAddrRange}

Tor hidden sites do not have real IP addresses. This
specifies what range of IP addresses will be handed to the
application as "cookies" for .onion names.  Of course, you
should pick a block of addresses which you aren't going to
ever need to actually connect to. This is similar to the
MapAddress feature of the main tor daemon.

*Type:* string

*Default:* `"127.42.42.0/24"`

*Declared by:* [`nixos/modules/services/security/torsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torsocks.nix)

## `services.tor.torsocks.server` {#opt-services.tor.torsocks.server}

IP/Port of the Tor SOCKS server. Currently, hostnames are
NOT supported by torsocks.

*Type:* string

*Default:* `"127.0.0.1:9050"`

*Example:* `"192.168.0.20:1234"`

*Declared by:* [`nixos/modules/services/security/torsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torsocks.nix)

## `services.tor.torsocks.socks5Password` {#opt-services.tor.torsocks.socks5Password}

SOCKS5 password. The `TORSOCKS_PASSWORD`
environment variable overrides this option if it is set.

*Type:* null or string

*Default:* `null`

*Example:* `"sekret"`

*Declared by:* [`nixos/modules/services/security/torsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torsocks.nix)

## `services.tor.torsocks.socks5Username` {#opt-services.tor.torsocks.socks5Username}

SOCKS5 username. The `TORSOCKS_USERNAME`
environment variable overrides this option if it is set.

*Type:* null or string

*Default:* `null`

*Example:* `"bob"`

*Declared by:* [`nixos/modules/services/security/torsocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torsocks.nix)

## `services.tor.tsocks.config` {#opt-services.tor.tsocks.config}

Extra configuration. Contents will be added verbatim to TSocks
configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/security/torify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torify.nix)

## `services.tor.tsocks.enable` {#opt-services.tor.tsocks.enable}

Whether to build tsocks wrapper script to relay application traffic via Tor.

::: important
You shouldn't use this unless you know what you're
doing because your installation of Tor already comes with
its own superior (doesn't leak DNS queries)
`torsocks` wrapper which does pretty much
exactly the same thing as this.
:::

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/torify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torify.nix)

## `services.tor.tsocks.server` {#opt-services.tor.tsocks.server}

IP address of TOR client to use.

*Type:* string

*Default:* `"localhost:9050"`

*Example:* `"192.168.0.20"`

*Declared by:* [`nixos/modules/services/security/torify.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/torify.nix)

## `services.torque.mom.enable` {#opt-services.torque.mom.enable}

Whether to enable torque computing node.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/computing/torque/mom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/torque/mom.nix)

## `services.torque.mom.serverNode` {#opt-services.torque.mom.serverNode}

Hostname running pbs server.

*Type:* string

*Declared by:* [`nixos/modules/services/computing/torque/mom.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/torque/mom.nix)

## `services.torque.server.enable` {#opt-services.torque.server.enable}

Whether to enable torque server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/computing/torque/server.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/torque/server.nix)

## `services.torrentstream.address` {#opt-services.torrentstream.address}

Address to listen on.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/torrent/torrentstream.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/torrentstream.nix)

## `services.torrentstream.enable` {#opt-services.torrentstream.enable}

Whether to enable TorrentStream daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/torrentstream.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/torrentstream.nix)

## `services.torrentstream.openFirewall` {#opt-services.torrentstream.openFirewall}

Open ports in the firewall for TorrentStream daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/torrentstream.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/torrentstream.nix)

## `services.torrentstream.package` {#opt-services.torrentstream.package}

The torrentstream package to use.

*Type:* package

*Default:* `pkgs.torrentstream`

*Declared by:* [`nixos/modules/services/torrent/torrentstream.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/torrentstream.nix)

## `services.torrentstream.port` {#opt-services.torrentstream.port}

TorrentStream port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5082`

*Declared by:* [`nixos/modules/services/torrent/torrentstream.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/torrentstream.nix)

## `services.touchegg.enable` {#opt-services.touchegg.enable}

Whether to enable touchegg, a multi-touch gesture recognizer.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/x11/touchegg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/touchegg.nix)

## `services.touchegg.package` {#opt-services.touchegg.package}

The touchegg package to use.

*Type:* package

*Default:* `pkgs.touchegg`

*Declared by:* [`nixos/modules/services/x11/touchegg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/touchegg.nix)

## `services.tox-node.enable` {#opt-services.tox-node.enable}

Whether to enable Tox Node service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.tox-node.keysFile` {#opt-services.tox-node.keysFile}

Path to the file where DHT keys are stored.

*Type:* string

*Default:* `"/var/lib/tox-node/keys"`

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.tox-node.lanDiscovery` {#opt-services.tox-node.lanDiscovery}

Enable local network discovery.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.tox-node.logType` {#opt-services.tox-node.logType}

Logging implementation.

*Type:* one of "Stderr", "Stdout", "Syslog", "None"

*Default:* `"Stderr"`

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.tox-node.motd` {#opt-services.tox-node.motd}

Message of the day

*Type:* string

*Default:* `"Hi from tox-rs! I'm up {{uptime}}. TCP: incoming {{tcp_packets_in}}, outgoing {{tcp_packets_out}}, UDP: incoming {{udp_packets_in}}, outgoing {{udp_packets_out}}"`

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.tox-node.tcpAddresses` {#opt-services.tox-node.tcpAddresses}

TCP addresses to run TCP relay.

*Type:* list of string

*Default:*

``` nix
[
  "0.0.0.0:33445"
]
```

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.tox-node.tcpConnectionLimit` {#opt-services.tox-node.tcpConnectionLimit}

Maximum number of active TCP connections relay can hold

*Type:* signed integer

*Default:* `8192`

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.tox-node.threads` {#opt-services.tox-node.threads}

Number of threads for execution

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.tox-node.udpAddress` {#opt-services.tox-node.udpAddress}

UDP address to run DHT node.

*Type:* string

*Default:* `"0.0.0.0:33445"`

*Declared by:* [`nixos/modules/services/networking/tox-node.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-node.nix)

## `services.toxBootstrapd.enable` {#opt-services.toxBootstrapd.enable}

Whether to enable the Tox DHT bootstrap daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/tox-bootstrapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-bootstrapd.nix)

## `services.toxBootstrapd.extraConfig` {#opt-services.toxBootstrapd.extraConfig}

Configuration for bootstrap daemon.
See [https://github.com/irungentoo/toxcore/blob/master/other/bootstrap\_daemon/tox-bootstrapd.conf](https://github.com/irungentoo/toxcore/blob/master/other/bootstrap_daemon/tox-bootstrapd.conf)
and [https://wiki.tox.chat/users/nodes](https://wiki.tox.chat/users/nodes).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/tox-bootstrapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-bootstrapd.nix)

## `services.toxBootstrapd.keysFile` {#opt-services.toxBootstrapd.keysFile}

Node key file.

*Type:* string

*Default:* `"/var/lib/tox-bootstrapd/keys"`

*Declared by:* [`nixos/modules/services/networking/tox-bootstrapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-bootstrapd.nix)

## `services.toxBootstrapd.port` {#opt-services.toxBootstrapd.port}

Listening port (UDP).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `33445`

*Declared by:* [`nixos/modules/services/networking/tox-bootstrapd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/tox-bootstrapd.nix)

## `services.toxvpn.auto_add_peers` {#opt-services.toxvpn.auto_add_peers}

peers to automatically connect to on startup

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "toxid1"
  "toxid2"
]
```

*Declared by:* [`nixos/modules/services/networking/toxvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/toxvpn.nix)

## `services.toxvpn.enable` {#opt-services.toxvpn.enable}

Whether to enable toxvpn running on startup.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/toxvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/toxvpn.nix)

## `services.toxvpn.localip` {#opt-services.toxvpn.localip}

your ip on the vpn

*Type:* string

*Default:* `"10.123.123.1"`

*Declared by:* [`nixos/modules/services/networking/toxvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/toxvpn.nix)

## `services.toxvpn.port` {#opt-services.toxvpn.port}

udp port for toxcore, port-forward to help with connectivity if you run many nodes behind one NAT

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `33445`

*Declared by:* [`nixos/modules/services/networking/toxvpn.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/toxvpn.nix)

## `services.tp-auto-kbbl.arguments` {#opt-services.tp-auto-kbbl.arguments}

List of arguments appended to `./tp-auto-kbbl --device [device] [arguments]`

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/misc/tp-auto-kbbl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tp-auto-kbbl.nix)

## `services.tp-auto-kbbl.device` {#opt-services.tp-auto-kbbl.device}

Device watched for activities.

*Type:* string

*Default:* `"/dev/input/event0"`

*Declared by:* [`nixos/modules/services/misc/tp-auto-kbbl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tp-auto-kbbl.nix)

## `services.tp-auto-kbbl.enable` {#opt-services.tp-auto-kbbl.enable}

Whether to enable auto toggle keyboard back-lighting on Thinkpads (and maybe other laptops) for Linux.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/tp-auto-kbbl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tp-auto-kbbl.nix)

## `services.tp-auto-kbbl.package` {#opt-services.tp-auto-kbbl.package}

The tp-auto-kbbl package to use.

*Type:* package

*Default:* `pkgs.tp-auto-kbbl`

*Declared by:* [`nixos/modules/services/misc/tp-auto-kbbl.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tp-auto-kbbl.nix)

## `services.traccar.enable` {#opt-services.traccar.enable}

Whether to enable Traccar, an open source GPS tracking system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/traccar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/traccar.nix)

## `services.traccar.environment` {#opt-services.traccar.environment}

Extra environment variables to pass to Traccar. Secrets should be passed
using the [`services.traccar.environmentFile`](#opt-services.traccar.environmentFile) option instead.

See [the documentation](https://www.traccar.org/configuration-file/)
for more information.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  CONFIG_USE_ENVIRONMENT_VARIABLES = "true";
  DATABASE_URL = "jdbc:postgresql://localhost/traccar?socketFactory=org.newsclub.net.unix.AFUNIXSocketFactory$FactoryArg&socketFactoryArg=/run/postgresql/.s.PGSQL.5432";
}
```

*Declared by:* [`nixos/modules/services/monitoring/traccar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/traccar.nix)

## `services.traccar.environmentFile` {#opt-services.traccar.environmentFile}

File containing environment variables to substitute in the configuration before starting Traccar.

Can be used for storing the secrets without making them available in the world-readable Nix store.

For example, you can set `services.traccar.settings.database.password = "$TRACCAR_DB_PASSWORD"`
and then specify `TRACCAR_DB_PASSWORD="<secret>"` in the environment file.
This value will get substituted in the configuration file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/traccar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/traccar.nix)

## `services.traccar.package` {#opt-services.traccar.package}

The traccar package to use.

*Type:* package

*Default:* `pkgs.traccar`

*Declared by:* [`nixos/modules/services/monitoring/traccar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/traccar.nix)

## `services.traccar.settings` {#opt-services.traccar.settings}

`config.xml` configuration as a Nix attribute set.
This option is ignored if `settingsFile` is set.

Nested attributes get translated to a properties entry in the traccar configuration.
For instance: `mail.smtp.port = "25"` results in the following entry:
`<entry key='mail.smtp.port'>25</entry>`

Secrets should be specified using `environmentFile`
instead of this world-readable attribute set.
[Traccar - Configuration File](https://www.traccar.org/configuration-file/).

*Type:* unspecified value

*Default:*

``` nix
{
  database = {
    driver = "org.h2.Driver";
    password = "";
    url = "jdbc:h2:/var/lib/traccar/traccar";
    user = "sa";
  };
  logger = {
    console = "true";
  };
  web = {
    override = "/var/lib/traccar/override";
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/traccar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/traccar.nix)

## `services.traccar.settingsFile` {#opt-services.traccar.settingsFile}

File used as configuration for traccar. When specified, `settings` is ignored.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/traccar.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/traccar.nix)

## `services.traefik.dataDir` {#opt-services.traefik.dataDir}

Location for any persistent data traefik creates, ie. acme

*Type:* absolute path

*Default:* `"/var/lib/traefik"`

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.traefik.dynamicConfigFile` {#opt-services.traefik.dynamicConfigFile}

Path to traefik's dynamic configuration to use.
(Using that option has precedence over `dynamicConfigOptions`)

*Type:* null or absolute path

*Default:* `null`

*Example:* `/path/to/dynamic_config.toml`

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.traefik.dynamicConfigOptions` {#opt-services.traefik.dynamicConfigOptions}

Dynamic configuration for Traefik.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  http = {
    routers = {
      router1 = {
        rule = "Host(`localhost`)";
        service = "service1";
      };
    };
    services = {
      service1 = {
        loadBalancer = {
          servers = [
            {
              url = "http://localhost:8080";
            }
          ];
        };
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.traefik.enable` {#opt-services.traefik.enable}

Whether to enable Traefik web server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.traefik.environmentFiles` {#opt-services.traefik.environmentFiles}

Files to load as environment file. Environment variables from this file
will be substituted into the static configuration file using envsubst.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/secrets/traefik.env"
]
```

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.traefik.group` {#opt-services.traefik.group}

Set the group that traefik runs under.
For the docker backend this needs to be set to `docker` instead.

*Type:* string

*Default:* `"traefik"`

*Example:* `"docker"`

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.traefik.package` {#opt-services.traefik.package}

The traefik package to use.

*Type:* package

*Default:* `pkgs.traefik`

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.traefik.staticConfigFile` {#opt-services.traefik.staticConfigFile}

Path to traefik's static configuration to use.
(Using that option has precedence over `staticConfigOptions` and `dynamicConfigOptions`)

*Type:* null or absolute path

*Default:* `null`

*Example:* `/path/to/static_config.toml`

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.traefik.staticConfigOptions` {#opt-services.traefik.staticConfigOptions}

Static configuration for Traefik.

*Type:* TOML value

*Default:*

``` nix
{
  entryPoints = {
    http = {
      address = ":80";
    };
  };
}
```

*Example:*

``` nix
{
  api = { };
  entryPoints = {
    http = {
      address = ":80";
    };
    web = {
      address = ":8080";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/traefik.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/traefik.nix)

## `services.trafficserver.cache` {#opt-services.trafficserver.cache}

Caching rules that overrule the origin's caching policy.

Consult the [upstream
documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/cache.config.en.html) for more details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"dest_domain=example.com suffix=js action=never-cache"`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.enable` {#opt-services.trafficserver.enable}

Whether to enable Apache Traffic Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.hosting` {#opt-services.trafficserver.hosting}

Partition the cache according to origin server or domain

Consult the [
upstream documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/hosting.config.en.html) for more details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"domain=example.com volume=1"`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.ipAllow` {#opt-services.trafficserver.ipAllow}

Control client access to Traffic Server and Traffic Server connections
to upstream servers.

Consult the [upstream
documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/ip_allow.yaml.en.html) for more details.

*Type:* null or YAML 1.1 value

*Default:* upstream defaults

*Example:*

``` nix
{
  ip_allow = [{
    apply = "in";
    ip_addrs = "127.0.0.1";
    action = "allow";
    methods = "ALL";
  }];
}
```

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.logging` {#opt-services.trafficserver.logging}

Configure logs.

Consult the [upstream
documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/logging.yaml.en.html) for more details.

*Type:* null or YAML 1.1 value

*Default:* upstream defaults

*Example:* `{ }`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.parent` {#opt-services.trafficserver.parent}

Identify the parent proxies used in an cache hierarchy.

Consult the [upstream
documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/parent.config.en.html) for more details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  dest_domain=. method=get parent="p1.example:8080; p2.example:8080" round_robin=true
''
```

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.plugins` {#opt-services.trafficserver.plugins}

Controls run-time loadable plugins available to Traffic Server, as
well as their configuration.

Consult the [upstream
documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/plugin.config.en.html) for more details.

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.plugins.*.arg` {#opt-services.trafficserver.plugins._.arg}

arguments to pass to the plugin

*Type:* string

*Default:* `""`

*Example:* `"--header=ATS-My-Debug"`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.plugins.*.path` {#opt-services.trafficserver.plugins._.path}

Path to plugin. The path can either be absolute, or relative to
the plugin directory.

*Type:* string

*Example:* `"xdebug.so"`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.records` {#opt-services.trafficserver.records}

List of configurable variables used by Traffic Server.

Consult the [
upstream documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/records.config.en.html) for more details.

*Type:* Traffic Server records value

*Default:* `{ }`

*Example:*

``` nix
{
  proxy = {
    config = {
      proxy_name = "my_server";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.remap` {#opt-services.trafficserver.remap}

URL remapping rules used by Traffic Server.

Consult the [
upstream documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/remap.config.en.html) for more details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"map http://from.example http://origin.example"`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.sni` {#opt-services.trafficserver.sni}

Configure aspects of TLS connection handling for both inbound and
outbound connections.

Consult the [upstream
documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/sni.yaml.en.html) for more details.

*Type:* null or YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
{
  sni = [{
    fqdn = "no-http2.example.com";
    https = "off";
  }];
}
```

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.splitDns` {#opt-services.trafficserver.splitDns}

Specify the DNS server that Traffic Server should use under specific
conditions.

Consult the [
upstream documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/splitdns.config.en.html) for more details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  dest_domain=internal.corp.example named="255.255.255.255:212 255.255.255.254" def_domain=corp.example search_list="corp.example corp1.example"
  dest_domain=!internal.corp.example named=255.255.255.253
''
```

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.sslMulticert` {#opt-services.trafficserver.sslMulticert}

Configure SSL server certificates to terminate the SSL sessions.

Consult the [
upstream documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/ssl_multicert.config.en.html) for more details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"dest_ip=* ssl_cert_name=default.pem"`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.storage` {#opt-services.trafficserver.storage}

List all the storage that make up the Traffic Server cache.

Consult the [
upstream documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/storage.config.en.html) for more details.

*Type:* strings concatenated with "\\n"

*Default:* `"/var/cache/trafficserver 256M"`

*Example:* `"/dev/disk/by-id/XXXXX volume=1"`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.strategies` {#opt-services.trafficserver.strategies}

Specify the next hop proxies used in an cache hierarchy and the
algorithms used to select the next proxy.

Consult the [
upstream documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/strategies.yaml.en.html) for more details.

*Type:* null or YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.trafficserver.volume` {#opt-services.trafficserver.volume}

Manage cache space more efficiently and restrict disk usage by
creating cache volumes of different sizes.

Consult the [
upstream documentation](https://docs.trafficserver.apache.org/en/latest/admin-guide/files/volume.config.en.html) for more details.

*Type:* null or YAML 1.1 value

*Default:* `""`

*Example:* `"volume=1 scheme=http size=20%"`

*Declared by:* [`nixos/modules/services/web-servers/trafficserver/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/trafficserver/default.nix)

## `services.tranquil-pds.dataDir` {#opt-services.tranquil-pds.dataDir}

Working directory for tranquil-pds. Also expected to be used for data (blobs)

*Type:* string

*Default:* `"/var/lib/tranquil-pds"`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.database.createLocally` {#opt-services.tranquil-pds.database.createLocally}

Create the postgres database and user on the local host.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.enable` {#opt-services.tranquil-pds.enable}

Whether to enable tranquil-pds AT Protocol personal data server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.environmentFiles` {#opt-services.tranquil-pds.environmentFiles}

File to load environment variables from. Loaded variables override
values set in `environment`.

Use it to set values of `JWT_SECRET`, `DPOP_SECRET` and `MASTER_KEY`.

Generate these with:

```
openssl rand -base64 48
```

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.group` {#opt-services.tranquil-pds.group}

Group under which tranquil-pds runs

*Type:* string

*Default:* `"tranquil-pds"`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.package` {#opt-services.tranquil-pds.package}

The tranquil-pds package to use.

*Type:* package

*Default:* `pkgs.tranquil-pds`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings` {#opt-services.tranquil-pds.settings}

Configuration options to set for the service. Secrets should be
specified using `environmentFile`.

Refer to [https://tangled.org/tranquil.farm/tranquil-pds/blob/main/example.toml](https://tangled.org/tranquil.farm/tranquil-pds/blob/main/example.toml)
for available configuration options.

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings.frontend.dir` {#opt-services.tranquil-pds.settings.frontend.dir}

The tranquil-pds-frontend package to use.

*Type:* package

*Default:* `pkgs.tranquil-pds-frontend`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings.frontend.enabled` {#opt-services.tranquil-pds.settings.frontend.enabled}

Whether to enable serving the frontend from the backend. Disable to serve the frontend manually.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings.server.host` {#opt-services.tranquil-pds.settings.server.host}

Host for tranquil-pds to listen on

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings.server.hostname` {#opt-services.tranquil-pds.settings.server.hostname}

The public-facing hostname of the PDS

*Type:* string

*Default:* `""`

*Example:* `"pds.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings.server.max_blob_size` {#opt-services.tranquil-pds.settings.server.max_blob_size}

Maximum allowed blob size in bytes.

*Type:* signed integer

*Default:* `10737418240`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings.server.port` {#opt-services.tranquil-pds.settings.server.port}

Port for tranquil-pds to listen on

*Type:* signed integer

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings.storage.path` {#opt-services.tranquil-pds.settings.storage.path}

Directory for storing blobs

*Type:* absolute path

*Default:* `"\${cfg.dataDir}/blobs"`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.settings.tranquil_store.data_dir` {#opt-services.tranquil-pds.settings.tranquil_store.data_dir}

Directory for tranquil-store files

*Type:* absolute path

*Default:* `"\${cfg.dataDir}/store"`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.tranquil-pds.user` {#opt-services.tranquil-pds.user}

User under which tranquil-pds runs

*Type:* string

*Default:* `"tranquil-pds"`

*Declared by:* [`nixos/modules/services/web-apps/tranquil-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tranquil-pds.nix)

## `services.transfer-sh.enable` {#opt-services.transfer-sh.enable}

Whether to enable Easy and fast file sharing from the command-line.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/transfer-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/transfer-sh.nix)

## `services.transfer-sh.package` {#opt-services.transfer-sh.package}

The transfer-sh package to use.

*Type:* package

*Default:* `pkgs.transfer-sh`

*Declared by:* [`nixos/modules/services/misc/transfer-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/transfer-sh.nix)

## `services.transfer-sh.provider` {#opt-services.transfer-sh.provider}

Storage providers to use

*Type:* one of "local", "s3", "storj", "gdrive"

*Default:* `"local"`

*Declared by:* [`nixos/modules/services/misc/transfer-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/transfer-sh.nix)

## `services.transfer-sh.secretFile` {#opt-services.transfer-sh.secretFile}

Path to file containing environment variables.
Useful for passing down secrets.
Some variables that can be considered secrets are:

- AWS\_ACCESS\_KEY
- AWS\_ACCESS\_KEY
- TLS\_PRIVATE\_KEY
- HTTP\_AUTH\_HTPASSWD

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/transfer-sh.env"`

*Declared by:* [`nixos/modules/services/misc/transfer-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/transfer-sh.nix)

## `services.transfer-sh.settings` {#opt-services.transfer-sh.settings}

Additional configuration for transfer-sh, see
[https://github.com/dutchcoders/transfer.sh#usage-1](https://github.com/dutchcoders/transfer.sh#usage-1)
for supported values.

For secrets use secretFile option instead.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  BASEDIR = "/var/lib/transfer.sh";
  LISTENER = ":8080";
  TLS_LISTENER_ONLY = false;
}
```

*Declared by:* [`nixos/modules/services/misc/transfer-sh.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/transfer-sh.nix)

## `services.transmission.credentialsFile` {#opt-services.transmission.credentialsFile}

Path to a JSON file to be merged with the settings.
Useful to merge a file which is better kept out of the Nix store
to set secret config parameters like `rpc-password`.

*Type:* absolute path

*Default:* `"/dev/null"`

*Example:* `"/var/lib/secrets/transmission/settings.json"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.downloadDirPermissions` {#opt-services.transmission.downloadDirPermissions}

If not `null`, is used as the permissions set by
`transmission-setup.service` on the directories
[services (T)](#opt-services.transmission.settings.download-dir),
[services (T)](#opt-services.transmission.settings.incomplete-dir)
and [services (T)](#opt-services.transmission.settings.watch-dir).
Note that you may also want to change
[services (T)](#opt-services.transmission.settings.umask).

Keep in mind, that if the default user is used, the `home` directory
is locked behind a `750` permission, which affects all subdirectories
as well. There are 3 ways to get around this:

1. (Recommended) add the users that should have access to the group
   set by [services (T)](#opt-services.transmission.group)
2. Change [services (T)](#opt-services.transmission.settings.download-dir) to be
   under a directory that has the right permissions
3. Change `systemd.services.transmission.serviceConfig.StateDirectoryMode`
   to the same value as this option

*Type:* null or string

*Default:* `null`

*Example:* `"770"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.enable` {#opt-services.transmission.enable}

Whether to enable the headless Transmission BitTorrent daemon.

Transmission daemon can be controlled via the RPC interface using
transmission-remote, the WebUI (http://127.0.0.1:9091/ by default),
or other clients like stig or tremc.

Torrents are downloaded to [services (T)](#opt-services.transmission.home)/Downloads by default and are
accessible to users in the "transmission" group.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.extraFlags` {#opt-services.transmission.extraFlags}

Extra flags passed to the transmission command in the service definition.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--log-debug"
]
```

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.group` {#opt-services.transmission.group}

Group account under which Transmission runs.

*Type:* string

*Default:* `"transmission"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.home` {#opt-services.transmission.home}

The directory where Transmission will create `.config/transmission-daemon`.
as well as `Downloads/` unless
[services (T)](#opt-services.transmission.settings.download-dir) is changed,
and `.incomplete/` unless
[services (T)](#opt-services.transmission.settings.incomplete-dir) is changed.

*Type:* absolute path

*Default:* `"/var/lib/transmission"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.openFirewall` {#opt-services.transmission.openFirewall}

Alias of [`services.transmission.openPeerPorts`](#opt-services.transmission.openPeerPorts).

*Type:* boolean

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.openPeerPorts` {#opt-services.transmission.openPeerPorts}

Whether to enable opening of the peer port(s) in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.openRPCPort` {#opt-services.transmission.openRPCPort}

Whether to enable opening of the RPC port in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.package` {#opt-services.transmission.package}

The transmission package to use.

*Type:* package

*Default:*

``` nix
''
  if lib.versionAtLeast config.system.stateVersion "25.11" then
    pkgs.transmission_4
  else
    «error message»
''
```

*Example:* `pkgs.transmission_4`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.performanceNetParameters` {#opt-services.transmission.performanceNetParameters}

Whether to enable tweaking of kernel parameters
to open many more connections at the same time.

Note that you may also want to increase
`peer-limit-global`.
And be aware that these settings are quite aggressive
and might not suite your regular desktop use.
For instance, SSH sessions may time out more easily.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings` {#opt-services.transmission.settings}

Settings whose options overwrite fields in
`.config/transmission-daemon/settings.json`
(each time the service starts).

See [Transmission's documentation](https://github.com/transmission/transmission/blob/main/docs/Editing-Configuration-Files.md#options)
for documentation of settings not explicitly covered by this module.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.download-dir` {#opt-services.transmission.settings.download-dir}

Directory where to download torrents.

*Type:* absolute path

*Default:* `"${config.services.transmission.home}/Downloads"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.incomplete-dir` {#opt-services.transmission.settings.incomplete-dir}

When enabled with
services.transmission.home
[services (T)](#opt-services.transmission.settings.incomplete-dir-enabled),
new torrents will download the files to this directory.
When complete, the files will be moved to download-dir
[services (T)](#opt-services.transmission.settings.download-dir).

*Type:* absolute path

*Default:* `"${config.services.transmission.home}/.incomplete"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.incomplete-dir-enabled` {#opt-services.transmission.settings.incomplete-dir-enabled}

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.message-level` {#opt-services.transmission.settings.message-level}

Set verbosity of transmission messages.

*Type:* integer between 0 and 6 (both inclusive)

*Default:* `2`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.peer-port` {#opt-services.transmission.settings.peer-port}

The peer port to listen for incoming connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `51413`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.peer-port-random-high` {#opt-services.transmission.settings.peer-port-random-high}

The maximum peer port to listen to for incoming connections
when [services (T)](#opt-services.transmission.settings.peer-port-random-on-start) is enabled.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `65535`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.peer-port-random-low` {#opt-services.transmission.settings.peer-port-random-low}

The minimal peer port to listen to for incoming connections
when [services (T)](#opt-services.transmission.settings.peer-port-random-on-start) is enabled.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `65535`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.peer-port-random-on-start` {#opt-services.transmission.settings.peer-port-random-on-start}

Randomize the peer port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.rpc-bind-address` {#opt-services.transmission.settings.rpc-bind-address}

Where to listen for RPC connections.
Use `0.0.0.0` to listen on all interfaces.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.rpc-port` {#opt-services.transmission.settings.rpc-port}

The RPC port to listen to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9091`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.script-torrent-done-enabled` {#opt-services.transmission.settings.script-torrent-done-enabled}

Whether to run
[services (T)](#opt-services.transmission.settings.script-torrent-done-filename)
at torrent completion.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.script-torrent-done-filename` {#opt-services.transmission.settings.script-torrent-done-filename}

Executable to be run at torrent completion.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.trash-original-torrent-files` {#opt-services.transmission.settings.trash-original-torrent-files}

Whether to delete torrents added from the
[services (T)](#opt-services.transmission.settings.watch-dir).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.umask` {#opt-services.transmission.settings.umask}

Sets transmission's file mode creation mask.
See the `umask(2)` manpage for more information.
Users who want their saved torrents to be world-writable
may want to set this value to 0/`"000"`.

*Type:* signed integer or string

*Default:* `"022"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.utp-enabled` {#opt-services.transmission.settings.utp-enabled}

Whether to enable [Micro Transport Protocol (µTP)](https://en.wikipedia.org/wiki/Micro_Transport_Protocol).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.watch-dir` {#opt-services.transmission.settings.watch-dir}

Watch a directory for torrent files and add them to transmission.

*Type:* absolute path

*Default:* `"${config.services.transmission.home}/watchdir"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.settings.watch-dir-enabled` {#opt-services.transmission.settings.watch-dir-enabled}

Whether to enable the
[services (T)](#opt-services.transmission.settings.watch-dir).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.user` {#opt-services.transmission.user}

User account under which Transmission runs.

*Type:* string

*Default:* `"transmission"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.transmission.webHome` {#opt-services.transmission.webHome}

If not `null`, sets the value of the `TRANSMISSION_WEB_HOME`
environment variable used by the service. Useful for overriding
the web interface files, without overriding the transmission
package and thus requiring rebuilding it locally. Use this if
you want to use an alternative web interface, such as
`pkgs.flood-for-transmission`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"pkgs.flood-for-transmission"`

*Declared by:* [`nixos/modules/services/torrent/transmission.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/transmission.nix)

## `services.tremor-rs.enable` {#opt-services.tremor-rs.enable}

Whether to enable Tremor event- or stream-processing system.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/tremor-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tremor-rs.nix)

## `services.tremor-rs.host` {#opt-services.tremor-rs.host}

The host tremor should be listening on

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/tremor-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tremor-rs.nix)

## `services.tremor-rs.loggerSettings` {#opt-services.tremor-rs.loggerSettings}

Tremor logger configuration

*Type:* YAML 1.1 value

*Default:*

``` nix
{
  refresh_rate = "30 seconds";
  appenders.stdout.kind = "console";
  root = {
    level = "warn";
    appenders = [ "stdout" ];
  };
  loggers = {
    tremor_runtime = {
      level = "debug";
      appenders = [ "stdout" ];
      additive = false;
    };
    tremor = {
      level = "debug";
      appenders = [ "stdout" ];
      additive = false;
    };
  };
}
```

*Example:*

``` nix
{
  appenders = {
    stdout = {
      kind = "console";
    };
  };
  loggers = {
    tremor = {
      additive = false;
      appenders = [
        "stdout"
      ];
      level = "debug";
    };
    tremor_runtime = {
      additive = false;
      appenders = [
        "stdout"
      ];
      level = "debug";
    };
  };
  refresh_rate = "30 seconds";
  root = {
    appenders = [
      "stdout"
    ];
    level = "warn";
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/tremor-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tremor-rs.nix)

## `services.tremor-rs.port` {#opt-services.tremor-rs.port}

the port tremor should be listening on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9898`

*Declared by:* [`nixos/modules/services/monitoring/tremor-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tremor-rs.nix)

## `services.tremor-rs.tremorLibDir` {#opt-services.tremor-rs.tremorLibDir}

Directory where to find /lib containing tremor script files

*Type:* absolute path

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/tremor-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tremor-rs.nix)

## `services.tremor-rs.troyFileList` {#opt-services.tremor-rs.troyFileList}

List of troy files to load.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/tremor-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tremor-rs.nix)

## `services.trezord.emulator.enable` {#opt-services.trezord.emulator.enable}

Enable Trezor emulator support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/trezord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/trezord.nix)

## `services.trezord.emulator.port` {#opt-services.trezord.emulator.port}

Listening port for the Trezor emulator.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `21324`

*Declared by:* [`nixos/modules/services/hardware/trezord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/trezord.nix)

## `services.trezord.enable` {#opt-services.trezord.enable}

Enable Trezor bridge daemon, for use with Trezor hardware bitcoin wallets.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/trezord.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/trezord.nix)

## `services.trickster.configFile` {#opt-services.trickster.configFile}

Path to configuration file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.enable` {#opt-services.trickster.enable}

Enable Trickster.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.instance-id` {#opt-services.trickster.instance-id}

Instance ID for when running multiple processes (default null).

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.log-level` {#opt-services.trickster.log-level}

Level of Logging to use (debug, info, warn, error) (default "info").

*Type:* string

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.metrics-port` {#opt-services.trickster.metrics-port}

Port that the /metrics endpoint will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8082`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.origin-type` {#opt-services.trickster.origin-type}

Type of origin (prometheus, influxdb)

*Type:* one of "prometheus", "influxdb"

*Default:* `"prometheus"`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.origin-url` {#opt-services.trickster.origin-url}

URL to the Origin. Enter it like you would in grafana, e.g., http://prometheus:9090 (default http://prometheus:9090).

*Type:* string

*Default:* `"http://prometheus:9090"`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.package` {#opt-services.trickster.package}

The trickster package to use.

*Type:* package

*Default:* `pkgs.trickster`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.profiler-port` {#opt-services.trickster.profiler-port}

Port that the /debug/pprof endpoint will listen on.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.trickster.proxy-port` {#opt-services.trickster.proxy-port}

Port that the Proxy server will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9090`

*Declared by:* [`nixos/modules/services/networking/trickster.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/trickster.nix)

## `services.triggerhappy.bindings` {#opt-services.triggerhappy.bindings}

Key bindings for `triggerhappy`.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[ { keys = ["PLAYPAUSE"];  cmd = "${lib.getExe pkgs.mpc} -q toggle"; } ]
```

*Declared by:* [`nixos/modules/services/hardware/triggerhappy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/triggerhappy.nix)

## `services.triggerhappy.bindings.*.cmd` {#opt-services.triggerhappy.bindings._.cmd}

What to run.

*Type:* string

*Declared by:* [`nixos/modules/services/hardware/triggerhappy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/triggerhappy.nix)

## `services.triggerhappy.bindings.*.event` {#opt-services.triggerhappy.bindings._.event}

Event to match.

*Type:* one of "press", "hold", "release"

*Default:* `"press"`

*Declared by:* [`nixos/modules/services/hardware/triggerhappy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/triggerhappy.nix)

## `services.triggerhappy.bindings.*.keys` {#opt-services.triggerhappy.bindings._.keys}

List of keys to match.  Key names as defined in linux/input-event-codes.h

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/triggerhappy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/triggerhappy.nix)

## `services.triggerhappy.enable` {#opt-services.triggerhappy.enable}

Whether to enable the `triggerhappy` hotkey daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/triggerhappy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/triggerhappy.nix)

## `services.triggerhappy.extraConfig` {#opt-services.triggerhappy.extraConfig}

Literal contents to append to the end of `triggerhappy` configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/hardware/triggerhappy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/triggerhappy.nix)

## `services.triggerhappy.user` {#opt-services.triggerhappy.user}

User account under which `triggerhappy` runs.

*Type:* string

*Default:* `"nobody"`

*Example:* `"root"`

*Declared by:* [`nixos/modules/services/hardware/triggerhappy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/triggerhappy.nix)

## `services.trilium-server.dataDir` {#opt-services.trilium-server.dataDir}

The directory storing the notes database and the configuration.

*Type:* string

*Default:* `"/var/lib/trilium"`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.enable` {#opt-services.trilium-server.enable}

Whether to enable trilium-server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.environmentFile` {#opt-services.trilium-server.environmentFile}

File to load as the environment file. This allows you to pass secrets in without writing
to the nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/secrets/trilium.env"`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.host` {#opt-services.trilium-server.host}

The host address to bind to (defaults to localhost).

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.instanceName` {#opt-services.trilium-server.instanceName}

Instance name used to distinguish between different instances

*Type:* string

*Default:* `"Trilium"`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.nginx` {#opt-services.trilium-server.nginx}

Configuration for nginx reverse proxy.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.nginx.enable` {#opt-services.trilium-server.nginx.enable}

Configure the nginx reverse proxy settings.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.nginx.hostName` {#opt-services.trilium-server.nginx.hostName}

The hostname use to setup the virtualhost configuration

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.noAuthentication` {#opt-services.trilium-server.noAuthentication}

If set to true, no password is required to access the web frontend.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.noBackup` {#opt-services.trilium-server.noBackup}

Disable periodic database backups.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.package` {#opt-services.trilium-server.package}

The trilium-server package to use.

*Type:* package

*Default:* `pkgs.trilium-server`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.trilium-server.port` {#opt-services.trilium-server.port}

The port number to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/trilium.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/trilium.nix)

## `services.tsidp.enable` {#opt-services.tsidp.enable}

Whether to enable tsidp server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.environmentFile` {#opt-services.tsidp.environmentFile}

Path to an environment file loaded for the tsidp service.

This can be used to securely store tokens and secrets outside of the world-readable Nix store.

Example contents of the file:

```
TS_AUTH_KEY=YOUR_TAILSCALE_AUTHKEY
```

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/tsidp"`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.package` {#opt-services.tsidp.package}

The tsidp package to use.

*Type:* package

*Default:* `pkgs.tsidp`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.debugAllRequests` {#opt-services.tsidp.settings.debugAllRequests}

For development. Prints all requests and responses.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.debugTsnet` {#opt-services.tsidp.settings.debugTsnet}

For development. Enables debug level logging with tsnet connection.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.enableFunnel` {#opt-services.tsidp.settings.enableFunnel}

Use Tailscale Funnel to make tsidp available on the public internet so it works with SaaS products.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.enableSts` {#opt-services.tsidp.settings.enableSts}

Enable OAuth token exchange using RFC 8693.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.hostName` {#opt-services.tsidp.settings.hostName}

The hostname to use for the tsnet node.

*Type:* string

*Default:* `"idp"`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.localPort` {#opt-services.tsidp.settings.localPort}

Listen on localhost:<port>.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.logLevel` {#opt-services.tsidp.settings.logLevel}

Set logging level: debug, info, warn, error.

*Type:* one of "debug", "info", "warn", "error"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.port` {#opt-services.tsidp.settings.port}

Port to listen on (default: 443).

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsidp.settings.useLocalTailscaled` {#opt-services.tsidp.settings.useLocalTailscaled}

Use local tailscaled instead of tsnet.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/tsidp.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/tsidp.nix)

## `services.tsmBackup.autoTime` {#opt-services.tsmBackup.autoTime}

The backup service will be invoked
automatically at the given date/time,
which must be in the format described in
`systemd.time(5)`.
The default `null`
disables automatic backups.

*Type:* null or non-empty string

*Default:* `null`

*Example:* `"12:00"`

*Declared by:* [`nixos/modules/services/backup/tsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tsm.nix)

## `services.tsmBackup.command` {#opt-services.tsmBackup.command}

The actual command passed to the
`dsmc` executable to start the backup.

*Type:* non-empty string

*Default:* `"backup"`

*Example:* `"incr"`

*Declared by:* [`nixos/modules/services/backup/tsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tsm.nix)

## `services.tsmBackup.enable` {#opt-services.tsmBackup.enable}

Whether to enable automatic backups with the
IBM Storage Protect (Tivoli Storage Manager, TSM) client.
This also enables
[`programs.tsmClient.enable`](../../options/programs/index.md#opt-programs.tsmClient.enable)
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/tsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tsm.nix)

## `services.tsmBackup.servername` {#opt-services.tsmBackup.servername}

Create a systemd system service
`tsm-backup.service` that starts
a backup based on the given servername's stanza.
Note that this server's
`passwdDir` will default to
`/var/lib/tsm-backup/password`
(but may be overridden);
also, the service will use
`/var/lib/tsm-backup` as
`HOME` when calling
`dsmc`.

*Type:* non-empty string

*Example:* `"mainTsmServer"`

*Declared by:* [`nixos/modules/services/backup/tsm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/tsm.nix)

## `services.tt-rss.auth.autoCreate` {#opt-services.tt-rss.auth.autoCreate}

Allow authentication modules to auto-create users in tt-rss internal
database when authenticated successfully.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.auth.autoLogin` {#opt-services.tt-rss.auth.autoLogin}

Automatically login user on remote or other kind of externally supplied
authentication, otherwise redirect to login form as normal.
If set to true, users won't be able to set application language
and settings profile.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.database.createLocally` {#opt-services.tt-rss.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.database.host` {#opt-services.tt-rss.database.host}

Host of the database. Leave null to use Unix domain socket.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.database.name` {#opt-services.tt-rss.database.name}

Name of the existing database.

*Type:* string

*Default:* `"tt_rss"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.database.password` {#opt-services.tt-rss.database.password}

The database user's password.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.database.passwordFile` {#opt-services.tt-rss.database.passwordFile}

The database user's password.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.database.port` {#opt-services.tt-rss.database.port}

The database's port. If not set, the default ports will be provided (5432
and 3306 for pgsql and mysql respectively).

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.database.type` {#opt-services.tt-rss.database.type}

Database to store feeds. Supported are pgsql and mysql.

*Type:* one of "pgsql", "mysql"

*Default:* `"pgsql"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.database.user` {#opt-services.tt-rss.database.user}

The database user. The user must exist and has access to
the specified database.

*Type:* string

*Default:* `"tt_rss"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.email.digestSubject` {#opt-services.tt-rss.email.digestSubject}

Subject line for email digests.

*Type:* string

*Default:* `"[tt-rss] New headlines for last 24 hours"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.email.fromAddress` {#opt-services.tt-rss.email.fromAddress}

Address for sending outgoing mail. This applies to password reset
notifications, digest emails and any other mail.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.email.fromName` {#opt-services.tt-rss.email.fromName}

Name for sending outgoing mail. This applies to password reset
notifications, digest emails and any other mail.

*Type:* string

*Default:* `"Tiny Tiny RSS"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.email.login` {#opt-services.tt-rss.email.login}

SMTP authentication login used when sending outgoing mail.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.email.password` {#opt-services.tt-rss.email.password}

SMTP authentication password used when sending outgoing mail.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.email.security` {#opt-services.tt-rss.email.security}

Used to select a secure SMTP connection. Allowed values: ssl, tls,
or empty.

*Type:* one of "", "ssl", "tls"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.email.server` {#opt-services.tt-rss.email.server}

Hostname:port combination to send outgoing mail. Blank - use system
MTA.

*Type:* string

*Default:* `""`

*Example:* `"localhost:25"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.enable` {#opt-services.tt-rss.enable}

Whether to enable tt-rss.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.enableGZipOutput` {#opt-services.tt-rss.enableGZipOutput}

Selectively gzip output to improve wire performance. This requires
PHP Zlib extension on the server.
Enabling this can break tt-rss in several httpd/php configurations,
if you experience weird errors and tt-rss failing to start, blank pages
after login, or content encoding errors, disable it.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.extraConfig` {#opt-services.tt-rss.extraConfig}

Additional lines to append to `config.php`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.feedCryptKey` {#opt-services.tt-rss.feedCryptKey}

Key used for encryption of passwords for password-protected feeds
in the database. A string of 24 random characters. If left blank, encryption
is not used. Requires mcrypt functions.
Warning: changing this key will make your stored feed passwords impossible
to decrypt.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.forceArticlePurge` {#opt-services.tt-rss.forceArticlePurge}

When this option is not 0, users ability to control feed purging
intervals is disabled and all articles (which are not starred)
older than this amount of days are purged.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.logDestination` {#opt-services.tt-rss.logDestination}

Log destination to use. Possible values: sql (uses internal logging
you can read in Preferences -\> System), syslog - logs to system log.
Setting this to blank uses PHP logging (usually to http server
error.log).

*Type:* one of "", "sql", "syslog"

*Default:* `"sql"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.phpPackage` {#opt-services.tt-rss.phpPackage}

php package to use for php fpm and update daemon.

*Type:* package

*Default:* `"pkgs.php84"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.pluginPackages` {#opt-services.tt-rss.pluginPackages}

List of plugins to install. The list elements are expected to
be derivations. All elements in this derivation are automatically
copied to the `plugins.local` directory.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.plugins` {#opt-services.tt-rss.plugins}

List of plugins to load automatically for all users.
System plugins have to be specified here. Please enable at least one
authentication plugin here (auth\_\*).
Users may enable other user plugins from Preferences/Plugins but may not
disable plugins specified in this list.
Disabling auth\_internal in this list would automatically disable
reset password link on the login form.

*Type:* list of string

*Default:*

``` nix
[
  "auth_internal"
  "note"
]
```

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.pool` {#opt-services.tt-rss.pool}

Name of existing phpfpm pool that is used to run web-application.
If not specified a pool will be created automatically with
default values.

*Type:* string

*Default:* `"tt-rss"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.pubSubHubbub.enable` {#opt-services.tt-rss.pubSubHubbub.enable}

Enable client PubSubHubbub support in tt-rss. When disabled, tt-rss
won't try to subscribe to PUSH feed updates.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.pubSubHubbub.hub` {#opt-services.tt-rss.pubSubHubbub.hub}

URL to a PubSubHubbub-compatible hub server. If defined, "Published
articles" generated feed would automatically become PUSH-enabled.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.registration.enable` {#opt-services.tt-rss.registration.enable}

Allow users to register themselves. Please be aware that allowing
random people to access your tt-rss installation is a security risk
and potentially might lead to data loss or server exploit. Disabled
by default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.registration.maxUsers` {#opt-services.tt-rss.registration.maxUsers}

Maximum amount of users which will be allowed to register on this
system. 0 - no limit.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.registration.notifyAddress` {#opt-services.tt-rss.registration.notifyAddress}

Email address to send new user notifications to.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.root` {#opt-services.tt-rss.root}

Root of the application.

*Type:* absolute path

*Default:* `"/var/lib/tt-rss"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.selfUrlPath` {#opt-services.tt-rss.selfUrlPath}

Full URL of your tt-rss installation. This should be set to the
location of tt-rss directory, e.g. http://example.org/tt-rss/
You need to set this option correctly otherwise several features
including PUSH, bookmarklets and browser integration will not work properly.

*Type:* string

*Example:* `"http://localhost"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.sessionCookieLifetime` {#opt-services.tt-rss.sessionCookieLifetime}

Default lifetime of a session (e.g. login) cookie. In seconds,
0 means cookie will be deleted when browser closes.

*Type:* signed integer

*Default:* `86400`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.simpleUpdateMode` {#opt-services.tt-rss.simpleUpdateMode}

Enables fallback update mode where tt-rss tries to update feeds in
background while tt-rss is open in your browser.
If you don't have a lot of feeds and don't want to or can't run
background processes while not running tt-rss, this method is generally
viable to keep your feeds up to date.
Still, there are more robust (and recommended) updating methods
available, you can read about them here: [https://tt-rss.org/wiki/UpdatingFeeds](https://tt-rss.org/wiki/UpdatingFeeds)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.singleUserMode` {#opt-services.tt-rss.singleUserMode}

Operate in single user mode, disables all functionality related to
multiple users and authentication. Enabling this assumes you have
your tt-rss directory protected by other means (e.g. http auth).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.sphinx.index` {#opt-services.tt-rss.sphinx.index}

Index names in Sphinx configuration. Example configuration
files are available on tt-rss wiki.

*Type:* list of string

*Default:*

``` nix
[
  "ttrss"
  "delta"
]
```

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.sphinx.server` {#opt-services.tt-rss.sphinx.server}

Hostname:port combination for the Sphinx server.

*Type:* string

*Default:* `"localhost:9312"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.themePackages` {#opt-services.tt-rss.themePackages}

List of themes to install. The list elements are expected to
be derivations. All elements in this derivation are automatically
copied to the `themes.local` directory.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.updateDaemon.commandFlags` {#opt-services.tt-rss.updateDaemon.commandFlags}

Command-line flags passed to the update daemon.
The default --quiet flag mutes all logging, including errors.

*Type:* string

*Default:* `"--quiet"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.user` {#opt-services.tt-rss.user}

User account under which both the update daemon and the web-application run.

*Type:* string

*Default:* `"tt_rss"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tt-rss.virtualHost` {#opt-services.tt-rss.virtualHost}

Name of the nginx virtualhost to use and setup. If null, do not setup any virtualhost.

*Type:* null or string

*Default:* `"tt-rss"`

*Declared by:* [`nixos/modules/services/web-apps/tt-rss.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tt-rss.nix)

## `services.tts.servers` {#opt-services.tts.servers}

TTS server instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  english = {
    port = 5300;
    model = "tts_models/en/ljspeech/tacotron2-DDC";
  };
  german = {
    port = 5301;
    model = "tts_models/de/thorsten/tacotron2-DDC";
  };
  dutch = {
    port = 5302;
    model = "tts_models/nl/mai/tacotron2-DDC";
  };
}
```

*Declared by:* [`nixos/modules/services/audio/tts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/tts.nix)

## `services.tts.servers.<name>.enable` {#opt-services.tts.servers._name_.enable}

Whether to enable Coqui TTS server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/tts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/tts.nix)

## `services.tts.servers.<name>.extraArgs` {#opt-services.tts.servers._name_.extraArgs}

Extra arguments to pass to the server commandline.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/audio/tts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/tts.nix)

## `services.tts.servers.<name>.model` {#opt-services.tts.servers._name_.model}

Name of the model to download and use for speech synthesis.

Check `tts-server --list_models` for possible values.

Set to `null` to use a custom model.

*Type:* null or string

*Default:* `"tts_models/en/ljspeech/tacotron2-DDC"`

*Example:* `null`

*Declared by:* [`nixos/modules/services/audio/tts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/tts.nix)

## `services.tts.servers.<name>.port` {#opt-services.tts.servers._name_.port}

Port to bind the TTS server to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Example:* `5000`

*Declared by:* [`nixos/modules/services/audio/tts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/tts.nix)

## `services.tts.servers.<name>.useCuda` {#opt-services.tts.servers._name_.useCuda}

Whether to offload computation onto a CUDA compatible GPU.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/audio/tts.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/audio/tts.nix)

## `services.ttyd.caFile` {#opt-services.ttyd.caFile}

SSL CA file path for client certificate verification.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.certFile` {#opt-services.ttyd.certFile}

SSL certificate file path.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.checkOrigin` {#opt-services.ttyd.checkOrigin}

Whether to allow a websocket connection from a different origin.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.clientOptions` {#opt-services.ttyd.clientOptions}

Attribute set of client options for xtermjs.
[https://xtermjs.org/docs/api/terminal/interfaces/iterminaloptions/](https://xtermjs.org/docs/api/terminal/interfaces/iterminaloptions/)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  fontSize = "16";
  fontFamily = "Fira Code";
}
```

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.enable` {#opt-services.ttyd.enable}

Whether to enable ttyd daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.enableIPv6` {#opt-services.ttyd.enableIPv6}

Whether or not to enable IPv6 support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.enableSSL` {#opt-services.ttyd.enableSSL}

Whether or not to enable SSL (https) support.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.entrypoint` {#opt-services.ttyd.entrypoint}

Which command ttyd runs.

*Type:* list of string

*Default:*

``` nix
[ "${pkgs.shadow}/bin/login" ]
```

*Example:*

``` nix
[ (lib.getExe pkgs.htop) ]
```

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.indexFile` {#opt-services.ttyd.indexFile}

Custom index.html path

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.interface` {#opt-services.ttyd.interface}

Network interface to bind.

*Type:* null or string

*Default:* `null`

*Example:* `"eth0"`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.keyFile` {#opt-services.ttyd.keyFile}

SSL key file path.
For insecurely putting the keyFile in the globally readable store use
`pkgs.writeText "ttydKeyFile" "SSLKEY"`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.logLevel` {#opt-services.ttyd.logLevel}

Set log level.

*Type:* signed integer

*Default:* `7`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.maxClients` {#opt-services.ttyd.maxClients}

Maximum clients to support (0, no limit)

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.passwordFile` {#opt-services.ttyd.passwordFile}

File containing the password to use for basic http authentication.
For insecurely putting the password in the globally readable store use
`pkgs.writeText "ttydpw" "MyPassword"`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.port` {#opt-services.ttyd.port}

Port to listen on (use 0 for random port)

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `7681`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.signal` {#opt-services.ttyd.signal}

Signal to send to the command on session close.

*Type:* 8 bit unsigned integer; between 0 and 255 (both inclusive)

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.socket` {#opt-services.ttyd.socket}

UNIX domain socket path to bind.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/run/ttyd.sock"`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.terminalType` {#opt-services.ttyd.terminalType}

Terminal type to report.

*Type:* string

*Default:* `"xterm-256color"`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.user` {#opt-services.ttyd.user}

Which unix user ttyd should run as.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.username` {#opt-services.ttyd.username}

Username for basic http authentication.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.ttyd.writeable` {#opt-services.ttyd.writeable}

Allow clients to write to the TTY.

*Type:* null or boolean

*Default:* `null`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/ttyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/ttyd.nix)

## `services.tuliprox.apiProxySettings` {#opt-services.tuliprox.apiProxySettings}

Users and proxy configuration

Refer to the [Tuliprox documentation](https://github.com/euzu/tuliprox?tab=readme-ov-file#3-api-proxy-config) for available attributes

*Type:* YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
{
  server = [
    {
      host = "192.169.1.9";
      message = "Welcome to tuliprox";
      name = "default";
      port = 8901;
      protocol = "http";
      timezone = "Europe/Paris";
    }
    {
      host = "tuliprox.mydomain.tv";
      message = "Welcome to tuliprox";
      name = "external";
      port = 443;
      protocol = "https";
      timezone = "Europe/Paris";
    }
  ];
  user = [
    {
      credentials = [
        {
          exp_date = 1672705545;
          max_connections = 1;
          password = "secret1";
          proxy = "reverse";
          server = "default";
          status = "Active";
          token = "token1";
          username = "test1";
        }
      ];
      target = "xc_m3u";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/tuliprox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tuliprox.nix)

## `services.tuliprox.enable` {#opt-services.tuliprox.enable}

Whether to enable Tuliprox IPTV playlist processor & proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/tuliprox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tuliprox.nix)

## `services.tuliprox.extraArgs` {#opt-services.tuliprox.extraArgs}

Additional command-line arguments for the systemd service.

Refer to the [Tuliprox documentation](https://github.com/euzu/tuliprox?tab=readme-ov-file#3-api-proxy-config) for available arguments.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/tuliprox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tuliprox.nix)

## `services.tuliprox.mappingSettings` {#opt-services.tuliprox.mappingSettings}

Templates configuration

Refer to the [Tuliprox documentation](https://github.com/euzu/tuliprox?tab=readme-ov-file#3-api-proxy-config) for available attributes

*Type:* YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
{
  mappings = {
    mapping = [
      {
        id = "iptv-org";
        mapper = [
          {
            filter = "!bbc!";
            script = ''
              @Group = "BBC"
            '';
          }
          {
            filter = "!documentary!";
            script = ''
              @Group = "Documentary"
            '';
          }
          {
            filter = "!entertainment!";
            script = ''
              @Group = "Entertainment"
            '';
          }
          {
            filter = "!pluto_tv!";
            script = ''
              @Group = "Pluto TV"
            '';
          }
          {
            filter = "!business!";
            script = ''
              @Group = "News"
            '';
          }
          {
            filter = "Input ~ \"iptv-org\"";
            script = ''
              @Caption = concat(@Caption, " (iptv-org)")
            '';
          }
        ];
        match_as_ascii = true;
      }
    ];
    templates = [
      {
        name = "bbc";
        value = "Title ~ \"^BBC\"";
      }
      {
        name = "documentary";
        value = "(Group ~ \"(Documentary|Outdoor)\")";
      }
      {
        name = "entertainment";
        value = "Group ~ \"Entertainment\"";
      }
      {
        name = "pluto_tv";
        value = "(Caption ~ \"Pluto TV\") AND NOT(Caption ~ \"Sports\")";
      }
      {
        name = "business";
        value = "Group ~ \"Business\"";
      }
    ];
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/tuliprox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tuliprox.nix)

## `services.tuliprox.package` {#opt-services.tuliprox.package}

The tuliprox package to use.

*Type:* package

*Default:* `pkgs.tuliprox`

*Declared by:* [`nixos/modules/services/web-apps/tuliprox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tuliprox.nix)

## `services.tuliprox.sourceSettings` {#opt-services.tuliprox.sourceSettings}

Source definitions

Refer to the [Tuliprox documentation](https://github.com/euzu/tuliprox?tab=readme-ov-file#3-api-proxy-config) for available attributes

*Type:* YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
{
  sources = [
    {
      inputs = [
        {
          name = "iptv-org";
          type = "m3u";
          url = "https://iptv-org.github.io/iptv/countries/uk.m3u";
        }
      ];
      targets = [
        {
          filter = "!final_channel_lineup!";
          mapping = [
            "iptv-org"
          ];
          name = "iptv-org";
          options = {
            ignore_logo = false;
            share_live_streams = true;
          };
          output = [
            {
              type = "xtream";
            }
            {
              filename = "iptv.m3u";
              type = "m3u";
            }
            {
              device = "hdhr1";
              type = "hdhomerun";
              username = "local";
            }
          ];
        }
      ];
    }
  ];
  templates = [
    {
      name = "not_red_button";
      value = "NOT (Title ~ \"(?i).*red button.*\")";
    }
    {
      name = "not_low_resolution";
      value = "NOT (Title ~ \"(?i).*(360p|240p).*\")";
    }
    {
      name = "all_channels";
      value = "Title ~ \".*\"";
    }
    {
      name = "final_channel_lineup";
      value = "!all_channels! AND !not_red_button! AND !not_low_resolution!";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/tuliprox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tuliprox.nix)

## `services.tuliprox.systemSettings` {#opt-services.tuliprox.systemSettings}

Main config file

Refer to the [Tuliprox documentation](https://github.com/euzu/tuliprox?tab=readme-ov-file#3-api-proxy-config) for available attributes

*Type:* YAML 1.1 value

*Default:* `null`

*Example:*

``` nix
{
  api = {
    host = "0.0.0.0";
    port = 8901;
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/tuliprox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/tuliprox.nix)

## `services.tumbler.enable` {#opt-services.tumbler.enable}

Whether to enable Tumbler, A D-Bus thumbnailer service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/tumbler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/tumbler.nix)

## `services.tuned.enable` {#opt-services.tuned.enable}

Whether to enable TuneD.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.package` {#opt-services.tuned.package}

The tuned package to use.

*Type:* package

*Default:* `pkgs.tuned`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.ppdSettings` {#opt-services.tuned.ppdSettings}

Settings for TuneD's power-profiles-daemon compatibility service.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.ppdSettings.battery` {#opt-services.tuned.ppdSettings.battery}

Map of PPD battery states to TuneD profiles.

*Type:* attribute set of string

*Default:*

``` nix
{
  balanced = "balanced-battery";
}
```

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.ppdSettings.main` {#opt-services.tuned.ppdSettings.main}

Core configuration for power-profiles-daemon support.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.ppdSettings.main.battery_detection` {#opt-services.tuned.ppdSettings.main.battery_detection}

Whether to enable battery detection.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.ppdSettings.main.default` {#opt-services.tuned.ppdSettings.main.default}

Default PPD profile.

*Type:* string

*Default:* `"balanced"`

*Example:* `"performance"`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.ppdSettings.profiles` {#opt-services.tuned.ppdSettings.profiles}

Map of PPD profiles to native TuneD profiles.

*Type:* attribute set of string

*Default:*

``` nix
{
  balanced = "balanced";
  performance = "throughput-performance";
  power-saver = "powersave";
}
```

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.ppdSupport` {#opt-services.tuned.ppdSupport}

Whether to enable translation of power-profiles-daemon API calls to TuneD.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.profiles` {#opt-services.tuned.profiles}

Profiles for TuneD.
See `tuned.conf(5)` for details.

*Type:* attribute set of (open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string)))

*Default:* `{ }`

*Example:*

``` nix
{
  my-cool-profile = {
    main = {
      include = "my-other-cool-profile";
    };
    my_sysctl = {
      "net.core.rmem_default" = 262144;
      "net.core.wmem_default" = 262144;
      replace = true;
      type = "sysctl";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.recommend` {#opt-services.tuned.recommend}

TuneD rules for `recommend_profile`, written to
`/etc/tuned/recommend.conf`.

At startup, the daemon evaluates the file in alphabetical order.
The first matching entry is applied. Empty profile rules always match.

If `services.tuned.ppdSupport` is `true`, settings in
`services.tuned.ppdSettings` take precedence over both the default
behaviour and `services.tuned.recommend`. For example:
`services.tuned.ppdSettings.main.default = "performance";` ensures
the corresponding PPD profile is applied regardless of
`services.tuned.recommend` setting.

If `ppdSupport` is `false`, only `services.tuned.recommend` is used;
if `recommend` is empty, TuneD's default behaviour applies.

See `tuned-main.conf(5)` for more details.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
# Enable `virtual-guest` profile for VM guests
virtual-guest = {
  virt = ".+";
};

# Default to the `desktop` profile for all other systems
desktop = { };
```

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings` {#opt-services.tuned.settings}

Configuration for TuneD.
See `tuned-main.conf(5)` for details.

*Type:* open submodule of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings.daemon` {#opt-services.tuned.settings.daemon}

Whether to enable the use of a daemon for TuneD.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings.default_instance_priority` {#opt-services.tuned.settings.default_instance_priority}

Default instance (unit) priority.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings.dynamic_tuning` {#opt-services.tuned.settings.dynamic_tuning}

Whether to enable dynamic tuning.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings.globalSection` {#opt-services.tuned.settings.globalSection}

global section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Type:* section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

## `services.tuned.settings.profile_dirs` {#opt-services.tuned.settings.profile_dirs}

Directories to search for profiles, separated by `,` or `;`.

*Type:* string

*Default:* `"/etc/tuned/profiles"`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings.reapply_sysctl` {#opt-services.tuned.settings.reapply_sysctl}

Whether to enable the reapplying of global sysctls after TuneD sysctls are applied.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings.recommend_command` {#opt-services.tuned.settings.recommend_command}

Whether to enable recommend functionality.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings.sections` {#opt-services.tuned.settings.sections}

attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

## `services.tuned.settings.sleep_interval` {#opt-services.tuned.settings.sleep_interval}

Interval in which the TuneD daemon is waken up and checks for events (in seconds).

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuned.settings.update_interval` {#opt-services.tuned.settings.update_interval}

Update interval for dynamic tuning (in seconds).

*Type:* signed integer

*Default:* `10`

*Declared by:* [`nixos/modules/services/hardware/tuned.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/tuned.nix)

## `services.tuptime.enable` {#opt-services.tuptime.enable}

Whether to enable the total uptime service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/tuptime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tuptime.nix)

## `services.tuptime.timer.enable` {#opt-services.tuptime.timer.enable}

Whether to regularly log uptime to detect bad shutdowns.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/tuptime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tuptime.nix)

## `services.tuptime.timer.period` {#opt-services.tuptime.timer.period}

systemd calendar event

*Type:* string

*Default:* `"*:0/5"`

*Declared by:* [`nixos/modules/services/monitoring/tuptime.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/tuptime.nix)

## `services.turborepo-remote-cache.enable` {#opt-services.turborepo-remote-cache.enable}

Enables the daemon for `turborepo-remote-cache`,
an open source implementation of the Turborepo custom remote cache server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/turborepo-remote-cache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/turborepo-remote-cache.nix)

## `services.turborepo-remote-cache.environment` {#opt-services.turborepo-remote-cache.environment}

Environment variables to set.

Turborepo-remote-cache is configured through the use of environment variables.
The available configuration options can be found in the [documentation](https://ducktors.github.io/turborepo-remote-cache/environment-variables.html).

Note that all environment variables set through this configuration
parameter will be readable by anyone with access to the host
machine. Therefore, sensitive information like `TURBO_TOKEN`
should never be set using this configuration option, but should instead use
[services (T)](#opt-services.turborepo-remote-cache.environmentFile).
See the documentation for that option for more information.

Any environment variables specified in the
[services (T)](#opt-services.turborepo-remote-cache.environmentFile)
will supersede environment variables specified in this option.

*Type:* attribute set of (null or boolean or signed integer or string)

*Default:* `{ }`

*Example:*

``` nix
{
  NODE_ENV = "production";
  PORT = 8080;
}
```

*Declared by:* [`nixos/modules/services/development/turborepo-remote-cache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/turborepo-remote-cache.nix)

## `services.turborepo-remote-cache.environmentFile` {#opt-services.turborepo-remote-cache.environmentFile}

Additional environment file as defined in `systemd.exec(5)`.

Secrets like `TURBO_TOKEN` may be passed to the
service without making them readable to everyone with access to
systemctl by using this configuration parameter.

Note that this file needs to be available on the host on which
`turborepo-remote-cache` is running.

See the [documentation](https://ducktors.github.io/turborepo-remote-cache/environment-variables.html)
and the [services (T)](#opt-services.turborepo-remote-cache.environment) configuration parameter
for further options.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/turborepo-remote-cache.env"`

*Declared by:* [`nixos/modules/services/development/turborepo-remote-cache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/turborepo-remote-cache.nix)

## `services.turborepo-remote-cache.openFirewall` {#opt-services.turborepo-remote-cache.openFirewall}

Open ports in the firewall for turborepo-remote-cache daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/turborepo-remote-cache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/turborepo-remote-cache.nix)

## `services.turborepo-remote-cache.package` {#opt-services.turborepo-remote-cache.package}

The turborepo-remote-cache package to use.

*Type:* package

*Default:* `pkgs.turborepo-remote-cache`

*Declared by:* [`nixos/modules/services/development/turborepo-remote-cache.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/turborepo-remote-cache.nix)

## `services.turn-rs.enable` {#opt-services.turn-rs.enable}

Whether to enable turn-rs server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/turn-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/turn-rs.nix)

## `services.turn-rs.package` {#opt-services.turn-rs.package}

The turn-rs package to use.

*Type:* package

*Default:* `pkgs.turn-rs`

*Declared by:* [`nixos/modules/services/misc/turn-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/turn-rs.nix)

## `services.turn-rs.secretFile` {#opt-services.turn-rs.secretFile}

Environment variables from this file will be interpolated into the
final config file using envsubst with this syntax: `$ENVIRONMENT` or
`${VARIABLE}`.
The file should contain lines formatted as `SECRET_VAR=SECRET_VALUE`.
This is useful to avoid putting secrets into the nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/turn-rs.env"`

*Declared by:* [`nixos/modules/services/misc/turn-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/turn-rs.nix)

## `services.turn-rs.settings` {#opt-services.turn-rs.settings}

Turn-rs server config file

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Example:*

``` nix
{
  auth = {
    static_credentials = {
      user1 = "test";
      user2 = "test";
    };
  };
  turn = {
    interfaces = [
      {
        bind = "127.0.0.1:3478";
        external = "127.0.0.1:3478";
        transport = "udp";
      }
      {
        bind = "127.0.0.1:3478";
        external = "127.0.0.1:3478";
        transport = "tcp";
      }
    ];
    realm = "localhost";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/turn-rs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/turn-rs.nix)

## `services.tusd.basePath` {#opt-services.tusd.basePath}

The basepath of the HTTP server.

*Type:* string

*Default:* `"/files/"`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.behindProxy` {#opt-services.tusd.behindProxy}

Whether to respect X-Forwarded-\* and similar headers which may be set by proxies.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.enable` {#opt-services.tusd.enable}

Whether to enable tus resumable upload protocol server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.extraArgs` {#opt-services.tusd.extraArgs}

Additional arguments given to tusd.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-verbose"
  "-log-format=json"
]
```

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.hooksEnabledEvents` {#opt-services.tusd.hooksEnabledEvents}

The list of enabled hook events.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "pre-create"
  "post-finish"
]
```

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.hooksHttp` {#opt-services.tusd.hooksHttp}

The HTTP endpoint to which hook events will be sent to.

*Type:* null or string

*Default:* `null`

*Example:* `"http://localhost:8081/hooks"`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.host` {#opt-services.tusd.host}

The host to bind the HTTP server to.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.maxSize` {#opt-services.tusd.maxSize}

The maximum size of a single upload in bytes.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.networkTimeout` {#opt-services.tusd.networkTimeout}

The timeout for reading the request and writing the response.
If tusd does not receive data for this duration,
it will consider the connection dead.

*Type:* null or string

*Default:* `null`

*Example:* `"30s"`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.openFirewall` {#opt-services.tusd.openFirewall}

Whether to open the firewall port for tusd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.port` {#opt-services.tusd.port}

The port to bind the HTTP server to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.tusd.uploadDir` {#opt-services.tusd.uploadDir}

The directory to store uploads in.

*Type:* absolute path

*Default:* `"/var/lib/tusd/data"`

*Declared by:* [`nixos/modules/services/web-servers/tusd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/tusd.nix)

## `services.twingate.enable` {#opt-services.twingate.enable}

Whether to enable Twingate Client daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/twingate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/twingate.nix)

## `services.twingate.package` {#opt-services.twingate.package}

The twingate package to use.

*Type:* package

*Default:* `pkgs.twingate`

*Declared by:* [`nixos/modules/services/networking/twingate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/twingate.nix)

## `services.typesense.apiKeyFile` {#opt-services.typesense.apiKeyFile}

Sets the admin api key for typesense. Always use this option
instead of `settings.server.api-key` to prevent the key
from being written to the world-readable nix store.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/search/typesense.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/typesense.nix)

## `services.typesense.enable` {#opt-services.typesense.enable}

Whether to enable typesense.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/search/typesense.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/typesense.nix)

## `services.typesense.package` {#opt-services.typesense.package}

The typesense package to use.

*Type:* package

*Default:* `pkgs.typesense`

*Declared by:* [`nixos/modules/services/search/typesense.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/typesense.nix)

## `services.typesense.settings` {#opt-services.typesense.settings}

Typesense configuration. Refer to [the documentation](https://typesense.org/docs/0.24.1/api/server-configuration.html) for supported values.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/search/typesense.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/typesense.nix)

## `services.typesense.settings.server.api-address` {#opt-services.typesense.settings.server.api-address}

Address to which Typesense API service binds.

*Type:* string

*Declared by:* [`nixos/modules/services/search/typesense.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/typesense.nix)

## `services.typesense.settings.server.api-port` {#opt-services.typesense.settings.server.api-port}

Port on which the Typesense API service listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8108`

*Declared by:* [`nixos/modules/services/search/typesense.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/typesense.nix)

## `services.typesense.settings.server.data-dir` {#opt-services.typesense.settings.server.data-dir}

Path to the directory where data will be stored on disk.

*Type:* string

*Default:* `"/var/lib/typesense"`

*Declared by:* [`nixos/modules/services/search/typesense.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/search/typesense.nix)

## `services.tzupdate.enable` {#opt-services.tzupdate.enable}

Enable the tzupdate timezone updating service. This provides
a one-shot service which can be activated with systemctl to
update the timezone.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/tzupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tzupdate.nix)

## `services.tzupdate.package` {#opt-services.tzupdate.package}

The tzupdate package to use.

*Type:* package

*Default:* `pkgs.tzupdate`

*Declared by:* [`nixos/modules/services/misc/tzupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tzupdate.nix)

## `services.tzupdate.timer.enable` {#opt-services.tzupdate.timer.enable}

Enable the tzupdate timer to update the timezone automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/tzupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tzupdate.nix)

## `services.tzupdate.timer.interval` {#opt-services.tzupdate.timer.interval}

The interval at which the tzupdate timer should run. See
`systemd.time(7)` to understand the format.

*Type:* string

*Default:* `"hourly"`

*Declared by:* [`nixos/modules/services/misc/tzupdate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/tzupdate.nix)
