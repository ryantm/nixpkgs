# users {#sec-options-users}

## `users.allowNoPasswordLogin` {#opt-users.allowNoPasswordLogin}

Disable checking that at least the `root` user or a user in the `wheel` group can log in using
a password or an SSH key.

WARNING: enabling this can lock you out of your system. Enable this only if you know what are you doing.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.defaultUserHome` {#opt-users.defaultUserHome}

The default home directory for normal users.

*Type:* string

*Default:* `"/home"`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.defaultUserShell` {#opt-users.defaultUserShell}

This option defines the default shell assigned to user
accounts. This can be either a full system path or a shell package.

This must not be a store path, since the path is
used outside the store (in particular in /etc/passwd).

*Type:* absolute path or package

*Default:* `"/bin/sh"`

*Example:* `pkgs.zsh`

*Declared by:* [`nixos/modules/programs/shadow.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/shadow.nix)

## `users.enforceIdUniqueness` {#opt-users.enforceIdUniqueness}

Whether to require that no two users/groups share the same uid/gid.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraGroups` {#opt-users.extraGroups}

Alias of [`users.groups`](#opt-users.groups).

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraGroups.<name>.gid` {#opt-users.extraGroups._name_.gid}

The group GID. If the GID is null, a free GID is picked on
activation.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraGroups.<name>.members` {#opt-users.extraGroups._name_.members}

The user names of the group members, added to the
`/etc/group` file.

*Type:* list of (string, not containing newlines or colons)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraGroups.<name>.name` {#opt-users.extraGroups._name_.name}

The name of the group. If undefined, the name of the attribute set
will be used.

*Type:* string, not containing newlines or colons

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers` {#opt-users.extraUsers}

Alias of [`users.users`](#opt-users.users).

*Type:* attribute set of (submodule)

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.autoSubUidGidRange` {#opt-users.extraUsers._name_.autoSubUidGidRange}

Automatically allocate subordinate user and group ids for this user.
Allocated range is currently always of size 65536.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.createHome` {#opt-users.extraUsers._name_.createHome}

Whether to create the home directory and ensure ownership as well as
permissions to match the user.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.cryptHomeLuks` {#opt-users.extraUsers._name_.cryptHomeLuks}

Path to encrypted luks device that contains
the user's home directory.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.description` {#opt-users.extraUsers._name_.description}

A short description of the user account, typically the
user's full name.  This is actually the “GECOS” or “comment”
field in `/etc/passwd`.

*Type:* string, not containing newlines or colons

*Default:* `""`

*Example:* `"Alice Q. User"`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.enable` {#opt-users.extraUsers._name_.enable}

If set to false, the user account will not be created. This is useful for when you wish to conditionally
disable user accounts.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.expires` {#opt-users.extraUsers._name_.expires}

Set the date on which the user's account will no longer be
accessible. The date is expressed in the format YYYY-MM-DD, or null
to disable the expiry.
A user whose account is locked must contact the system
administrator before being able to use the system again.

*Type:* null or string matching the pattern \[\[:digit:\]\]{4}-\[\[:digit:\]\]{2}-\[\[:digit:\]\]{2}

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.extraGroups` {#opt-users.extraUsers._name_.extraGroups}

The user's auxiliary groups.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.group` {#opt-users.extraUsers._name_.group}

The user's primary group.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.hashedPassword` {#opt-users.extraUsers._name_.hashedPassword}

Specifies the hashed password for the user.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

To generate a hashed password run `mkpasswd`.

If set to an empty string (`""`), this user will be able to log in without
being asked for a password (but not via remote services such as SSH, or
indirectly via `su` or `sudo`). This should only be used
for e.g. bootable live systems. Note: this is different from setting an
empty password, which can be achieved using
`users.users.<name?>.password`.

If set to `null` (default) this user will not be able to log in using a
password (i.e. via `login` command).

*Type:* null or (string, not containing newlines or colons)

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.hashedPasswordFile` {#opt-users.extraUsers._name_.hashedPasswordFile}

The full path to a file that contains the hash of the user's
password. The password file is read on each system activation. The
file should contain exactly one line, the salted password hash
produced by `mkpasswd`.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.home` {#opt-users.extraUsers._name_.home}

The user's home directory.

*Type:* absolute path, not containing newlines or colons

*Default:* `"/var/empty"`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.homeMode` {#opt-users.extraUsers._name_.homeMode}

The user's home directory mode in numeric format. See `chmod(1)`. The mode is only applied if [`users.users.<name>.createHome`](#opt-users.users._name_.createHome) is true.

*Type:* string matching the pattern \[0-7\]{1,5}

*Default:* `"700"`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.ignoreShellProgramCheck` {#opt-users.extraUsers._name_.ignoreShellProgramCheck}

By default, nixos will check that programs.SHELL.enable is set to
true if the user has a custom shell specified. If that behavior isn't
required and there are custom overrides in place to make sure that the
shell is functional, set this to true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.initialHashedPassword` {#opt-users.extraUsers._name_.initialHashedPassword}

Specifies the initial hashed password for the user, i.e. the
hashed password assigned if the user does not already
exist. If [`users.mutableUsers`](#opt-users.mutableUsers) is true, the
password can be changed subsequently using the
`passwd` command. Otherwise, it's
equivalent to setting the `hashedPassword` option.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

To generate a hashed password run `mkpasswd`.

If set to an empty string (`""`), this user will be able to log in without
being asked for a password (but not via remote services such as SSH, or
indirectly via `su` or `sudo`). This should only be used
for e.g. bootable live systems. Note: this is different from setting an
empty password, which can be achieved using
`users.users.<name?>.password`.

If set to `null` (default) this user will not be able to log in using a
password (i.e. via `login` command).

*Type:* null or (string, not containing newlines or colons)

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.initialPassword` {#opt-users.extraUsers._name_.initialPassword}

Specifies the initial password for the user, i.e. the
password assigned if the user does not already exist. If
[`users.mutableUsers`](#opt-users.mutableUsers) is true, the password
can be changed subsequently using the
`passwd` command. Otherwise, it's
equivalent to setting the `password`
option. The same caveat applies: the password specified here
is world-readable in the Nix store, so it should only be
used for guest accounts or passwords that will be changed
promptly.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.isNormalUser` {#opt-users.extraUsers._name_.isNormalUser}

Indicates whether this is an account for a “real” user.
This automatically sets `group` to `users`,
`createHome` to `true`,
`home` to `/home/«username»`,
`useDefaultShell` to `true`,
and `isSystemUser` to `false`.
Exactly one of `isNormalUser` and `isSystemUser` must be true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.isSystemUser` {#opt-users.extraUsers._name_.isSystemUser}

Indicates if the user is a system user or not. This option
only has an effect if `uid` is
`null`, in which case it determines whether
the user's UID is allocated in the range for system users
(below 1000) or in the range for normal users (starting at
1000).
Exactly one of `isNormalUser` and
`isSystemUser` must be true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.linger` {#opt-users.extraUsers._name_.linger}

Whether to enable or disable lingering for this user.  Without
lingering, user units will not be started until the user logs in,
and may be stopped on logout depending on the settings in
`logind.conf`.

By default, NixOS will not manage lingering, new users will default
to not lingering, and lingering can be configured imperatively using
`loginctl enable-linger` or `loginctl disable-linger`. Setting
this option to `true` or `false` is the declarative equivalent of
running `loginctl enable-linger` or `loginctl disable-linger`
respectively.

*Type:* null or boolean

*Default:* `null`

*Example:* `true`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.name` {#opt-users.extraUsers._name_.name}

The name of the user account. If undefined, the name of the
attribute set will be used.

*Type:* string, not containing newlines or colons

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.openssh.authorizedKeys.keyFiles` {#opt-users.extraUsers._name_.openssh.authorizedKeys.keyFiles}

A list of files each containing one OpenSSH public key that should be
added to the user's authorized keys. The contents of the files are
read at build time and added to a file that the SSH daemon reads in
addition to the the user's authorized\_keys file. You can combine the
`keyFiles` and `keys` options.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `users.extraUsers.<name>.openssh.authorizedKeys.keys` {#opt-users.extraUsers._name_.openssh.authorizedKeys.keys}

A list of verbatim OpenSSH public keys that should be added to the
user's authorized keys. The keys are added to a file that the SSH
daemon reads in addition to the the user's authorized\_keys file.
You can combine the `keys` and
`keyFiles` options.
Warning: If you are using `NixOps` then don't use this
option since it will replace the key required for deployment via ssh.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ssh-rsa AAAAB3NzaC1yc2etc/etc/etcjwrsh8e596z6J0l7 example@host"
  "ssh-ed25519 AAAAC3NzaCetcetera/etceteraJZMfk3QPfQ foo@bar"
]
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `users.extraUsers.<name>.openssh.authorizedPrincipals` {#opt-users.extraUsers._name_.openssh.authorizedPrincipals}

A list of verbatim principal names that should be added to the user's
authorized principals.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "example@host"
  "foo@bar"
]
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `users.extraUsers.<name>.packages` {#opt-users.extraUsers._name_.packages}

The set of packages that should be made available to the user.
This is in contrast to [`environment.systemPackages`](../../options/environment/index.md#opt-environment.systemPackages),
which adds packages to all users.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.firefox pkgs.thunderbird ]`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.pamMount` {#opt-users.extraUsers._name_.pamMount}

Attributes for user's entry in
`pam_mount.conf.xml`.
Useful attributes might include `path`,
`options`, `fstype`, and `server`.
See [https://pam-mount.sourceforge.net/pam\_mount.conf.5.html](https://pam-mount.sourceforge.net/pam_mount.conf.5.html)
for more information.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.password` {#opt-users.extraUsers._name_.password}

Specifies the (clear text) password for the user.
Warning: do not set confidential information here
because it is world-readable in the Nix store. This option
should only be used for public accounts.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.shell` {#opt-users.extraUsers._name_.shell}

The path to the user's shell. Can use shell derivations,
like `pkgs.bashInteractive`. Don’t
forget to enable your shell in
`programs` if necessary,
like `programs.zsh.enable = true;`.

*Type:* null or package or (absolute path, not containing newlines or colons)

*Default:* `pkgs.shadow`

*Example:* `pkgs.bashInteractive`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.subGidRanges` {#opt-users.extraUsers._name_.subGidRanges}

Subordinate group ids that user is allowed to use.
They are set into `/etc/subgid` and are used
by `newgidmap` for user namespaces.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    count = 1;
    startGid = 100;
  }
  {
    count = 999;
    startGid = 1001;
  }
]
```

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.subGidRanges.*.count` {#opt-users.extraUsers._name_.subGidRanges._.count}

Count of subordinate group ids

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.subGidRanges.*.startGid` {#opt-users.extraUsers._name_.subGidRanges._.startGid}

Start of the range of subordinate group ids that user is
allowed to use.

*Type:* signed integer

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.subUidRanges` {#opt-users.extraUsers._name_.subUidRanges}

Subordinate user ids that user is allowed to use.
They are set into `/etc/subuid` and are used
by `newuidmap` for user namespaces.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    count = 1;
    startUid = 1000;
  }
  {
    count = 65534;
    startUid = 100001;
  }
]
```

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.subUidRanges.*.count` {#opt-users.extraUsers._name_.subUidRanges._.count}

Count of subordinate user ids

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.subUidRanges.*.startUid` {#opt-users.extraUsers._name_.subUidRanges._.startUid}

Start of the range of subordinate user ids that user is
allowed to use.

*Type:* signed integer

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.uid` {#opt-users.extraUsers._name_.uid}

The account UID. If the UID is null, a free UID is picked on
activation.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.extraUsers.<name>.useDefaultShell` {#opt-users.extraUsers._name_.useDefaultShell}

If true, the user's shell will be set to
[`users.defaultUserShell`](#opt-users.defaultUserShell).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.groups` {#opt-users.groups}

Additional groups to be created automatically by the system.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  hackers = { };
  students = {
    gid = 1001;
  };
}
```

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.groups.<name>.gid` {#opt-users.groups._name_.gid}

The group GID. If the GID is null, a free GID is picked on
activation.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.groups.<name>.members` {#opt-users.groups._name_.members}

The user names of the group members, added to the
`/etc/group` file.

*Type:* list of (string, not containing newlines or colons)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.groups.<name>.name` {#opt-users.groups._name_.name}

The name of the group. If undefined, the name of the attribute set
will be used.

*Type:* string, not containing newlines or colons

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.ldap.base` {#opt-users.ldap.base}

The distinguished name of the search base.

*Type:* string

*Example:* `"dc=example,dc=org"`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.bind.distinguishedName` {#opt-users.ldap.bind.distinguishedName}

The distinguished name to bind to the LDAP server with. If this
is not specified, an anonymous bind will be done.

*Type:* string

*Default:* `""`

*Example:* `"cn=admin,dc=example,dc=com"`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.bind.passwordFile` {#opt-users.ldap.bind.passwordFile}

The path to a file containing the credentials to use when binding
to the LDAP server (if not binding anonymously).

*Type:* string

*Default:* `"/etc/ldap/bind.password"`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.bind.policy` {#opt-users.ldap.bind.policy}

Specifies the policy to use for reconnecting to an unavailable
LDAP server. The default is `hard_open`, which
reconnects if opening the connection to the directory server
failed. By contrast, `hard_init` reconnects if
initializing the connection failed. Initializing may not
actually contact the directory server, and it is possible that
a malformed configuration file will trigger reconnection. If
`soft` is specified, then
`nss_ldap` will return immediately on server
failure. All hard reconnect policies block with exponential
backoff before retrying.

*Type:* one of "hard\_open", "hard\_init", "soft"

*Default:* `"hard_open"`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.bind.timeLimit` {#opt-users.ldap.bind.timeLimit}

Specifies the time limit (in seconds) to use when connecting
to the directory server. This is distinct from the time limit
specified in [`users.ldap.timeLimit`](#opt-users.ldap.timeLimit) and affects
the initial server connection only.

*Type:* signed integer

*Default:* `30`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.daemon.enable` {#opt-users.ldap.daemon.enable}

Whether to let the nslcd daemon (nss-pam-ldapd) handle the
LDAP lookups for NSS and PAM. This can improve performance,
and if you need to bind to the LDAP server with a password,
it increases security, since only the nslcd user needs to
have access to the bindpw file, not everyone that uses NSS
and/or PAM. If this option is enabled, a local nscd user is
created automatically, and the nslcd service is started
automatically when the network get up.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.daemon.extraConfig` {#opt-users.ldap.daemon.extraConfig}

Extra configuration options that will be added verbatim at
the end of the nslcd configuration file (`nslcd.conf(5)`).

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.daemon.rootpwmoddn` {#opt-users.ldap.daemon.rootpwmoddn}

The distinguished name to use to bind to the LDAP server
when the root user tries to modify a user's password.

*Type:* string

*Default:* `""`

*Example:* `"cn=admin,dc=example,dc=com"`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.daemon.rootpwmodpwFile` {#opt-users.ldap.daemon.rootpwmodpwFile}

The path to a file containing the credentials with which to bind to
the LDAP server if the root user tries to change a user's password.

*Type:* string

*Default:* `""`

*Example:* `"/run/keys/nslcd.rootpwmodpw"`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.enable` {#opt-users.ldap.enable}

Whether to enable authentication against an LDAP server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.extraConfig` {#opt-users.ldap.extraConfig}

Extra configuration options that will be added verbatim at
the end of the ldap configuration file (`ldap.conf(5)`).
If `users.ldap.daemon` is enabled, this
configuration will not be used. In that case, use
[`users.ldap.daemon.extraConfig`](#opt-users.ldap.daemon.extraConfig) instead.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.loginPam` {#opt-users.ldap.loginPam}

Whether to include authentication against LDAP in login PAM.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.nsswitch` {#opt-users.ldap.nsswitch}

Whether to include lookup against LDAP in NSS.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.server` {#opt-users.ldap.server}

The URL of the LDAP server.

*Type:* string

*Example:* `"ldap://ldap.example.org/"`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.timeLimit` {#opt-users.ldap.timeLimit}

Specifies the time limit (in seconds) to use when performing
searches. A value of zero (0), which is the default, is to
wait indefinitely for searches to be completed.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.ldap.useTLS` {#opt-users.ldap.useTLS}

If enabled, use TLS (encryption) over an LDAP (port 389)
connection.  The alternative is to specify an LDAPS server (port
636) in [`users.ldap.server`](#opt-users.ldap.server) or to forego
security.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/ldap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldap.nix)

## `users.manageLingering` {#opt-users.manageLingering}

Whether to manage whether users linger or not.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.motd` {#opt-users.motd}

Message of the day shown to users when they log in.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"Today is Sweetmorn, the 4th day of The Aftermath in the YOLD 3178."`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `users.motdFile` {#opt-users.motdFile}

A file containing the message of the day shown to users when they log in.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/motd"`

*Declared by:* [`nixos/modules/security/pam.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix)

## `users.mutableUsers` {#opt-users.mutableUsers}

If set to `true`, you are free to add new users and groups to the system
with the ordinary `useradd` and
`groupadd` commands. On system activation, the
existing contents of the `/etc/passwd` and
`/etc/group` files will be merged with the
contents generated from the `users.users` and
`users.groups` options.
The initial password for a user will be set
according to `users.users`, but existing passwords
will not be changed.

::: warning
If set to `false`, the contents of the user and
group files will simply be replaced on system activation. This also
holds for the user passwords; all changed
passwords will be reset according to the
`users.users` configuration on activation.
:::

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.mysql.database` {#opt-users.mysql.database}

The name of the database containing the users

*Type:* string

*Example:* `"auth"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.enable` {#opt-users.mysql.enable}

Whether to enable authentication against a MySQL/MariaDB database.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.host` {#opt-users.mysql.host}

The hostname of the MySQL/MariaDB server

*Type:* string

*Example:* `"localhost"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss` {#opt-users.mysql.nss}

Settings for `libnss-mysql`.

All examples are from the [minimal example](https://github.com/saknopper/libnss-mysql/tree/master/sample/minimal)
of `libnss-mysql`, but they are modified with NixOS paths for bash.

*Type:* submodule

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.getgrent` {#opt-users.mysql.nss.getgrent}

SQL query for the [getgrent](https://man7.org/linux/man-pages/man3/getgrent.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT name,password,gid FROM groups
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.getgrgid` {#opt-users.mysql.nss.getgrgid}

SQL query for the [getgrgid](https://man7.org/linux/man-pages/man3/getgrgid.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT name,password,gid FROM groups WHERE gid='%1$u' LIMIT 1
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.getgrnam` {#opt-users.mysql.nss.getgrnam}

SQL query for the [getgrnam](https://man7.org/linux/man-pages/man3/getgrnam.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT name,password,gid FROM groups WHERE name='%1$s' LIMIT 1
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.getpwent` {#opt-users.mysql.nss.getpwent}

SQL query for the [getpwent](https://man7.org/linux/man-pages/man3/getpwent.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT username,'x',uid,'5000','MySQL User', CONCAT('/home/',username),'/run/sw/current-system/bin/bash' FROM users
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.getpwnam` {#opt-users.mysql.nss.getpwnam}

SQL query for the [getpwnam](https://man7.org/linux/man-pages/man3/getpwnam.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT username,'x',uid,'5000','MySQL User', CONCAT('/home/',username),'/run/sw/current-system/bin/bash' \
FROM users \
WHERE username='%1$s' \
LIMIT 1
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.getpwuid` {#opt-users.mysql.nss.getpwuid}

SQL query for the [getpwuid](https://man7.org/linux/man-pages/man3/getpwuid.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT username,'x',uid,'5000','MySQL User', CONCAT('/home/',username),'/run/sw/current-system/bin/bash' \
FROM users \
WHERE uid='%1$u' \
LIMIT 1
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.getspent` {#opt-users.mysql.nss.getspent}

SQL query for the [getspent](https://man7.org/linux/man-pages/man3/getspent.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT username,password,'1','0','99999','0','0','-1','0' FROM users
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.getspnam` {#opt-users.mysql.nss.getspnam}

SQL query for the [getspnam](https://man7.org/linux/man-pages/man3/getspnam.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT username,password,'1','0','99999','0','0','-1','0' \
FROM users \
WHERE username='%1$s' \
LIMIT 1
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.gidsbymem` {#opt-users.mysql.nss.gidsbymem}

SQL query for the [gidsbymem](https://man7.org/linux/man-pages/man3/gidsbymem.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT gid FROM grouplist WHERE username='%1$s'
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.nss.memsbygid` {#opt-users.mysql.nss.memsbygid}

SQL query for the [memsbygid](https://man7.org/linux/man-pages/man3/memsbygid.3.html)
syscall.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
SELECT username FROM grouplist WHERE gid='%1$u'
```

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam` {#opt-users.mysql.pam}

Settings for `pam_mysql`

*Type:* submodule

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.cryptDefault` {#opt-users.mysql.pam.cryptDefault}

The default encryption method to use for `passwordCrypt = 1`.

*Type:* null or one of "md5", "sha256", "sha512", "blowfish"

*Default:* `null`

*Example:* `"blowfish"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.disconnectEveryOperation` {#opt-users.mysql.pam.disconnectEveryOperation}

By default, `pam_mysql` keeps the connection to the MySQL
database until the session is closed. If this option is set to true it
disconnects every time the PAM operation has finished. This option may
be useful in case the session lasts quite long.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.logging.enable` {#opt-users.mysql.pam.logging.enable}

Enables logging of authentication attempts in the MySQL database.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.logging.hostColumn` {#opt-users.mysql.pam.logging.hostColumn}

The name of the column in the log table to which the name of the user
being authenticated is stored.

*Type:* string

*Example:* `"host"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.logging.msgColumn` {#opt-users.mysql.pam.logging.msgColumn}

The name of the column in the log table to which the description
of the performed operation is stored.

*Type:* string

*Example:* `"msg"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.logging.pidColumn` {#opt-users.mysql.pam.logging.pidColumn}

The name of the column in the log table to which the pid of the
process utilising the `pam_mysql` authentication
service is stored.

*Type:* string

*Example:* `"pid"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.logging.rHostColumn` {#opt-users.mysql.pam.logging.rHostColumn}

The name of the column in the log table to which the name of the remote
host that initiates the session is stored. The value is supposed to be
set by the PAM-aware application with `pam_set_item(PAM_RHOST)`.

*Type:* string

*Example:* `"rhost"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.logging.table` {#opt-users.mysql.pam.logging.table}

The name of the table to which logs are written.

*Type:* string

*Example:* `"logs"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.logging.timeColumn` {#opt-users.mysql.pam.logging.timeColumn}

The name of the column in the log table to which the timestamp of the
log entry is stored.

*Type:* string

*Example:* `"timestamp"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.logging.userColumn` {#opt-users.mysql.pam.logging.userColumn}

The name of the column in the log table to which the name of the
user being authenticated is stored.

*Type:* string

*Example:* `"user"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.passwordColumn` {#opt-users.mysql.pam.passwordColumn}

The name of the column that contains a (encrypted) password string.

*Type:* string

*Example:* `"password"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.passwordCrypt` {#opt-users.mysql.pam.passwordCrypt}

The method to encrypt the user's password:

- `0` (or `"plain"`):
  No encryption. Passwords are stored in plaintext. HIGHLY DISCOURAGED.
- `1` (or `"Y"`):
  Use `crypt(3)` function.
- `2` (or `"mysql"`):
  Use the MySQL PASSWORD() function. It is possible that the encryption function used
  by `pam_mysql` is different from that of the MySQL server, as
  `pam_mysql` uses the function defined in MySQL's C-client API
  instead of using PASSWORD() SQL function in the query.
- `3` (or `"md5"`):
  Use plain hex MD5.
- `4` (or `"sha1"`):
  Use plain hex SHA1.
- `5` (or `"drupal7"`):
  Use Drupal7 salted passwords.
- `6` (or `"joomla15"`):
  Use Joomla15 salted passwords.
- `7` (or `"ssha"`):
  Use ssha hashed passwords.
- `8` (or `"sha512"`):
  Use sha512 hashed passwords.
- `9` (or `"sha256"`):
  Use sha256 hashed passwords.

*Type:* one of "0", "plain", "1", "Y", "2", "mysql", "3", "md5", "4", "sha1", "5", "drupal7", "6", "joomla15", "7", "ssha", "8", "sha512", "9", "sha256"

*Example:* `"2"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.statusColumn` {#opt-users.mysql.pam.statusColumn}

The name of the column or an SQL expression that indicates the status of
the user. The status is expressed by the combination of two bitfields
shown below:

- `bit 0 (0x01)`:
  if flagged, `pam_mysql` deems the account to be expired and
  returns `PAM_ACCT_EXPIRED`. That is, the account is supposed
  to no longer be available. Note this doesn't mean that `pam_mysql`
  rejects further authentication operations.
- `bit 1 (0x02)`:
  if flagged, `pam_mysql` deems the authentication token
  (password) to be expired and returns `PAM_NEW_AUTHTOK_REQD`.
  This ends up requiring that the user enter a new password.

*Type:* null or string

*Default:* `null`

*Example:* `"status"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.table` {#opt-users.mysql.pam.table}

The name of table that maps unique login names to the passwords.

*Type:* string

*Example:* `"users"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.updateTable` {#opt-users.mysql.pam.updateTable}

The name of the table used for password alteration. If not defined, the value
of the `table` option will be used instead.

*Type:* null or string

*Default:* `null`

*Example:* `"users_updates"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.userColumn` {#opt-users.mysql.pam.userColumn}

The name of the column that contains a unix login name.

*Type:* string

*Example:* `"username"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.verbose` {#opt-users.mysql.pam.verbose}

If enabled, produces logs with detailed messages that describes what
`pam_mysql` is doing. May be useful for debugging.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.pam.where` {#opt-users.mysql.pam.where}

Additional criteria for the query.

*Type:* null or string

*Default:* `null`

*Example:* `"host.name='web' AND user.active=1"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.passwordFile` {#opt-users.mysql.passwordFile}

The path to the file containing the password for the user

*Type:* absolute path

*Example:* `"/run/secrets/mysql-auth-db-passwd"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.mysql.user` {#opt-users.mysql.user}

The username to use when connecting to the database

*Type:* string

*Example:* `"nss-user"`

*Declared by:* [`nixos/modules/config/mysql.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/mysql.nix)

## `users.users` {#opt-users.users}

Additional user accounts to be created automatically by the system.
This can also be used to set options for root.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  alice = {
    createHome = true;
    description = "Alice Q. User";
    extraGroups = [
      "wheel"
    ];
    group = "users";
    home = "/home/alice";
    shell = "/bin/sh";
    uid = 1234;
  };
}
```

*Declared by:*

- [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)
- [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.autoSubUidGidRange` {#opt-users.users._name_.autoSubUidGidRange}

Automatically allocate subordinate user and group ids for this user.
Allocated range is currently always of size 65536.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.createHome` {#opt-users.users._name_.createHome}

Whether to create the home directory and ensure ownership as well as
permissions to match the user.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.cryptHomeLuks` {#opt-users.users._name_.cryptHomeLuks}

Path to encrypted luks device that contains
the user's home directory.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.description` {#opt-users.users._name_.description}

A short description of the user account, typically the
user's full name.  This is actually the “GECOS” or “comment”
field in `/etc/passwd`.

*Type:* string, not containing newlines or colons

*Default:* `""`

*Example:* `"Alice Q. User"`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.enable` {#opt-users.users._name_.enable}

If set to false, the user account will not be created. This is useful for when you wish to conditionally
disable user accounts.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.expires` {#opt-users.users._name_.expires}

Set the date on which the user's account will no longer be
accessible. The date is expressed in the format YYYY-MM-DD, or null
to disable the expiry.
A user whose account is locked must contact the system
administrator before being able to use the system again.

*Type:* null or string matching the pattern \[\[:digit:\]\]{4}-\[\[:digit:\]\]{2}-\[\[:digit:\]\]{2}

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.extraGroups` {#opt-users.users._name_.extraGroups}

The user's auxiliary groups.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.group` {#opt-users.users._name_.group}

The user's primary group.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.hashedPassword` {#opt-users.users._name_.hashedPassword}

Specifies the hashed password for the user.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

To generate a hashed password run `mkpasswd`.

If set to an empty string (`""`), this user will be able to log in without
being asked for a password (but not via remote services such as SSH, or
indirectly via `su` or `sudo`). This should only be used
for e.g. bootable live systems. Note: this is different from setting an
empty password, which can be achieved using
`users.users.<name?>.password`.

If set to `null` (default) this user will not be able to log in using a
password (i.e. via `login` command).

*Type:* null or (string, not containing newlines or colons)

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.hashedPasswordFile` {#opt-users.users._name_.hashedPasswordFile}

The full path to a file that contains the hash of the user's
password. The password file is read on each system activation. The
file should contain exactly one line, the salted password hash
produced by `mkpasswd`.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.home` {#opt-users.users._name_.home}

The user's home directory.

*Type:* absolute path, not containing newlines or colons

*Default:* `"/var/empty"`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.homeMode` {#opt-users.users._name_.homeMode}

The user's home directory mode in numeric format. See `chmod(1)`. The mode is only applied if [`users.users.<name>.createHome`](#opt-users.users._name_.createHome) is true.

*Type:* string matching the pattern \[0-7\]{1,5}

*Default:* `"700"`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.ignoreShellProgramCheck` {#opt-users.users._name_.ignoreShellProgramCheck}

By default, nixos will check that programs.SHELL.enable is set to
true if the user has a custom shell specified. If that behavior isn't
required and there are custom overrides in place to make sure that the
shell is functional, set this to true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.initialHashedPassword` {#opt-users.users._name_.initialHashedPassword}

Specifies the initial hashed password for the user, i.e. the
hashed password assigned if the user does not already
exist. If [`users.mutableUsers`](#opt-users.mutableUsers) is true, the
password can be changed subsequently using the
`passwd` command. Otherwise, it's
equivalent to setting the `hashedPassword` option.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

To generate a hashed password run `mkpasswd`.

If set to an empty string (`""`), this user will be able to log in without
being asked for a password (but not via remote services such as SSH, or
indirectly via `su` or `sudo`). This should only be used
for e.g. bootable live systems. Note: this is different from setting an
empty password, which can be achieved using
`users.users.<name?>.password`.

If set to `null` (default) this user will not be able to log in using a
password (i.e. via `login` command).

*Type:* null or (string, not containing newlines or colons)

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.initialPassword` {#opt-users.users._name_.initialPassword}

Specifies the initial password for the user, i.e. the
password assigned if the user does not already exist. If
[`users.mutableUsers`](#opt-users.mutableUsers) is true, the password
can be changed subsequently using the
`passwd` command. Otherwise, it's
equivalent to setting the `password`
option. The same caveat applies: the password specified here
is world-readable in the Nix store, so it should only be
used for guest accounts or passwords that will be changed
promptly.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.isNormalUser` {#opt-users.users._name_.isNormalUser}

Indicates whether this is an account for a “real” user.
This automatically sets `group` to `users`,
`createHome` to `true`,
`home` to `/home/«username»`,
`useDefaultShell` to `true`,
and `isSystemUser` to `false`.
Exactly one of `isNormalUser` and `isSystemUser` must be true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.isSystemUser` {#opt-users.users._name_.isSystemUser}

Indicates if the user is a system user or not. This option
only has an effect if `uid` is
`null`, in which case it determines whether
the user's UID is allocated in the range for system users
(below 1000) or in the range for normal users (starting at
1000).
Exactly one of `isNormalUser` and
`isSystemUser` must be true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.linger` {#opt-users.users._name_.linger}

Whether to enable or disable lingering for this user.  Without
lingering, user units will not be started until the user logs in,
and may be stopped on logout depending on the settings in
`logind.conf`.

By default, NixOS will not manage lingering, new users will default
to not lingering, and lingering can be configured imperatively using
`loginctl enable-linger` or `loginctl disable-linger`. Setting
this option to `true` or `false` is the declarative equivalent of
running `loginctl enable-linger` or `loginctl disable-linger`
respectively.

*Type:* null or boolean

*Default:* `null`

*Example:* `true`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.name` {#opt-users.users._name_.name}

The name of the user account. If undefined, the name of the
attribute set will be used.

*Type:* string, not containing newlines or colons

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.openssh.authorizedKeys.keyFiles` {#opt-users.users._name_.openssh.authorizedKeys.keyFiles}

A list of files each containing one OpenSSH public key that should be
added to the user's authorized keys. The contents of the files are
read at build time and added to a file that the SSH daemon reads in
addition to the the user's authorized\_keys file. You can combine the
`keyFiles` and `keys` options.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `users.users.<name>.openssh.authorizedKeys.keys` {#opt-users.users._name_.openssh.authorizedKeys.keys}

A list of verbatim OpenSSH public keys that should be added to the
user's authorized keys. The keys are added to a file that the SSH
daemon reads in addition to the the user's authorized\_keys file.
You can combine the `keys` and
`keyFiles` options.
Warning: If you are using `NixOps` then don't use this
option since it will replace the key required for deployment via ssh.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ssh-rsa AAAAB3NzaC1yc2etc/etc/etcjwrsh8e596z6J0l7 example@host"
  "ssh-ed25519 AAAAC3NzaCetcetera/etceteraJZMfk3QPfQ foo@bar"
]
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `users.users.<name>.openssh.authorizedPrincipals` {#opt-users.users._name_.openssh.authorizedPrincipals}

A list of verbatim principal names that should be added to the user's
authorized principals.

*Type:* list of (optionally newline-terminated) single-line string

*Default:* `[ ]`

*Example:*

``` nix
[
  "example@host"
  "foo@bar"
]
```

*Declared by:* [`nixos/modules/services/networking/ssh/sshd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/ssh/sshd.nix)

## `users.users.<name>.packages` {#opt-users.users._name_.packages}

The set of packages that should be made available to the user.
This is in contrast to [`environment.systemPackages`](../../options/environment/index.md#opt-environment.systemPackages),
which adds packages to all users.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.firefox pkgs.thunderbird ]`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.pamMount` {#opt-users.users._name_.pamMount}

Attributes for user's entry in
`pam_mount.conf.xml`.
Useful attributes might include `path`,
`options`, `fstype`, and `server`.
See [https://pam-mount.sourceforge.net/pam\_mount.conf.5.html](https://pam-mount.sourceforge.net/pam_mount.conf.5.html)
for more information.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.password` {#opt-users.users._name_.password}

Specifies the (clear text) password for the user.
Warning: do not set confidential information here
because it is world-readable in the Nix store. This option
should only be used for public accounts.

The `initialHashedPassword`, `hashedPassword`,
`initialPassword`, `password` and
`hashedPasswordFile` options all control what password is set for
the user.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) is `false`, typically
only one of `hashedPassword`, `password`, or
`hashedPasswordFile` will be set.

In a system where [systemd](../../options/systemd/index.md#opt-systemd.sysusers.enable) or [services (U)](../../options/services-u/index.md#opt-services.userborn.enable) is `true`,
typically only one of `initialPassword`, `initialHashedPassword`,
or `hashedPasswordFile` will be set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is true, the password defined
in one of the above password options will only be set when the user is
created for the first time. After that, you are free to change the
password with the ordinary user management commands. If
[`users.mutableUsers`](#opt-users.mutableUsers) is false, you cannot change user passwords,
they will always be set according to the password options.

If none of the password options are set, then no password is assigned to
the user, and the user will not be able to do password-based logins.

If multiple of these password options are set at the same time then a
specific order of precedence is followed, which can lead to surprising
results. The order of precedence differs depending on whether the
[`users.mutableUsers`](#opt-users.mutableUsers) option is set.

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`false`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `hashedPassword` -\> `initialPassword` -\> `password` -\> `hashedPasswordFile`

If the option [`users.mutableUsers`](#opt-users.mutableUsers) is
`true`, then the order of precedence is as shown
below, where values on the left are overridden by values on the right:
`initialHashedPassword` -\> `initialPassword` -\> `hashedPassword` -\> `password` -\> `hashedPasswordFile`

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.shell` {#opt-users.users._name_.shell}

The path to the user's shell. Can use shell derivations,
like `pkgs.bashInteractive`. Don’t
forget to enable your shell in
`programs` if necessary,
like `programs.zsh.enable = true;`.

*Type:* null or package or (absolute path, not containing newlines or colons)

*Default:* `pkgs.shadow`

*Example:* `pkgs.bashInteractive`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.subGidRanges` {#opt-users.users._name_.subGidRanges}

Subordinate group ids that user is allowed to use.
They are set into `/etc/subgid` and are used
by `newgidmap` for user namespaces.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    count = 1;
    startGid = 100;
  }
  {
    count = 999;
    startGid = 1001;
  }
]
```

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.subGidRanges.*.count` {#opt-users.users._name_.subGidRanges._.count}

Count of subordinate group ids

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.subGidRanges.*.startGid` {#opt-users.users._name_.subGidRanges._.startGid}

Start of the range of subordinate group ids that user is
allowed to use.

*Type:* signed integer

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.subUidRanges` {#opt-users.users._name_.subUidRanges}

Subordinate user ids that user is allowed to use.
They are set into `/etc/subuid` and are used
by `newuidmap` for user namespaces.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    count = 1;
    startUid = 1000;
  }
  {
    count = 65534;
    startUid = 100001;
  }
]
```

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.subUidRanges.*.count` {#opt-users.users._name_.subUidRanges._.count}

Count of subordinate user ids

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.subUidRanges.*.startUid` {#opt-users.users._name_.subUidRanges._.startUid}

Start of the range of subordinate user ids that user is
allowed to use.

*Type:* signed integer

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.uid` {#opt-users.users._name_.uid}

The account UID. If the UID is null, a free UID is picked on
activation.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)

## `users.users.<name>.useDefaultShell` {#opt-users.users._name_.useDefaultShell}

If true, the user's shell will be set to
[`users.defaultUserShell`](#opt-users.defaultUserShell).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/users-groups.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/users-groups.nix)
