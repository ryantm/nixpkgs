# Graphical {#sec-profile-graphical}

Defines a NixOS configuration with the Plasma 6 desktop. It's used by the
graphical installation CD.

It sets [services (X)](../../../options/services-x/index.md#opt-services.xserver.enable),
[services (D)](../../../options/services-d/index.md#opt-services.displayManager.sddm.enable),
[services (D)](../../../options/services-d/index.md#opt-services.desktopManager.plasma6.enable),
and [services (L)](../../../options/services-l/index.md#opt-services.libinput.enable) to true. It also
includes glxinfo and firefox in the system packages list.
