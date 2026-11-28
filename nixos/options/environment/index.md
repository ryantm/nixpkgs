# environment {#sec-options-environment}

## `environment.budgie.excludePackages` {#opt-environment.budgie.excludePackages}

Which packages Budgie should exclude from the default environment.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.mate-terminal ]`

*Declared by:* [`nixos/modules/services/desktop-managers/budgie.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/budgie.nix)

## `environment.checkConfigurationOptions` {#opt-environment.checkConfigurationOptions}

Alias of `_module.check`.

*Type:* boolean

*Declared by:* [`nixos/modules/rename.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/rename.nix)

## `environment.cinnamon.excludePackages` {#opt-environment.cinnamon.excludePackages}

Which packages cinnamon should exclude from the default environment

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.blueman ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/cinnamon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/cinnamon.nix)

## `environment.corePackages` {#opt-environment.corePackages}

Set of core packages for a normal interactive system.

Only change this if you know what you're doing!

Like with systemPackages, packages are installed to
`/run/current-system/sw`. They are
automatically available to all users, and are
automatically updated every time you rebuild the system
configuration.

*Type:* list of package

*Default:* these packages, with their `meta.priority` numerically increased
(thus lowering their installation priority):

    [ pkgs.acl pkgs.attr pkgs.bashInteractive pkgs.bzip2 pkgs.coreutils-full pkgs.cpio pkgs.curl pkgs.diffutils pkgs.findutils pkgs.gawk pkgs.getent pkgs.getconf pkgs.gnugrep pkgs.gnupatch pkgs.gnused pkgs.gnutar pkgs.gzip pkgs.xz pkgs.less pkgs.libcap pkgs.ncurses pkgs.netcat pkgs.mkpasswd pkgs.procps pkgs.su pkgs.time pkgs.util-linux pkgs.which pkgs.zstd ]

*Example:* `[ ]`

*Declared by:* [`nixos/modules/config/system-path.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/system-path.nix)

## `environment.cosmic.excludePackages` {#opt-environment.cosmic.excludePackages}

List of packages to exclude from the COSMIC environment.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.cosmic-player ]`

*Declared by:* [`nixos/modules/services/desktop-managers/cosmic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/cosmic.nix)

## `environment.debuginfodServers` {#opt-environment.debuginfodServers}

List of urls of debuginfod servers for tools like `gdb` and `valgrind` to use.

Unrelated to [`environment.enableDebugInfo`](#opt-environment.enableDebugInfo).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/debug-info.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/debug-info.nix)

## `environment.defaultPackages` {#opt-environment.defaultPackages}

Set of default packages that aren't strictly necessary
for a running system, entries can be removed for a more
minimal NixOS installation.

Like with systemPackages, packages are installed to
`/run/current-system/sw`. They are
automatically available to all users, and are
automatically updated every time you rebuild the system
configuration.

*Type:* list of package

*Default:* these packages, with their `meta.priority` numerically increased
(thus lowering their installation priority):

    [ pkgs.perl pkgs.rsync pkgs.strace ]

*Example:* `[ ]`

*Declared by:* [`nixos/modules/config/system-path.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/system-path.nix)

## `environment.enableAllTerminfo` {#opt-environment.enableAllTerminfo}

Whether to install all terminfo outputs

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/terminfo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/terminfo.nix)

## `environment.enableDebugInfo` {#opt-environment.enableDebugInfo}

Some NixOS packages provide debug symbols. However, these are
not included in the system closure by default to save disk
space. Enabling this option causes the debug symbols to appear
in `/run/current-system/sw/lib/debug/.build-id`,
where tools such as `gdb` can find them.
If you need debug symbols for a package that doesn't
provide them by default, you can enable them as follows:

    nixpkgs.config.packageOverrides = pkgs: {
      hello = pkgs.hello.overrideAttrs (oldAttrs: {
        separateDebugInfo = true;
      });
    };

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/debug-info.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/debug-info.nix)

## `environment.enlightenment.excludePackages` {#opt-environment.enlightenment.excludePackages}

Which packages Enlightenment should exclude from the default environment

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.enlightenment.ephoto ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/enlightenment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/enlightenment.nix)

## `environment.etc` {#opt-environment.etc}

Set of files that have to be linked in `/etc`.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{ example-configuration-file =
    { source = "/nix/store/.../etc/dir/file.conf.example";
      mode = "0440";
    };
  "default/useradd".text = "GROUP=100 ...";
}
```

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.enable` {#opt-environment.etc._name_.enable}

Whether this `/etc` file should be generated.  This
option allows specific `/etc` files to be disabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.gid` {#opt-environment.etc._name_.gid}

GID of created file. Only takes effect when the file is
copied (that is, the mode is not `symlink`).

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.group` {#opt-environment.etc._name_.group}

Group name of file owner.

Only takes effect when the file is copied (that is, the
mode is not `symlink`).

When `services.userborn.enable`, this option has no effect.
You have to assign a `gid` instead. Otherwise this option
takes precedence over `gid`.

*Type:* string

*Default:* `"+0"`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.mode` {#opt-environment.etc._name_.mode}

If set to something other than `symlink`,
the file is copied instead of symlinked, with the given
file mode.

*Type:* string

*Default:* `"symlink"`

*Example:* `"0600"`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.source` {#opt-environment.etc._name_.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.target` {#opt-environment.etc._name_.target}

Name of symlink (relative to
`/etc`).  Defaults to the attribute
name.

*Type:* string

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.text` {#opt-environment.etc._name_.text}

Text content of the file.

*Type:* null or strings concatenated with "\\n"

*Default:* `null`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.uid` {#opt-environment.etc._name_.uid}

UID of created file. Only takes effect when the file is
copied (that is, the mode is not 'symlink').

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.etc.<name>.user` {#opt-environment.etc._name_.user}

User name of file owner. Only takes effect when the file is copied (that is, the
mode is not `symlink`).

When `services.userborn.enable`, this option has no effect.
You have to assign a `uid` instead. Otherwise this option
takes precedence over `uid`.

*Type:* string

*Default:* `"+0"`

*Declared by:* [`nixos/modules/system/etc/etc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/etc/etc.nix)

## `environment.extraInit` {#opt-environment.extraInit}

Shell script code called during global environment initialisation
after all variables and profileVariables have been set.
This code is assumed to be shell-independent, which means you should
stick to pure sh without sh word split.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.extraOutputsToInstall` {#opt-environment.extraOutputsToInstall}

Entries listed here will be appended to the `meta.outputsToInstall` attribute for each package in `environment.systemPackages`, and the files from the corresponding derivation outputs symlinked into `/run/current-system/sw`.

For example, this can be used to install the `dev` and `info` outputs for all packages in the system environment, if they are available.

To use specific outputs instead of configuring them globally, select the corresponding attribute on the package derivation, e.g. `libxml2.dev` or `coreutils.info`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "dev"
  "info"
]
```

*Declared by:* [`nixos/modules/config/system-path.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/system-path.nix)

## `environment.extraSetup` {#opt-environment.extraSetup}

Shell fragments to be run after the system environment has been created. This should only be used for things that need to modify the internals of the environment, e.g. generating MIME caches. The environment being built can be accessed at $out.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/system-path.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/system-path.nix)

## `environment.freetds` {#opt-environment.freetds}

Configure freetds database entries. Each attribute denotes
a section within freetds.conf, and the value (a string) is the config
content for that section. When at least one entry is configured
the global environment variables FREETDSCONF, FREETDS and SYBASE
will be configured to allow the programs that use freetds to find the
library and config.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{ MYDATABASE = ''
    host = 10.0.2.100
    port = 1433
    tds version = 7.2
  '';
}
```

*Declared by:* [`nixos/modules/programs/freetds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/freetds.nix)

## `environment.gnome.excludePackages` {#opt-environment.gnome.excludePackages}

Which packages gnome should exclude from the default environment

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.showtime ]`

*Declared by:* [`nixos/modules/services/desktop-managers/gnome.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/gnome.nix)

## `environment.homeBinInPath` {#opt-environment.homeBinInPath}

Include ~/bin/ in $PATH.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.interactiveShellInit` {#opt-environment.interactiveShellInit}

Shell script code called during interactive shell initialisation.
This code is assumed to be shell-independent, which means you should
stick to pure sh without sh word split.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.ldso` {#opt-environment.ldso}

The executable to link into the normal FHS location of the ELF loader.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/config/ldso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldso.nix)

## `environment.ldso32` {#opt-environment.ldso32}

The executable to link into the normal FHS location of the 32-bit ELF loader.

This currently only works on x86\_64 architectures.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/config/ldso.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/ldso.nix)

## `environment.localBinInPath` {#opt-environment.localBinInPath}

Add ~/.local/bin/ to $PATH

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.loginShellInit` {#opt-environment.loginShellInit}

Shell script code called during login shell initialisation.
This code is assumed to be shell-independent, which means you should
stick to pure sh without sh word split.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.lxqt.excludePackages` {#opt-environment.lxqt.excludePackages}

Which LXQt packages to exclude from the default environment

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs; [ lxqt.qterminal ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/lxqt.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/lxqt.nix)

## `environment.mate.excludePackages` {#opt-environment.mate.excludePackages}

Which MATE packages to exclude from the default environment

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.mate-terminal pkgs.pluma ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/mate.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/mate.nix)

## `environment.memoryAllocator.provider` {#opt-environment.memoryAllocator.provider}

The system-wide memory allocator.

Briefly, the system-wide memory allocator providers are:

- `libc`: the standard allocator provided by libc
- `graphene-hardened`: Hardened memory allocator coming from GrapheneOS project. The default configuration template has all normal optional security features enabled and is quite aggressive in terms of sacrificing performance and memory usage for security.
- `graphene-hardened-light`: Hardened memory allocator coming from GrapheneOS project. The light configuration template disables the slab quarantines, write after free check, slot randomization and raises the guard slab interval from 1 to 8 but leaves zero-on-free and slab canaries enabled. The light configuration has solid performance and memory usage while still being far more secure than mainstream allocators with much better security properties.
- `jemalloc`: A general purpose allocator that emphasizes fragmentation avoidance and scalable concurrency support.
- `mimalloc`: A compact and fast general purpose allocator, which may optionally be built with mitigations against various heap vulnerabilities.
- `scudo`: A user-mode allocator based on LLVM Sanitizer’s CombinedAllocator, which aims at providing additional mitigations against heap based vulnerabilities, while maintaining good performance.

::: warning
Selecting an alternative allocator (i.e., anything other than
`libc`) may result in instability, data loss,
and/or service failure.
:::

*Type:* one of "libc", "graphene-hardened", "graphene-hardened-light", "jemalloc", "mimalloc", "scudo"

*Default:* `"libc"`

*Declared by:* [`nixos/modules/config/malloc.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/malloc.nix)

## `environment.pantheon.excludePackages` {#opt-environment.pantheon.excludePackages}

Which packages pantheon should exclude from the default environment

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.pantheon.elementary-camera ]`

*Declared by:* [`nixos/modules/services/desktop-managers/pantheon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/pantheon.nix)

## `environment.pathsToLink` {#opt-environment.pathsToLink}

List of directories to be symlinked in `/run/current-system/sw`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/"
]
```

*Declared by:* [`nixos/modules/config/system-path.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/system-path.nix)

## `environment.plasma6.excludePackages` {#opt-environment.plasma6.excludePackages}

List of default packages to exclude from the configuration

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.kdePackages.elisa ]`

*Declared by:* [`nixos/modules/services/desktop-managers/plasma6.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktop-managers/plasma6.nix)

## `environment.profileRelativeEnvVars` {#opt-environment.profileRelativeEnvVars}

Attribute set of environment variable.  Each attribute maps to a list
of relative paths.  Each relative path is appended to the each profile
of [`environment.profiles`](#opt-environment.profiles) to form the content of the
corresponding environment variable.

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  MANPATH = [
    "/man"
    "/share/man"
  ];
  PATH = [
    "/bin"
  ];
}
```

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.profileRelativeSessionVariables` {#opt-environment.profileRelativeSessionVariables}

Attribute set of environment variable used in the global
environment. These variables will be set by PAM early in the
login process.

Variable substitution is available as described in
`pam_env.conf(5)`.

Each attribute maps to a list of relative paths. Each relative
path is appended to the each profile of
[`environment.profiles`](#opt-environment.profiles) to form the content of
the corresponding environment variable.

Also, these variables are merged into
[environment](#opt-environment.profileRelativeEnvVars) and it is
therefore not possible to use PAM style variables such as
`@{HOME}`.

*Type:* attribute set of list of string

*Default:* `{ }`

*Example:*

``` nix
{
  MANPATH = [
    "/man"
    "/share/man"
  ];
  PATH = [
    "/bin"
  ];
}
```

*Declared by:* [`nixos/modules/config/system-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/system-environment.nix)

## `environment.profiles` {#opt-environment.profiles}

A list of profiles used to setup the global environment.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.sessionVariables` {#opt-environment.sessionVariables}

A set of environment variables used in the global environment.
These variables will be set by PAM early in the login process.

The value of each session variable can be either a string or a
list of strings. The latter is concatenated, interspersed with
colon characters.

Setting a variable to `null` does nothing. You can override a
variable set by another module to `null` to unset it.

Note, due to limitations in the PAM format values may not
contain the `"` character.

Also, these variables are merged into
[environment](#opt-environment.variables) and it is
therefore not possible to use PAM style variables such as
`@{HOME}`.

*Type:* attribute set of (null or (list of (signed integer or string or absolute path)) or signed integer or string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/config/system-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/system-environment.nix)

## `environment.shellAliases` {#opt-environment.shellAliases}

An attribute set that maps aliases (the top level attribute names in
this option) to command strings or directly to build outputs. The
aliases are added to all users' shells.
Aliases mapped to `null` are ignored.

*Type:* attribute set of (null or string or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{
  l = null;
  ll = "ls -l";
}
```

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.shellInit` {#opt-environment.shellInit}

Shell script code called during shell initialisation.
This code is assumed to be shell-independent, which means you should
stick to pure sh without sh word split.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.shells` {#opt-environment.shells}

A list of permissible login shells for user accounts.
No need to mention `/bin/sh`
here, it is placed into this list implicitly.

*Type:* list of (package or absolute path)

*Default:* `[ ]`

*Example:* `[ pkgs.bashInteractive pkgs.zsh ]`

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.stub-ld.enable` {#opt-environment.stub-ld.enable}

Install a stub ELF loader to print an informative error message
in the event that a user attempts to run an ELF binary not
compiled for NixOS.

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/config/stub-ld.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/stub-ld.nix)

## `environment.systemPackages` {#opt-environment.systemPackages}

The set of packages that appear in
/run/current-system/sw.  These packages are
automatically available to all users, and are
automatically updated every time you rebuild the system
configuration.  (The latter is the main difference with
installing them in the default profile,
`/nix/var/nix/profiles/default`.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.firefox pkgs.thunderbird ]`

*Declared by:* [`nixos/modules/config/system-path.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/system-path.nix)

## `environment.unixODBCDrivers` {#opt-environment.unixODBCDrivers}

Specifies Unix ODBC drivers to be registered in
`/etc/odbcinst.ini`.  You may also want to
add `pkgs.unixodbc` to the system path to get
a command line client to connect to ODBC databases.

*Type:* list of package

*Default:* `[ ]`

*Example:* `with pkgs.unixodbcDrivers; [ sqlite psql ]`

*Declared by:* [`nixos/modules/config/unix-odbc-drivers.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/unix-odbc-drivers.nix)

## `environment.variables` {#opt-environment.variables}

A set of environment variables used in the global environment.
These variables will be set on shell initialisation (e.g. in /etc/profile).

The value of each variable can be either a string or a list of
strings.  The latter is concatenated, interspersed with colon
characters.

Setting a variable to `null` does nothing. You can override a
variable set by another module to `null` to unset it.

*Type:* attribute set of (null or (list of (signed integer or string or absolute path)) or signed integer or string or absolute path)

*Default:* `{ }`

*Example:*

``` nix
{
  EDITOR = "nvim";
  VISUAL = "nvim";
}
```

*Declared by:* [`nixos/modules/config/shells-environment.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/shells-environment.nix)

## `environment.wordlist.enable` {#opt-environment.wordlist.enable}

Whether to enable environment variables for lists of words.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/misc/wordlist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/wordlist.nix)

## `environment.wordlist.lists` {#opt-environment.wordlist.lists}

A set with the key names being the environment variable you'd like to
set and the values being a list of paths to text documents containing
lists of words. The various files will be merged, sorted, duplicates
removed, and extraneous spacing removed.

If you have a handful of words that you want to add to an already
existing wordlist, you may find `builtins.toFile` useful for this
task.

*Type:* attribute set of non-empty (list of absolute path)

*Default:*

``` nix
{
  WORDLIST = [ "${pkgs.scowl}/share/dict/words.txt" ];
}
```

*Example:*

``` nix
{
  WORDLIST = [ "${pkgs.scowl}/share/dict/words.txt" ];
  AUGMENTED_WORDLIST = [
    "${pkgs.scowl}/share/dict/words.txt"
    "${pkgs.scowl}/share/dict/words.variants.txt"
    (builtins.toFile "extra-words" ''
      desynchonization
      oobleck'')
  ];
}
```

*Declared by:* [`nixos/modules/misc/wordlist.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/misc/wordlist.nix)

## `environment.wvdial.dialerDefaults` {#opt-environment.wvdial.dialerDefaults}

Contents of the "Dialer Defaults" section of
<filename>/etc/wvdial.conf</filename>.

*Type:* string

*Default:* `""`

*Example:* `"Init1 = AT+CGDCONT=1,\"IP\",\"internet.t-mobile\""`

*Declared by:* [`nixos/modules/services/networking/wvdial.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wvdial.nix)

## `environment.wvdial.pppDefaults` {#opt-environment.wvdial.pppDefaults}

Default ppp settings for wvdial.

*Type:* string

*Default:*

``` nix
''
  noipdefault
  usepeerdns
  defaultroute
  persist
  noauth
''
```

*Declared by:* [`nixos/modules/services/networking/wvdial.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/wvdial.nix)

## `environment.xfce.excludePackages` {#opt-environment.xfce.excludePackages}

Which packages XFCE should exclude from the default environment

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.xfce4-volumed-pulse ]`

*Declared by:* [`nixos/modules/services/x11/desktop-managers/xfce.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/x11/desktop-managers/xfce.nix)
