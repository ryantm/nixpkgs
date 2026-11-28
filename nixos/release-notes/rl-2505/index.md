# Release 25.05 (“Warbler”, 2025.05/23) {#sec-release-25.05}

## Highlights {#sec-release-25.05-highlights}

<!-- To avoid merge conflicts, consider adding your item at an arbitrary place in the list instead. -->

Alongside many enhancements to NixOS modules and general system improvements, this release features the following highlights:

- NixOS now has initial support for the [**COSMIC DE**](https://system76.com/cosmic) which is currently at **Alpha 7**. COSMIC is a Rust-based Desktop Environment by System76, makers of Pop!\_OS. You can use COSMIC by enabling the greeter (login manager) with [services (D)](../../options/services-d/index.md#opt-services.displayManager.cosmic-greeter.enable), and the DE itself by enabling [services (D)](../../options/services-d/index.md#opt-services.desktopManager.cosmic.enable). The support in NixOS/Nixpkgs is stable but still considered experimental because of the recent the addition. The COSMIC maintainers will be waiting for one more release of NixOS to determine if the experimental tag should be removed or not. Until then, please report any issues to the [COSMIC DE tracker in Nixpkgs](https://github.com/NixOS/nixpkgs/issues/259641) instead of upstream.

- `nixos-rebuild-ng`, a full rewrite of `nixos-rebuild` in Python, is available for testing. You can enable it by setting `system.rebuild.enableNg` in your configuration (this will replace the old `nixos-rebuild`), or by adding `nixos-rebuild-ng` to your `environment.systemPackages` (in this case, it will live side-by-side with `nixos-rebuild` as `nixos-rebuild-ng`). It is expected that the next major version of NixOS (25.11) will enable `system.rebuild.enableNg` by default.

- A `nixos-rebuild build-image` sub-command has been added.
  It allows users to build platform-specific (disk) images from their NixOS configurations. `nixos-rebuild build-image` works similar to the popular [nix-community/nixos-generators](https://github.com/nix-community/nixos-generators) project. See new [section on image building in the NixOS manual](../../installation/building-images-via-nixos-rebuild-build-image/index.md#sec-image-nixos-rebuild-build-image). It is also available for `nixos-rebuild-ng`.

- `nixos-option` has been rewritten to a Nix expression called by a simple bash script. This lowers our maintenance threshold, makes eval errors less verbose, adds support for flake-based configurations, descending into `attrsOf` and `listOf` submodule options, and `--show-trace`.

- The global Mesa version can now be managed without a mass rebuild by setting [hardware](../../options/hardware/index.md#opt-hardware.graphics.package).

- GNOME has been updated to version 48.

  - `decibels` music player is now installed by default. You can disable it using [environment](../../options/environment/index.md#opt-environment.gnome.excludePackages).
  - `gnome-shell-extensions` extension collection (which included GNOME Classic extensions, Apps Menu, and User Themes, among others) are no longer installed by default. You can install them again with `services.xserver.desktopManager.gnome.sessionPath`.
  - Option [services (G)](../../options/services-g/index.md#opt-services.gnome.core-developer-tools.enable) now also installs `sysprof` and `d-spy`.
  - Option `services.gnome.core-utilities.enable` has been renamed to [services (G)](../../options/services-g/index.md#opt-services.gnome.core-apps.enable).
  - `cantarell-fonts`, `source-code-pro` and `source-sans` fonts are no longer installed by default. They have been replaced by `adwaita-fonts`.

  Refer to the [GNOME release notes](https://release.gnome.org/48/) for more details.

- [channels.nixos.org](https://channels.nixos.org) now supports the Lockable HTTP Tarball Protocol. This allows using the channel `nixexprs.tar` as Nix Flake input, e.g.:

  ```
  inputs.nixpkgs.url = "https://channels.nixos.org/nixos-25.05/nixexprs.tar.xz";
  ```

<!-- To avoid merge conflicts, consider adding your item at an arbitrary place in the list instead. -->

## New Modules {#sec-release-25.05-new-modules}

<!-- To avoid merge conflicts, consider adding your item at an arbitrary place in the list instead. -->

- [AmneziaVPN](https://amnezia.org/en), a self-hostable open-source VPN client, is available in two variants:

  - [programs.amnezia-vpn](../../options/programs/index.md#opt-programs.amnezia-vpn.enable): a GUI client which can also deploy a VPN endpoint to a remote server
  - `networking.wireguard` adds support for the [AmneziaWG](https://docs.amnezia.org/documentation/amnezia-wg/) variant of the protocol, featuring better masking against Deep Packet Inspection. The variant to be used is set per interface as `networking.wireguard.interfaces.<name>.type`, defaulting to wireguard.

- [Bazecor](https://github.com/Dygmalab/Bazecor), the graphical configurator for Dygma Products. Available as [programs.bazecor](../../options/programs/index.md#opt-programs.bazecor.enable).

- [Bonsai](https://git.sr.ht/~stacyharper/bonsai), a general-purpose event mapper/state machine primarily used to create complex key shortcuts, and as part of the [SXMO](https://sxmo.org/) desktop environment. Available as [services.bonsaid](../../options/services-b/index.md#opt-services.bonsaid.enable).

- [scanservjs](https://github.com/sbs20/scanservjs/), a web UI for SANE scanners. Available at [services.scanservjs](../../options/services-s/index.md#opt-services.scanservjs.enable).

- [Kimai](https://www.kimai.org/), a web-based multi-user time-tracking application. Available as [services.kimai](../../options/services-k/index.md#opt-services.kimai.sites).

- [Kismet](https://www.kismetwireless.net/), a Wi-Fi, Bluetooth, and RF monitoring application supporting a wide range of hardware. Available as [services.kismet](../../options/services-k/index.md#opt-services.kismet.enable).

- [vwifi](https://github.com/Raizo62/vwifi), a Wi-Fi simulator daemon leveraging the `mac80211_hwsim` and `vhost_vsock` kernel modules for efficient simulation of multi-node Wi-Fi networks. Available as [services.vwifi](../../options/services-v/index.md#opt-services.vwifi.client.enable).

- [Oncall](https://oncall.tools), a web-based calendar tool designed for scheduling and managing on-call shifts. Available as [services.oncall](../../options/services-o/index.md#opt-services.oncall.enable).

- [Homer](https://homer-demo.netlify.app/), a very simple static homepage for your server. Available as [services.homer](../../options/services-h/index.md#opt-services.homer.enable).

- [Ghidra](https://ghidra-sre.org/), a software reverse engineering (SRE) suite of tools. Available as [programs.ghidra](../../options/programs/index.md#opt-programs.ghidra.enable).

- [Omnom](https://github.com/asciimoo/omnom), a webpage bookmarking and snapshotting service. Available as [services.omnom](../../options/services-o/index.md#opt-services.omnom.enable).

- [Yggdrasil-Jumper](https://github.com/one-d-wide/yggdrasil-jumper), an independent project that aims to transparently reduce latency of a connection over Yggdrasil network, utilizing NAT traversal to automatically bypass intermediary nodes. Available as [services.yggdrasil-jumper](../../options/services-y/index.md#opt-services.yggdrasil-jumper.enable).

- [xpad-noone](https://github.com/medusalix/xpad-noone) is the original upstream xpad driver from the Linux kernel with support for Xbox One controllers removed — especially useful for people who want to use an XBox One controller under the `xone` driver and an Xbox 360 controller under the `xpad` driver at the same time. Available as [hardware.xpad-noone](../../options/hardware/index.md#opt-hardware.xpad-noone.enable).

- [uMurmur](https://umurmur.net), minimalistic Mumble server primarily targeted to run on embedded computers. Available as [services.umurmur](../../options/services-u/index.md#opt-services.umurmur.enable).

- [Zenoh](https://zenoh.io/), a pub/sub/query protocol with low overhead. The Zenoh router daemon is available as [services.zenohd](../../options/services-z/index.md#opt-services.zenohd.enable).

- [ytdl-sub](https://github.com/jmbannon/ytdl-sub), a tool that downloads media via yt-dlp and prepares it for your favorite media player, including Kodi, Jellyfin, Plex, Emby, and modern music players. Available as [services.ytdl-sub](../../options/services-y/index.md#opt-services.ytdl-sub.instances).

- [MaryTTS](https://github.com/marytts/marytts), an open-source, multilingual text-to-speech synthesis system written in pure Java. Available as [services.marytts](../../options/services-m/index.md#opt-services.marytts.enable).

- [Continuwuity](https://continuwuity.org/), a federated chat server implementing the Matrix protocol, forked from Conduwuit. Available as [services.matrix-continuwuity](../../options/services-m/index.md#opt-services.matrix-continuwuity.enable).

- [Reposilite](https://reposilite.com), a lightweight and easy-to-use repository manager for Maven-based artifacts in the JVM ecosystem. Available as [services.reposilite](../../options/services-r/index.md#opt-services.reposilite.enable).

- [networking.modemmanager](../../options/networking/index.md#opt-networking.modemmanager.enable) has been split out of [networking.networkmanager](../../options/networking/index.md#opt-networking.networkmanager.enable). NetworkManager still enables ModemManager by default, but options exist now to run NetworkManager without ModemManager.

- [Routinator 3000](https://nlnetlabs.nl/projects/routing/routinator/), a full-featured RPKI Relying Party software package that runs as a service which periodically downloads and verifies RPKI data. Available as [services.routinator](../../options/services-r/index.md#opt-services.routinator.enable).

- [doh-server](https://github.com/m13253/dns-over-https), a high performance DNS over HTTPS server. Available as [services.doh-server](../../options/services-d/index.md#opt-services.doh-server.enable).

- [ncps](https://github.com/kalbasit/ncps), a Nix binary cache proxy service implemented in Go using [go-nix](https://github.com/nix-community/go-nix). Available as [services.ncps](../../options/services-n/index.md#opt-services.ncps.enable).

- [Readeck](https://readeck.org/), a read-it later web-application. Available as [services.readeck](../../options/services-r/index.md#opt-services.readeck.enable).

- [EasyTier](https://github.com/EasyTier/EasyTier), a decentralized VPN solution. Available as [services.easytier](../../options/services-e/index.md#opt-services.easytier.enable).

- [Traccar](https://www.traccar.org/), a modern GPS Tracking Platform. Available as [services.traccar](../../options/services-t/index.md#opt-services.traccar.enable).

- [Memos](https://www.usememos.com/), a privacy-first, lightweight note-taking solution that allows you to effortlessly capture and share your ideas.
  Available as [services.memos](../../options/services-m/index.md#opt-services.memos.enable).

- [Schroot](https://codeberg.org/shelter/reschroot), a lightweight virtualisation tool. Securely enter a chroot and run a command or login shell. Available as [programs.schroot](../../options/programs/index.md#opt-programs.schroot.enable).

- [Firezone](https://firezone.dev), an enterprise-ready zero-trust access platform built on WireGuard. This includes the server stack as [services.firezone.server.enable](../../options/services-f/index.md#opt-services.firezone.server.enable), a TURN/STUN relay service as [services.firezone.relay.enable](../../options/services-f/index.md#opt-services.firezone.relay.enable), a gateway service as [services.firezone.gateway.enable](../../options/services-f/index.md#opt-services.firezone.gateway.enable), a headless client as [services.firezone.headless-client.enable](../../options/services-f/index.md#opt-services.firezone.headless-client.enable) and a GUI client as [services.firezone.gui-client.enable](../../options/services-f/index.md#opt-services.firezone.gui-client.enable).

- [crab-hole](https://github.com/LuckyTurtleDev/crab-hole), a cross platform Pi-hole clone written in Rust using hickory-dns/trust-dns. Available as [services.crab-hole](../../options/services-c/index.md#opt-services.crab-hole.enable).

- [agnos](https://github.com/krtab/agnos), a program that obtains TLS certificates from an ACME provider via the DNS-01 challenge without using third-party DNS provider APIs. Available as [security.agnos](../../options/security/index.md#opt-security.agnos.enable).

- [zwave-js-ui](https://zwave-js.github.io/zwave-js-ui/), a full featured Z-Wave Control Panel and MQTT Gateway. Available as [services.zwave-js-ui](../../options/services-z/index.md#opt-services.zwave-js-ui.enable).

- [Pinchflat](https://github.com/kieraneglin/pinchflat), a selfhosted YouTube media manager used to track channels and download videos on release. Available as [services.pinchflat](../../options/services-p/index.md#opt-services.pinchflat.enable).

- [Amazon CloudWatch Agent](https://github.com/aws/amazon-cloudwatch-agent), the official telemetry collector for AWS CloudWatch and AWS X-Ray. Available as [services.amazon-cloudwatch-agent](../../options/services-a/index.md#opt-services.amazon-cloudwatch-agent.enable).

- [Fluent Bit](https://github.com/fluent/fluent-bit), a fast Log, Metrics and Traces Processor and Forwarder. Available as [services.fluent-bit](../../options/services-f/index.md#opt-services.fluent-bit.enable).

- [Bat](https://github.com/sharkdp/bat), a `cat(1)` clone with wings. Available as [programs.bat](../../options/programs/index.md#opt-programs.bat.enable).

- [Autotier](https://github.com/45Drives/autotier), a passthrough FUSE filesystem. Available as [services.autotierfs](../../options/services-a/index.md#opt-services.autotierfs.enable).

- [PostgREST](https://postgrest.org), a standalone web server that turns your PostgreSQL database directly into a RESTful API. Available as [services.postgrest](../../options/services-p/index.md#opt-services.postgrest.enable).

- [postgres-websockets](https://github.com/diogob/postgres-websockets), a middleware that adds websockets capabilities on top of PostgreSQL's asynchronous notifications using LISTEN and NOTIFY commands. Available as [services.postgres-websockets](../../options/services-p/index.md#opt-services.postgres-websockets.enable).

- [µStreamer](https://github.com/pikvm/ustreamer), a lightweight MJPEG-HTTP streamer. Available as [services.ustreamer](../../options/services-u/index.md#opt-services.ustreamer.enable).

- [Whoogle Search](https://github.com/benbusby/whoogle-search), a self-hosted, ad-free, privacy-respecting metasearch engine. Available as [services.whoogle-search](../../options/services-w/index.md#opt-services.whoogle-search.enable).

- [autobrr](https://autobrr.com), a modern download automation tool for torrents and usenets. Available as [services.autobrr](../../options/services-a/index.md#opt-services.autobrr.enable).

- [cross-seed](https://www.cross-seed.org), a tool to set-up fully automatic cross-seeding of torrents. Available as [services.cross-seed](../../options/services-c/index.md#opt-services.cross-seed.enable).

- [Froide-Govplan](https://github.com/okfde/froide-govplan), a web application government planer. Available as [services.froide-govplan](../../options/services-f/index.md#opt-services.froide-govplan.enable).

- [agorakit](https://github.com/agorakit/agorakit), an organization tool for citizens' collectives. Available with [services.agorakit](../../options/services-a/index.md#opt-services.agorakit.enable).

- [vivid](https://github.com/sharkdp/vivid), a generator for `LS_COLOR`. Available as [programs.vivid](../../options/programs/index.md#opt-programs.vivid.enable).

- [matrix-alertmanager](https://github.com/jaywink/matrix-alertmanager), a bot to receive Alertmanager webhook events and forward them to chosen Matrix rooms. Available as [services.matrix-alertmanager](../../options/services-m/index.md#opt-services.matrix-alertmanager.enable).

- [waagent](https://github.com/Azure/WALinuxAgent), the Microsoft Azure Linux Agent (waagent) manages Linux provisioning and VM interaction with the Azure Fabric Controller. Available with [services.waagent](../../options/services-w/index.md#opt-services.waagent.enable).

- [nfc-nci](https://github.com/StarGate01/ifdnfc-nci), an alternative NFC stack and PC/SC driver for the NXP PN54x chipset, commonly found in Lenovo systems as NXP1001 (NPC300). Available as [hardware.nfc-nci](../../options/hardware/index.md#opt-hardware.nfc-nci.enable).

- [grav](https://getgrav.org/), a modern flat-file CMS. Available with [services.grav](../../options/services-g/index.md#opt-services.grav.enable).

- [duckdns](https://www.duckdns.org), free dynamic DNS. Available with [services.duckdns](../../options/services-d/index.md#opt-services.duckdns.enable).

- [Zoxide](https://github.com/ajeetdsouza/zoxide), a smarter cd command, inspired by z and autojump. Available as [programs.zoxide](../../options/programs/index.md#opt-programs.zoxide.enable).

- [victorialogs](https://docs.victoriametrics.com/victorialogs/), log database from VictoriaMetrics. Available as [services.victorialogs](../../options/services-v/index.md#opt-services.victorialogs.enable).

- [gokapi](https://github.com/Forceu/Gokapi), Lightweight selfhosted Firefox Send alternative without public upload. AWS S3 supported. Available with [services.gokapi](../../options/services-g/index.md#opt-services.gokapi.enable).

- [nostr-rs-relay](https://git.sr.ht/~gheartsfield/nostr-rs-relay/), This is a nostr relay, written in Rust. Available as [services.nostr-rs-relay](../../options/services-n/index.md#opt-services.nostr-rs-relay.enable).

- [haven](https://github.com/bitvora/haven), is a high availability vault for events on nostr. Available as [services.haven](../../options/services-h/index.md#opt-services.haven.enable).

- [strfry](https://github.com/hoytech/strfry), a relay for the nostr protocol. Available as [services.strfry](../../options/services-s/index.md#opt-services.strfry.enable).

- [Prometheus Node Cert Exporter](https://github.com/amimof/node-cert-exporter), a prometheus exporter to check for SSL cert expiry. Available as [services.prometheus.exporters.node-cert](../../options/services-p/index.md#opt-services.prometheus.exporters.node-cert.enable).

- [Actual Budget](https://actualbudget.org/), a local-first personal finance app. Available as [services.actual](../../options/services-a/index.md#opt-services.actual.enable).

- [immich-public-proxy](https://github.com/alangrainger/immich-public-proxy), a proxy for sharing Immich albums without exposing the Immich API. Available as [services.immich-public-proxy](../../options/services-i/index.md#opt-services.immich-public-proxy.enable).

- [Omada Software Controller](https://www.tp-link.com/us/business-networking/omada-sdn-controller/omada-software-controller), a professional and free on-premises controller for the Omada Software Defined Networking (SDN) platform, provides centralized management of Omada access points, switches and routers. Available as [services.omada](../../options/services-o/index.md#opt-services.omada.enable).

- [Zipline](https://zipline.diced.sh/), a ShareX/file upload server that is easy to use, packed with features, and with an easy setup. Available as [services.zipline](../../options/services-z/index.md#opt-services.zipline.enable).

- [GlitchTip](https://glitchtip.com/), an open source Sentry API compatible error tracking platform. Available as [services.glitchtip](../../options/services-g/index.md#opt-services.glitchtip.enable).

- [`yarr`](https://github.com/nkanaev/yarr), a small, web-based feed aggregator and RSS reader. Available as [services.yarr](../../options/services-y/index.md#opt-services.yarr.enable).

- [OliveTin](https://www.olivetin.app/), gives safe and simple access to predefined shell commands from a web interface. Available as [services.olivetin](../../options/services-o/index.md#opt-services.olivetin.enable).

- [alertmanager-ntfy](https://github.com/alexbakker/alertmanager-ntfy), forwards Prometheus Alertmanager notifications to ntfy.sh. Available as [services.prometheus.alertmanager-ntfy](../../options/services-p/index.md#opt-services.prometheus.alertmanager-ntfy.enable).

- [Stash](https://github.com/stashapp/stash), an organizer for your adult videos/images, written in Go. Available as [services.stash](../../options/services-s/index.md#opt-services.stash.enable).

- [vsmartcard-vpcd](https://frankmorgner.github.io/vsmartcard/virtualsmartcard/README.html), a virtual smart card driver. Available as [services.vsmartcard-vpcd](../../options/services-v/index.md#opt-services.vsmartcard-vpcd.enable).

- [Fider](https://fider.io/), an open platform to collect and prioritize feedback. Available as [services.fider](../../options/services-f/index.md#opt-services.fider.enable).

- [PDS](https://github.com/bluesky-social/pds), Personal Data Server for [bsky](https://bsky.social/). Available as `services.pds`.

- [Anubis](https://github.com/TecharoHQ/anubis), a scraper defense software. Available as [services.anubis](../../options/services-a/index.md#opt-services.anubis.defaultOptions).

- [synapse-auto-compressor](https://github.com/matrix-org/rust-synapse-compress-state?tab=readme-ov-file#automated-tool-synapse_auto_compressor), a rust-based matrix-synapse state compressor for postgresql. Available as [services.synapse-auto-compressor](../../options/services-s/index.md#opt-services.synapse-auto-compressor.enable).

- [mqtt-exporter](https://github.com/kpetremann/mqtt-exporter/), a Prometheus exporter for exposing messages from MQTT. Available as [services.prometheus.exporters.mqtt](../../options/services-p/index.md#opt-services.prometheus.exporters.mqtt.enable).

- [pocket-id](https://pocket-id.org/), an OIDC provider with passkeys support. Available as [services.pocket-id](../../options/services-p/index.md#opt-services.pocket-id.enable).

- [nvidia-gpu](https://github.com/utkuozdemir/nvidia_gpu_exporter), a Prometheus exporter that scrapes `nvidia-smi` for GPU metrics. Available as [services.prometheus.exporters.nvidia-gpu](../../options/services-p/index.md#opt-services.prometheus.exporters.nvidia-gpu.enable).

- [Lavalink](https://github.com/lavalink-devs/Lavalink), a standalone audio sending node based on Lavaplayer and Koe. Available as [services.lavalink](../../options/services-l/index.md#opt-services.lavalink.enable).

- [OpenGamepadUI](https://github.com/ShadowBlip/OpenGamepadUI/), an open source gamepad-native game launcher and overlay for Linux. Available as [programs.opengamepadui](../../options/programs/index.md#opt-programs.opengamepadui.enable).

- [InputPlumber](https://github.com/ShadowBlip/InputPlumber/), an open source input router and remapper daemon for Linux. Available as [services.inputplumber](../../options/services-i/index.md#opt-services.inputplumber.enable).

- [`dump1090-fa`](https://github.com/flightaware/dump1090), a simple Mode S decoder for RTLSDR devices with a web interface. Available as [services.dump1090-fa](../../options/services-d/index.md#opt-services.dump1090-fa.enable).

- [PowerStation](https://github.com/ShadowBlip/PowerStation/), an open source TDP control and performance daemon with DBus interface for Linux. Available as [services.powerstation](../../options/services-p/index.md#opt-services.powerstation.enable).

- [`g3proxy`](https://github.com/bytedance/g3), an open source enterprise forward proxy from ByteDance, similar to Squid or tinyproxy. Available as [services.g3proxy](../../options/services-g/index.md#opt-services.g3proxy.enable).

- [OpenCloud](https://opencloud.eu/), an open-source, modern file-sync and sharing platform. It is a fork of oCIS, a ground-up rewrite of the well-known PHP-based NextCloud server. Available as [services.opencloud](../../options/services-o/index.md#opt-services.opencloud.enable).

- [echoip](https://github.com/mpolden/echoip), a simple service for looking up your IP address. Available as [services.echoip](../../options/services-e/index.md#opt-services.echoip.enable).

- [whoami](https://github.com/traefik/whoami), a tiny Go server that prints OS information and HTTP request to output. Available as [services.whoami](../../options/services-w/index.md#opt-services.whoami.enable).

- [LiteLLM](https://github.com/BerriAI/litellm), a LLM Gateway to provide model access, fallbacks and spend tracking across 100+ LLMs. All in the OpenAI format. Available as [services.litellm](../../options/services-l/index.md#opt-services.litellm.enable).

- [Buffyboard](https://gitlab.postmarketos.org/postmarketOS/buffybox/-/tree/master/buffyboard), a framebuffer on-screen keyboard. Available as [services.buffyboard](../../options/services-b/index.md#opt-services.buffyboard.enable).

- [KanBoard](https://github.com/kanboard/kanboard), a project management tool that focuses on the Kanban methodology. Available as [services.kanboard](../../options/services-k/index.md#opt-services.kanboard.enable).

- [git-worktree-switcher](https://github.com/mateusauler/git-worktree-switcher), switch between git worktrees with speed. Available as [programs.git-worktree-switcher](../../options/programs/index.md#opt-programs.git-worktree-switcher.enable).

- [GLPI-Agent](https://github.com/glpi-project/glpi-agent), GLPI Agent. Available as [services.glpiAgent](../../options/services-g/index.md#opt-services.glpiAgent.enable).

- [pgBackRest](https://pgbackrest.org), a reliable backup and restore solution for PostgreSQL. Available as [services.pgbackrest](../../options/services-p/index.md#opt-services.pgbackrest.enable).

- [Recyclarr](https://github.com/recyclarr/recyclarr) a TRaSH Guides synchronizer for Sonarr and Radarr. Available as [services.recyclarr](../../options/services-r/index.md#opt-services.recyclarr.enable).

- [Rebuilderd](https://github.com/kpcyrd/rebuilderd) an independent verification of binary packages - Reproducible Builds. Available as [services.rebuilderd](../../options/services-r/index.md#opt-services.rebuilderd.enable).

- [Limine](https://github.com/limine-bootloader/limine) a modern, advanced, portable, multiprotocol bootloader and boot manager. Available as [boot.loader.limine](../../options/boot/index.md#opt-boot.loader.limine.enable).

- [tee-supplicant](https://github.com/OP-TEE/optee_client), a userspace supplicant for OP-TEE OS. Available as [services.tee-supplicant](../../options/services-t/index.md#opt-services.tee-supplicant.enable).

- [Orthanc](https://orthanc.uclouvain.be/) a lightweight, RESTful DICOM server for healthcare and medical research. Available as [services.orthanc](../../options/services-o/index.md#opt-services.orthanc.enable).

- [Docling Serve](https://github.com/docling-project/docling-serve) running [Docling](https://github.com/docling-project/docling) as an API service. Available as [services.docling-serve](../../options/services-d/index.md#opt-services.docling-serve.enable).

- [Pareto Security](https://paretosecurity.com/) is an alternative to corporate compliance solutions for companies that care about security but know it doesn't have to be invasive. Available as [services.paretosecurity](../../options/services-p/index.md#opt-services.paretosecurity.enable).

- [GNU Rush](https://gnu.org/software/rush/) is a Restricted User Shell, designed for systems providing limited remote access to their resources. Available as [programs.rush](../../options/programs/index.md#opt-programs.rush.enable).

- [ipfs-cluster](https://ipfscluster.io/), Pinset orchestration for IPFS. Available as [services.ipfs-cluster](../../options/services-i/index.md#opt-services.ipfs-cluster.enable).

- [bitbox-bridge](https://github.com/BitBoxSwiss/bitbox-bridge), a bridge software that connects BitBox hardware wallets to computers & web wallets like [Rabby](https://rabby.io/). Allows one to interact & transact with smart contracts, Web3 websites & financial services without storing private keys anywhere other than the hardware wallet. Available as [services.bitbox-bridge](../../options/services-b/index.md#opt-services.bitbox-bridge.enable).

- [GoDNS](https://github.com/TimothyYe/godns), a dynamic DNS client written in Go, which supports multiple DNS providers. Available as [services.godns](../../options/services-g/index.md#opt-services.godns.enable).

- [CookCLI](https://cooklang.org/cli/) Server, a web UI for cooklang recipes. Available as [services.cook-cli](../../options/services-c/index.md#opt-services.cook-cli.enable).

- [Prometheus eBPF Exporter](https://github.com/cloudflare/ebpf_exporter),
  Prometheus exporter for custom eBPF metrics. Available as
  [services.prometheus.exporters.ebpf](../../options/services-p/index.md#opt-services.prometheus.exporters.ebpf.enable).

<!-- To avoid merge conflicts, consider adding your item at an arbitrary place in the list instead. -->

## Backward Incompatibilities {#sec-release-25.05-incompatibilities}

<!-- To avoid merge conflicts, consider adding your item at an arbitrary place in the list instead. -->

- `services.rippled` has been removed, as `rippled` was broken and had not been updated since 2022.

- `services.rippleDataApi` has been removed, as `ripple-data-api` was broken and had not been updated since 2022.

- The `nixos/modules/virtualisation/amazon-ec2-amis.nix` file is not supported anymore since 24.05. It will throw
  and error starting 25.05 with instructions the following instructions:
  The canonical source for NixOS AMIs is the AWS API. Please see https://nixos.org/download/#nixos-amazon or  https://nixos.github.io/amis/ for instructions.

- The latest available version of Nextcloud is v31 (available as `pkgs.nextcloud31`). The installation logic is as follows:

  - If [`services.nextcloud.package`](../../options/services-n/index.md#opt-services.nextcloud.package) is specified explicitly, this package will be installed (**recommended**)
  - If [`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion) is \>=24.11, `pkgs.nextcloud30` will be installed by default.
  - If [`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion) is \>=24.05, `pkgs.nextcloud31` will be installed by default.
  - Please note that an upgrade from v29 (or older) to v31 directly is not possible. Please upgrade to `nextcloud30` (or earlier) first. Nextcloud prohibits skipping major versions while upgrading. You can upgrade by declaring [`services.nextcloud.package = pkgs.nextcloud30;`](../../options/services-n/index.md#opt-services.nextcloud.package).

- `services.cloudflare-dyndns.apiTokenFile` now must be just your Cloudflare api token. Previously it was supposed to be a file of the form `CLOUDFLARE_API_TOKEN=...`.

- [services (N)](../../options/services-n/index.md#opt-services.nextcloud.config.dbtype) is unset by default, the previous default was `sqlite`.
  This was done because `sqlite` is not a reasonable default since it's
  [not recommended by upstream](https://docs.nextcloud.com/server/30/admin_manual/installation/system_requirements.html)
  and thus doesn't qualify as default.

- PowerDNS Recursor has been updated to version 5.1.2, which comes with a new YAML configuration format (`recursor.yml`)
  and deprecates the previous format (`recursor.conf`). Accordingly, the NixOS option [`services.pdns-recursor.settings`](../../options/services-p/index.md#opt-services.pdns-recursor.settings)
  has been renamed to `old-settings` and will be provided for backward compatibility
  until the next NixOS release. Users are asked to migrate their settings to the new `yaml-settings`.
  option following this [guide](https://doc.powerdns.com/recursor/appendices/yamlconversion.html).
  Note that options other than [`services.pdns-recursor.settings`](../../options/services-p/index.md#opt-services.pdns-recursor.settings) are unaffacted by this change.

- The `virtualisation.hypervGuest.videoMode` option has been removed. Standard tooling can now be used to configure display modes for Hyper-V VMs.

- Nextcloud's default FPM pool settings have been increased according to upstream recommendations. It's advised
  to review the new defaults and description of
  [services (N)](../../options/services-n/index.md#opt-services.nextcloud.poolSettings).

- In `users.users` subuid allocation on systems with multiple users it could happen that some users' allocated subuid ranges collided with others. Now these users get new subuid ranges assigned. When this happens, a warning is issued on the first activation. If the subuids were used (e.g. with rootless container managers like podman), please change the ownership of affected files accordingly.

- The `services.locate` module does no longer support findutil's `locate` due to its inferior performance compared to `mlocate` and `plocate`. The new default is `plocate`.
  As the `service.locate.localuser` option only applied when using findutil's `locate`, it has also been removed.

- `services.paperless` now installs `paperless-manage` as a normal system package instead of creating a symlink in `/var/lib/paperless`.
  `paperless-manage` now also changes to the appropriate user when being executed.

- `asusd` has been upgraded to version 6 which supports multiple aura devices. To account for this, the single `auraConfig` configuration option has been replaced with `auraConfigs` which is an attribute set of config options per each device. The config files may also be now specified as either source files or text strings; to account for this you will need to specify that `text` is used for your existing configs, e.g.:

  ``` diff
  -services.asusd.asusdConfig = '''file contents'''
  +services.asusd.asusdConfig.text = '''file contents'''
  ```

- `linuxPackages.nvidiaPackages.stable` now defaults to the `production` variant instead of `latest`.

- `services.paperless.address` no longer accepts a domain name or Unix domain socket.

- `networking.wireguard.enable = true` does not always add `wireguard-tools` to system packages anymore. Only when wireguard interfaces are configured, the backing implementation packages are added to system PATH.

- `virtualisation/azure-common.nix`'s filesystem and grub configurations have been moved to `virtualisation/azure-image.nix`. This makes `azure-common.nix` more generic so it could be used for users who generate Azure image using other methods (e.g. nixos-generators and disko). For existing users depending on these configurations, please also import `azure-image.nix`.

- `services.signald` has been removed as `signald` is unmaintained upstream and has been incompatible to official Signal servers for a long while.

- The `earlyoom` service is now using upstream systemd service, which enables
  hardening and filesystem isolation by default. If you need filesystem write
  access or want to access home directory via `killHook`, hardening setting can
  be changed via, e.g. `systemd.services.earlyoom.serviceConfig.ProtectSystem`.

  `services.earlyoom.extraArgs` is now shell-escaped for each element without
  word-breaking. So you want to write `extraArgs = [ "--prefer" "spaced pat" ]`
  rather than previous `extraArgs = [ "--prefer 'spaced pat'" ]`.

- `programs.less.lessopen` is now null by default. To restore the previous behaviour, set it to `''|${lib.getExe' pkgs.lesspipe "lesspipe.sh"} %s''`.

- `hardware.pulseaudio` has been renamed to `services.pulseaudio`.  The deprecated option names will continue to work, but causes a warning.

- `services.nextcloud` now uses systemd's credential mechanism to read in secret files. The `nextcloud-occ` wrapper script implements this using `systemd-run`, as such it now also requires root privileges or `$CREDENTIALS_DIRECTORY` set where running it as user `nextcloud` was enough previously.

- `services.mongodb.initialRootPassword` has been replaced with the more secure option [`services.mongodb.initialRootPasswordFile`](../../options/services-m/index.md#opt-services.mongodb.initialRootPasswordFile)

- `services.bird2` has been renamed to `services.bird` and the default bird package has been switched to `bird3`. `bird2` can still be chosen via the `services.bird.package` option.

- The behavior of the `networking.nat.externalIP` and `networking.nat.externalIPv6` options has been changed. `networking.nat.forwardPorts` now only forwards packets destined for the specified IP addresses.

- `gitlab` has been updated from 17.x to 18.x and requires `postgresql` \>= 16, as stated in the [documentation](https://docs.gitlab.com/18.0/install/requirements/#postgresql). Check the [upgrade guide](../../modules/postgresql/index.md#module-services-postgres-upgrading) in the NixOS manual on how to upgrade your PostgreSQL installation.

- `services.gitlab` now requires the setting of `activeRecordPrimaryKeyFile`, `activeRecordDeterministicKeyFile`, `activeRecordSaltFile` as GitLab introduced Rails ActiveRecord encryption.

- The Mattermost module ([`services.mattermost`](../../options/services-m/index.md#opt-services.mattermost.enable)) and packages (`mattermost` and `mmctl`) have been substantially updated:

  - `services.mattermost.listenAddress` has been split into [services (M)](../../options/services-m/index.md#opt-services.mattermost.host) and [services (M)](../../options/services-m/index.md#opt-services.mattermost.port). If your `listenAddress` contained a port, you will need to edit your configuration. This will be the only truly breaking change in this release for most configurations.
  - [services (M)](../../options/services-m/index.md#opt-services.mattermost.preferNixConfig) now defaults to true if you advance [system](../../options/system/index.md#opt-system.stateVersion) to 25.05. This means that if you have [services (M)](../../options/services-m/index.md#opt-services.mattermost.mutableConfig) set, NixOS will override settings set in the Admin Console to those that you define in the module configuration. It is recommended to leave this at the default, even if you used a fully mutable configuration before, because it will ensure that your Mattermost data directories are correct. If you moved your data directories, you may want to review the module changes before upgrading.
  - Mattermost now supports peer authentication on both MySQL and Postgres database backends. Updating [system](../../options/system/index.md#opt-system.stateVersion) to 25.05 or later will result in peer authentication being used by default if the Mattermost server would otherwise be connecting to localhost. This is the recommended configuration.
  - Note that the Mattermost module will create an account *without* a well-known UID if the username differs from the default (`mattermost`). If you used Mattermost with a nonstandard username, you may want to review the module changes before upgrading.

- DokuWiki with the Caddy webserver (`services.dokuwiki.webserver = "caddy"`) now sets up sites with Caddy's automatic HTTPS instead of HTTP-only.
  To keep the old behavior for a site `example.com`, set `services.caddy.virtualHosts."example.com".hostName = "http://example.com"`.
  If you set custom Caddy options for a DokuWiki site, migrate these options by removing `http://` from `services.caddy.virtualHosts."http://example.com"`.

- Wordpress with the Caddy webserver (`services.wordpress.webserver = "caddy"`) now sets up sites with Caddy's automatic HTTPS instead of HTTP-only.
  Given a site example.com, http://example.com now 301 redirects to https://example.com.
  To keep the old behavior for a site `example.com`, set `services.caddy.virtualHosts."example.com".hostName = "http://example.com"`.

- The behavior of `services.hostapd.radios.<name>.networks.<name>.authentication.enableRecommendedPairwiseCiphers` was changed to not include `CCMP-256` anymore.
  Since all configured pairwise ciphers have to be supported by the radio, this caused startup failures on many devices which is hard to debug in hostapd.

- The `hardware.gkraken` module has been removed. The recommended alternative is [`programs.coolercontrol`](../../options/programs/index.md#opt-programs.coolercontrol.enable).

- To avoid delaying user logins unnecessarily the `multi-user.target` is no longer ordered after `network-online.target`.
  System services requiring a connection to start correctly must explicitly state so, i.e.

  ``` nix
  {
    systemd.services."<name>" = {
      wants = [ "network-online.target" ];
      after = [ "network-online.target" ];
    };
  }
  ```

  This changed follows a deprecation period of one year started in NixOS 24.05 (see [PR #283818](https://github.com/NixOS/nixpkgs/pull/283818)).

- The values of `services.borgbackup.jobs.*.extraArgs` and other `extra*Args` options are now represented as Bash arrays. If these arguments were modified using `services.borgbackup.jobs.*.preHook`, they will need to be adjusted to append to these arrays, i.e.

  ``` diff
  -extraCreateArgs="$extraCreateArgs --exclude /some/path"
  +extraCreateArgs+=("--exclude" "/some/path")
  ```

- `programs.xonsh.package` now gets overridden internally with `extraPackages` to support `programs.xonsh.extraPackages`. See `programs.xonsh.extraPackages` for more details.

- `services.nitter.guestAccounts` has been renamed to `services.nitter.sessionsFile`, for consistency with upstream. The file format is unchanged.

- `virtualisation.azure.agent` option provided by `azure-agent.nix` is replaced by `services.waagent`, and will be removed in a future release.

- Netdata removed support for non cloud deployments in version 2, so the `withCloud` option has been removed.

- The ZFS import service now respects `fileSystems.*.options = [ "noauto" ];` and does not add that pool's import service to `zfs-import.target`, meaning it will not be automatically imported at boot.

- Default file names of images generated by several builders in `system.build` have been changed as outlined in the table below.

  Names are now known at evaluation time and customizable via the new options `image.baseName`, `image.extension`, `image.fileName` and `image.filePath` with the latter returning a path relative to the derivations out path (e.g. `iso/${image.fileName` for iso images).

  | `system.build` Option | Old Filename | New Filename |
  | --- | --- | --- |
  | amazonImage | nixos-amazon-image-25.05pre-git-x86\_64-linux.vhd | nixos-image-amazon-25.05pre-git-x86\_64-linux.vhd |
  | azureImage | disk.vhd | nixos-image-azure-25.05pre-git-x86\_64-linux.vhd |
  | digitalOceanImage | nixos.qcow2.gz | nixos-image-digital-ocean-25.05pre-git-x86\_64-linux.qcow2.gz |
  | googleComputeImage | nixos-image-25.05pre-git-x86\_64-linux.raw.tar.gz | nixos-image-google-compute-25.05pre-git-x86\_64-linux.raw.tar.gz |
  | hypervImage | nixos-25.05pre-git-x86\_64-linux.vhdx | nixos-image-hyperv-25.05pre-git-x86\_64-linux.vhdx |
  | isoImage (installer) | nixos-25.05pre-git-x86\_64-linux.iso | nixos-image-25.05pre-git-x86\_64-linux.iso |
  | isoImage | nixos.iso | nixos-image-25.05pre-git-x86\_64-linux.iso |
  | kubevirtImage | nixos.qcow2 | nixos-image-kubevirt-25.05pre-git-x86\_64-linux.qcow2 |
  | linodeImage | nixos-image-25.05pre-git-x86\_64-linux.img.gz | nixos-image-linode-25.05pre-git-x86\_64-linux.img.gz |
  | metadata (lxc-container) | nixos-system-x86\_64-linux.tar.xz | nixos-image-lxc-metadata-25.05pre-git-x86\_64-linux.tar.xz |
  | OCIImage | nixos.qcow2 | nixos-image-oci-25.05pre-git-x86\_64-linux.qcow2 |
  | openstackImage (zfs) | nixos-openstack-image-25.05pre-git-x86\_64-linux.root.qcow2 | nixos-image-openstack-zfs-25.05pre-git-x86\_64-linux.root.qcow2 |
  | openstackImage | nixos.qcow2 | nixos-image-openstack-25.05pre-git-x86\_64-linux.qcow2 |
  | sdImage | nixos-sd-image-25.05pre-git-x86\_64-linux.img.zst | nixos-image-sd-card-25.05pre-git-x86\_64-linux.img.zst |
  | tarball (lxc-container) | nixos-system-x86\_64-linux.tar.xz | nixos-image-lxc-25.05pre-git-x86\_64-linux.tar.xz |
  | tarball (proxmox-lxc) | nixos-system-x86\_64-linux.tar.xz | nixos-image-lxc-proxmox-25.05pre-git-x86\_64-linux.tar.xz |
  | vagrantVirtualbox | nixos-25.05pre-git-x86\_64-linux.ova | nixos-image-virtualbox-25.05pre-git-x86\_64-linux.ova |
  | virtualBoxOVA | virtualbox-vagrant.box | nixos-image-vagrant-virtualbox-25.05pre-git-x86\_64-linux.ova |
  | vmwareImage | nixos-25.05pre-git-x86\_64-linux.vmdk | nixos-image-vmware-25.05pre-git-x86\_64-linux.vmdk |

- `security.apparmor.policies.<name>.enforce` and `security.apparmor.policies.<name>.enable` were removed.
  Configuring the state of apparmor policies must now be done using `security.apparmor.policies.<name>.state` tristate option.

- `services.graylog.package` now defaults to `graylog-6_0` as previous default `graylog-5_1` is EOL and therefore removed.
  Check the migration guides on [5.1→5.2](https://go2docs.graylog.org/5-2/upgrading_graylog/upgrading_to_graylog_5.2.x.htm) and [5.2→6.0](https://go2docs.graylog.org/6-0/upgrading_graylog/upgrading_to_graylog_6.0.x.html) for breaking changes.

- `programs.clash-verge.tunMode` was deprecated and removed because now service mode is necessary to start program. Without `programs.clash-verge.enable`, clash-verge-rev will refuse to start.

- `services.discourse` now requires PostgreSQL 15 per default. Please update before upgrading.

- `services.homepage-dashboard` now requires the `allowedHosts` option to be set in accordance with the [documentation](https://gethomepage.dev/installation/#homepage_allowed_hosts).

- `luakit` has been updated to 2.4.0. If you use any website which uses IndexedDB or local storage and wish to retain the saved information, [some manual intervention may be required](https://luakit.github.io/news/luakit-2.4.0.html)

- `services.netbird.tunnels` was renamed to [`services.netbird.clients`](../../options/services-n/index.md#opt-services.netbird.clients),
  hardened (using dedicated less-privileged users) and significantly extended.

- `services.rsyncd.settings` now supports only two attributes `sections` and `globalSection`.
  As a result, all sections previously defined under `services.rsyncd.settings` must now be put in `services.rsyncd.settings.sections`.
  Global settings must now be placed in `services.rsyncd.settings.globalSection` instead of `services.rsyncd.settings.global`.

<!-- To avoid merge conflicts, consider adding your item at an arbitrary place in the list instead. -->

## Other Notable Changes {#sec-release-25.05-notable-changes}

<!-- To avoid merge conflicts, consider adding your item at an arbitrary place in the list instead. -->

- `virtualisation.containers` with backend "podman" now supports rootless containers and `sd_notify(3)`-integration
  based on container healthchecks.

- Cinnamon has been updated to 6.4, please check the [upstream announcement](https://www.linuxmint.com/rel_xia_whatsnew.php) for more details.

  - Following [changes in Mint 22](https://github.com/linuxmint/mintupgrade/commit/f239cde908288b8c250f938e7311c7ffbc16bd59) we are no longer overriding Qt application styles. You can still restore the previous default with `qt.style = "gtk2"` and `qt.platformTheme = "gtk2"`.
  - Following [changes in Mint 20](https://github.com/linuxmint/mintupgrade-legacy/commit/ce15d946ed9a8cb8444abd25088edd824bfb18f6) we are replacing xplayer with celluloid since xplayer is no longer maintained.

- Pantheon has been updated to 8, please check the [upstream announcement](https://blog.elementary.io/os-8-available-now/) for more details.

  - Same as elementary OS, the X11 session is named "Classic Session" and the Wayland session is named "Secure Session".
  - The dock has been rewritten, you need to manually migrate the dock items on update. You can check `~/.config/plank/dock1/launchers/` for your previous settings.

- Xfce has been updated to 4.20, please check the [upstream feature tour](https://www.xfce.org/about/tour420) for more details.

  - Wayland session is still [experimental](https://wiki.xfce.org/releng/wayland_roadmap) and requires opt-in using `enableWaylandSession` option.
  - Overriding Wayland compositor is possible using `waylandSessionCompositor` option, but you might need to take care [`xfce4-session`](https://gitlab.xfce.org/xfce/xfce4-session/-/merge_requests/49), [`dbus-update-activation-environment`](https://github.com/labwc/labwc/blob/eaf11face68ee1f1bcc7ce1498304ca8c108c8ba/src/config/session.c#L234) and [`systemctl --user import-environment`](https://github.com/labwc/labwc/blob/eaf11face68ee1f1bcc7ce1498304ca8c108c8ba/src/config/session.c#L239) on startup.
  - For new Xfce installations, default panel layout has [changed](https://gitlab.xfce.org/xfce/xfce4-panel/-/merge_requests/158/diffs) to not include external panel plugins by default. You can still add them yourself using the "Panel Preferences" dialog.

- PAM services for `i3lock`/`i3lock-color`, `vlock`, `xlock`, and `xscreensaver` now default to disabled unless other corresponding NixOS options are set (`programs.i3lock.enable`, `console.enable`, `services.xserver.enable`, and `services.xscreensaver.enable`, respectively). If for some reason you want one of them back without setting the corresponding option, set, e.g., `security.pam.services.xlock.enable = true`.

- The `nixos-generate-config` command now supports a optional `--flake` option, which will generate a flake.nix file alongside the `configuration.nix` and `hardware-configuration.nix`, providing an easy introduction into flake-based system configurations.

- [`system.stateVersion`](../../options/system/index.md#opt-system.stateVersion) is now validated and must be in the `"YY.MM"` format, ideally corresponding to a prior NixOS release.

- [`hardware.xone`](../../options/hardware/index.md#opt-hardware.xone.enable) will also enable [`hardware.xpad-noone`](../../options/hardware/index.md#opt-hardware.xpad-noone.enable) to provide Xbox 360 driver by default.

- `services.mysql` now supports easy cluster setup via [`services.mysql.galeraCluster`](../../options/services-m/index.md#opt-services.mysql.galeraCluster.enable) option.

  Example:

  ``` nix
  {
    services.mysql = {
      enable = true;
      galeraCluster = {
        enable = true;
        localName = "Node 1";
        localAddress = "galera_01";
        nodeAddresses = [
          "galera_01"
          "galera_02"
          "galera_03"
        ];
      };
    };
  }
  ```

- systemd's `systemd-ssh-generator(8)` now works out of the box on NixOS.

  - You can ssh into VMs without any networking configuration if your hypervisor configures the vm to support AF\_VSOCK.
    It still requires the usual ssh authentication methods.
  - An SSH key for the root user can be provisioned using the `ssh.authorized_keys.root` systemd credential.
    This can be useful for booting an installation image and providing the SSH key with an smbios string.
  - SSH can be used for suid-less privilege escalation on the local system without having to rely on networking:
    ``` shell
    ssh root@.host
    ```
  - systemd's `systemd-ssh-proxy(1)` is enabled by default. It can be disabled using [`programs.ssh.systemd-ssh-proxy.enable`](../../options/programs/index.md#opt-programs.ssh.systemd-ssh-proxy.enable).

- SSH host key generation has been separated into the dedicated systemd service sshd-keygen.service.

- [`services.dex`](../../options/services-d/index.md#opt-services.dex.enable) now restarts upon changes to the [`.environmentFile`](../../options/services-d/index.md#opt-services.dex.environmentFile) option or `path` type entries in `.settings.staticClients[].secretFile`.

- [`services.geoclue2`](../../options/services-g/index.md#opt-services.geoclue2.enable) now has an `enableStatic` option, which allows the NixOS configuration to specify a fixed location for GeoClue to use.

- [`services.mongodb`](../../options/services-m/index.md#opt-services.mongodb.enable) is now compatible with the `mongodb-ce` binary package. To make use of it, set [`services.mongodb.package`](../../options/services-m/index.md#opt-services.mongodb.package) to `pkgs.mongodb-ce`.

- [`services.jupyter`](../../options/services-j/index.md#opt-services.jupyter.enable) is now compatible with `Jupyter Notebook 7`. See [the migration guide](https://jupyter-notebook.readthedocs.io/en/latest/migrate_to_notebook7.html) for details.

- `networking.wireguard` now has an optional networkd backend. It is enabled by default when `networking.useNetworkd` is enabled, and it can be enabled alongside scripted networking with `networking.wireguard.useNetworkd`. Some `networking.wireguard` options have slightly different behavior with the networkd and script-based backends, documented in each option.

- `services.rss-bridge` now has a `package` option as well as support for `caddy` as reverse proxy.

- `services.avahi.ipv6` now defaults to true.

- In the `services.xserver.displayManager.startx` module, two new options [generateScript](../../options/services-x/index.md#opt-services.xserver.displayManager.startx.generateScript) and [extraCommands](../../options/services-x/index.md#opt-services.xserver.displayManager.startx.extraCommands) have been added to to declaratively configure the .xinitrc script.

- All services that require a root certificate bundle now use the value of a new read-only option, `security.pki.caBundle`.

- [`services.hddfancontrol`](../../options/services-h/index.md#opt-services.hddfancontrol.enable) has been modified to use an attribute set for settings, enabling configurations with multiple instances of the daemon running at once (e.g., for two separate drive bays).

- `services.cloudflared` now uses a dynamic user, and its `user` and `group` options have been removed. If the user or group is still necessary, they can be created manually.

- The Home Assistant module has new options [`services.home-assistant.blueprints.automation`](../../options/services-h/index.md#opt-services.home-assistant.blueprints.automation), `services.home-assistant.blueprints.script`, and [`services.home-assistant.blueprints.template`](../../options/services-h/index.md#opt-services.home-assistant.blueprints.template) that allow for the declarative installation of [blueprints](https://www.home-assistant.io/docs/blueprint/) into the appropriate configuration directories.

- `services.dovecot2.modules` have been removed, now need to use `environment.systemPackages` to load additional Dovecot modules.

- `services.kmonad` now creates a determinate symlink (in `/dev/input/by-id/`) to each of KMonad virtual devices.

- `services.searx` now supports configuration of the favicons cache and other options available in SearXNG's `favicons.toml` file

- `services.gitea` now supports CAPTCHA usage through the `services.gitea.captcha` variable.

- `services.soft-serve` now restarts upon config change.

- `services.keycloak` now provides a `realmFiles` option that allows to import realms during startup. See https://www.keycloak.org/server/importExport

- `bind.cacheNetworks` now only controls access for recursive queries, where it previously controlled access for all queries.

- The [Starship](https://starship.rs) module now automatically loads the starship prompt when using [`xonsh`](https://xon.sh).

- [`services.mongodb.enableAuth`](../../options/services-m/index.md#opt-services.mongodb.enableAuth) now uses the newer [mongosh](https://github.com/mongodb-js/mongosh) shell instead of the legacy shell to configure the initial superuser. You can configure the mongosh package to use through the [`services.mongodb.mongoshPackage`](../../options/services-m/index.md#opt-services.mongodb.mongoshPackage) option.

- There is a new set of NixOS test tools for testing virtual Wi-Fi networks in many different topologies. See the `services.vwifi` module, `services.kismet` NixOS test, and [manual](https://nixos.org/manual/nixpkgs/unstable/#sec-nixos-test-wifi) for documentation and examples.

- The paperless module now has an option for regular automatic export of documents data using the integrated document exporter.

- Exposed the `paperless-manage` script package via the `services.paperless.manage` read-only option.

- New options for the declarative configuration of the user space part of ALSA have been introduced under [hardware.alsa](../../options/hardware/index.md#opt-hardware.alsa.enable), including setting the default capture and playback device, defining sound card aliases and volume controls.
  Note: these are intended for users not running a sound server like PulseAudio or PipeWire, but having ALSA as their only sound system.

- `services.k3s` now provides the `autoDeployCharts` option that allows to automatically deploy Helm charts via the k3s Helm controller.

- [Mattermost](../../options/services-m/index.md#opt-services.mattermost.enable), a self-hosted chat collaboration platform supporting calls, playbooks, and boards, has been updated. It now has multiple versions, disabled telemetry, and a native frontend build in nixpkgs, removing all upstream prebuilt blobs.

  - Mattermost telemetry reporting is now disabled by default, though security update notifications are enabled. Look at [`services.mattermost.telemetry`](../../options/services-m/index.md#opt-services.mattermost.telemetry.enableDiagnostics) for options to control this behavior.
  - The Mattermost module will produce eval warnings if a database password would end up in the Nix store, and recommend alternatives such as peer authentication or using the environment file.
  - We now support `mmctl` for Mattermost administration if both [services (M)](../../options/services-m/index.md#opt-services.mattermost.socket.enable) and [services (M)](../../options/services-m/index.md#opt-services.mattermost.socket.export) are set, which export the Mattermost control socket path into the system environment.

- `services.geoclue2` now uses [beaconDB](https://beacondb.net/) as a default geolocation service, replacing Mozilla Location Services which was [retired in June 2024](https://github.com/mozilla/ichnaea/issues/2065).

- `security.acme` now supports renewal using CSRs (Certificate Signing Request) through the options `security.acme.*.csr` and `security.acme.*.csrKey`.

- `programs.fzf.keybindings` now supports the fish shell.

- A toggle has been added under `users.users.<name>.enable` to allow toggling individual users conditionally. If set to false, the user account will not be created.

- New hooks were added:

  - `writableTmpDirAsHomeHook`: This setup hook ensures that the directory specified by the `HOME` environment variable is writable.
  - `addBinToPathHook`: This setup hook checks if the `bin/` directory exists in the `$out` output path and, if so, adds it to the `PATH` environment variable.
  - `gitSetupHook`: This setup hook sets up a valid Git configuration, including the `user.name` and `user.email` fields.

<!-- To avoid merge conflicts, consider adding your item at an arbitrary place in the list instead. -->

## NixOS Wiki {#sec-release-25.05-wiki}

The official NixOS Wiki at [wiki.nixos.org](https://wiki.nixos.org) has new and improved articles, new contributors and some improvements in its dark theme and mobile readability.
