# Headless {#sec-profile-headless}

Common configuration for headless machines (e.g., Amazon EC2 instances).

Disables serial consoles,
[emergency mode](../../../options/systemd/index.md#opt-systemd.enableEmergencyMode),
[grub splash images](../../../options/boot/index.md#opt-boot.loader.grub.splashImage)
and configures the kernel to reboot automatically on panic.
