# Docker Container {#sec-profile-docker-container}

This is the profile from which the Docker images are generated. It prepares a
working system by importing the [Minimal](../../../configuration/profiles/minimal/index.md#sec-profile-minimal) and
[Clone Config](../../../configuration/profiles/clone-config/index.md#sec-profile-clone-config) profiles, and
setting appropriate configuration options that are useful inside a container
context, like [boot](../../../options/boot/index.md#opt-boot.isContainer).
