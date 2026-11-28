# Modular Services {#modular-services}

Status: in development. This functionality is new in NixOS 25.11, and significant changes should be expected. We'd love to hear your feedback in [https://github.com/NixOS/nixpkgs/pull/372170](https://github.com/NixOS/nixpkgs/pull/372170)

A conventional NixOS service is a module that defines options under `systemd.services.*`. The resulting configuration is non-modular, which leads to problems with composability, reuse, and portability.

A *modular service* splits the conventional service into two parts:

- the modular service itself, which is a module that defines values for a core set of the service's options, like processes and config files, in a service manager-agnostic way;
- a configuration management framework, which consumes the modular service and turns those "abstract" options into service-manager specific ones.

A configuration management framework is an application of `evalModules` with the `class` and `specialArgs` input attribute set to particular values. NixOS is such a configuration management framework, and so are [Home Manager](https://github.com/nix-community/home-manager) and [nix-darwin](https://github.com/nix-darwin/nix-darwin).

The service management component of a configuration management framework is the set of module options that connects Nix expressions with the underlying service (or process) manager.
For NixOS this is the module wrapping [`systemd`](https://systemd.io/), on `nix-darwin` this is the module wrapping [`launchd`](https://en.wikipedia.org/wiki/Launchd).

A *modular service* is a [module](https://nixos.org/manual/nixpkgs/stable/index.html#module-system) that defines values for a core set of options declared in the service management component of a configuration management framework, including which program to run.
Since it's a module, it can be composed with other modules via `imports` to extend its functionality.

NixOS provides two options into which such modules can be plugged:

- `system.services.<name>`
- an option for user services (TBD)

Crucially, these options have the type [`attrsOf`](https://nixos.org/manual/nixpkgs/unstable/#function-library-lib.types.attrsOf) [`submodule`](https://nixos.org/manual/nixpkgs/unstable/#function-library-lib.types.submodule).
The name of the service is the attribute name corresponding to `attrsOf`.

<!-- ^ This is how composition is *always* provided, instead of a difficult thing (but this is reference docs, not a changelog) -->

The `submodule` is pre-loaded with two modules:

- a generic module that is intended to be portable
- a module with systemd-specific options, whose values or defaults derive from the generic module's option values.

So note that the default value of `system.services.<name>` is not a complete service. It requires that the user provide a value, and this is typically done by importing a module. For example:

<!-- Not using typical example syntax, because reading this is *not* optional, and should it should not be folded closed. -->

``` nix
{
  system.services.my-service-instance = {
    imports = [ pkgs.some-application.services.some-service-module ];
    foo.settings = {
      # ...
    };
  };
}
```

## Portability {#modular-service-portability}

It is possible to write service modules that are portable. This is done by either avoiding the `systemd` option tree, or by defining process-manager-specific definitions in an optional way:

``` nix
{
  config,
  options,
  lib,
  ...
}:
{
  _class = "service";
  config = {
    process.argv = [ (lib.getExe config.foo.program) ];
  }
  // lib.optionalAttrs (options ? systemd) {
    # ... systemd-specific definitions ...
  };
}
```

This way, the module can be loaded into a configuration manager that does not use systemd, and the `systemd` definitions will be ignored.
Similarly, other configuration managers can declare their own options for services to customize.

## Composition and Ownership {#modular-service-composition}

Compared to traditional services, modular services are inherently more composable, by virtue of being modules and receiving a user-provided name when imported.
However, composition can not end there, because services need to be able to interact with each other.
This can be achieved in two ways:

1. Users can link services together by providing the necessary NixOS configuration.
2. Services can be compositions of other services.

These aren't mutually exclusive. In fact, it is a good practice when developing services to first write them as individual services, and then compose them into a higher-level composition. Each of these services is a valid modular service, including their composition.

## Migration {#modular-service-migration}

Many services could be migrated to the modular service system, but even when the modular service system is mature, it is not necessary to migrate all services.
For instance, many system-wide services are a mandatory part of a desktop system, and it doesn't make sense to have multiple instances of them.
Moving their logic into separate Nix files may still be beneficial for the efficient evaluation of configurations that don't use those services, but that is a rather minor benefit, unless modular services potentially become the standard way to define services.

<!-- TODO example of a single-instance service -->

## Writing and Reviewing a Modular Service {#modular-service-review}

A typical service module consists of the following:

For more details, refer to the contributor documentation in [`nixos/README-modular-services.md`](https://github.com/NixOS/nixpkgs/blob/master/nixos/README-modular-services.md).

## Portable Service Options {#modular-service-options-portable}

### `_module.args` {#service-opt-_module.args}

Additional arguments passed to each module in addition to ones
like `lib`, `config`,
and `pkgs`, `modulesPath`.

This option is also available to all submodules. Submodules do not
inherit args from their parent module, nor do they provide args to
their parent module or sibling submodules. The sole exception to
this is the argument `name` which is provided by
parent modules to a submodule and contains the attribute name
the submodule is bound to, or a unique generated name if it is
not bound to an attribute.

Some arguments are already passed by default, of which the
following *cannot* be changed with this option:

- `lib`: The nixpkgs library.

- `config`: The results of all options after merging the values from all modules together.

- `options`: The options declared in all modules.

- `specialArgs`: The `specialArgs` argument passed to `evalModules`.

- All attributes of `specialArgs`

  Whereas option values can generally depend on other option values
  thanks to laziness, this does not apply to `imports`, which
  must be computed statically before anything else.

  For this reason, callers of the module system can provide `specialArgs`
  which are available during import resolution.

  For NixOS, `specialArgs` includes
  `modulesPath`, which allows you to import
  extra modules from the nixpkgs package tree without having to
  somehow make the module aware of the location of the
  `nixpkgs` or NixOS directories.

  ```
  { modulesPath, ... }: {
    imports = [
      (modulesPath + "/profiles/minimal.nix")
    ];
  }
  ```

For NixOS, the default value for this option includes at least this argument:

- `pkgs`: The nixpkgs package set according to
  the [`nixpkgs.pkgs`](../../options/other/index.md#opt-nixpkgs.pkgs) option.

*Type:* lazy attribute set of raw value

*Default:* `{ }`

*Declared by:* [`lib/modules.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/modules.nix)

### `configData` {#service-opt-configData}

Configuration data files for the service

These files are made available to the service and can be updated without restarting the service process, enabling configuration reloading.
The service manager implementation determines how these files are exposed to the service (e.g., via a specific directory path).
This path is available in the `path` sub-option for each `configData.<name>` entry.

This is particularly useful for services that support configuration reloading via signals (e.g., SIGHUP) or which pick up changes automatically, so that no downtime is required in order to reload the service.

*Type:* lazy attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "server.conf" = {
    text = ''
      port = 8080
      workers = 4
    '';
  };
  "ssl/cert.pem" = {
    source = ./cert.pem;
  };
}
```

*Declared by:* [`lib/services/config-data.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/config-data.nix)

### `configData.<name>.enable` {#service-opt-configData._name_.enable}

Whether this configuration file should be generated.
This option allows specific configuration files to be disabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`lib/services/config-data-item.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/config-data-item.nix)

### `configData.<name>.name` {#service-opt-configData._name_.name}

Name of the configuration file (relative to the service's configuration directory). Defaults to the attribute name.

*Type:* string

*Declared by:* [`lib/services/config-data-item.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/config-data-item.nix)

### `configData.<name>.path` {#service-opt-configData._name_.path}

The actual path where this configuration file will be available.
This is determined by the service manager implementation.

On NixOS it is an absolute path.
Other service managers may provide a relative path, in order to be unprivileged and/or relocatable.

*Type:* string

*Read only*

*Declared by:* [`lib/services/config-data-item.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/config-data-item.nix)

### `configData.<name>.source` {#service-opt-configData._name_.source}

Path of the source file.

*Type:* absolute path

*Declared by:* [`lib/services/config-data-item.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/config-data-item.nix)

### `configData.<name>.text` {#service-opt-configData._name_.text}

Text content of the configuration file.

*Type:* null or strings concatenated with "
"

*Default:* `null`

*Declared by:* [`lib/services/config-data-item.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/config-data-item.nix)

### `meta.maintainers` {#service-opt-meta.maintainers}

List of maintainers of each module.
This option should be defined at most once per module.

The option value is not a list of maintainers, but an attribute set that maps module file names to lists of maintainers.

*Type:* list of lib.maintainers

*Default:* `[ ]`

*Example:* `[ lib.maintainers.alice lib.maintainers.bob ]`

*Declared by:* [`lib/modules/generic/meta-maintainers.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/modules/generic/meta-maintainers.nix)

### `meta.teams` {#service-opt-meta.teams}

List of team maintainers of each module.
This option should be defined at most once per module.

*Type:* list of lib.teams

*Default:* `[ ]`

*Example:* `[ lib.teams.acme lib.teams.haskell ]`

*Declared by:* [`lib/modules/generic/meta-maintainers.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/modules/generic/meta-maintainers.nix)

### `notificationProtocol` {#service-opt-notificationProtocol}

Notification protocol that this service supports with the underlying service manager.

*Type:* submodule

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

### `notificationProtocol.s6` {#service-opt-notificationProtocol.s6}

Whether to enable Whether the service supports s6-notify..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

### `notificationProtocol.systemd` {#service-opt-notificationProtocol.systemd}

Whether to enable Whether the service supports systemd-notify..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

### `process.argv` {#service-opt-process.argv}

Command filename and arguments for starting this service.
This is a raw command-line that should not contain any shell escaping.
If expansion of environmental variables is required then use
a shell script or `importas` from `pkgs.execline`.

When `flags` are set, the arguments rendered from them are merged into
`argv`. See `flags` for how the two are ordered against each other.

*Type:* list of (string or absolute path convertible to it)

*Default:* `[ ]`

*Example:* `[ (lib.getExe config.package) "--nobackground" ]`

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

### `process.flagFormat` {#service-opt-process.flagFormat}

Function mapping flag names to option format specs
for `lib.cli.toCommandLine`.

Receives the flag name and returns `{ option, sep, explicitBool, formatArg? }`.

*Type:* function that evaluates to a(n) attribute set of anything

*Default:* `<function>`

*Example:*

``` nix
name: {
  option = name;
  sep = "=";
  explicitBool = false;
}
```

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

### `process.flags` {#service-opt-process.flags}

Flags to pass to the service process.
The key is the flag name (e.g. `"--port"`), the value is the flag value.

Each `name = value` pair is rendered via `lib.cli.toCommandLine`
using `flagFormat`.

- `null`: the flag is omitted (regardless of `flagFormat`)
- bool: rendered per `flagFormat.explicitBool`
  - `explicitBool = false` (default): `true` emits the bare flag,
    `false` is omitted
  - `explicitBool = true`: both `true` and `false` are rendered as
    explicit arguments via `flagFormat.formatArg`
- string / path / int: rendered as the option's argument, joined to the
  option name per `flagFormat.sep` and stringified by
  `flagFormat.formatArg`

To pass the same flag multiple times, use the list form with
repeated keys, e.g.
`[ { "--host" = "a"; } { "--host" = "b"; } ]`.

The rendered arguments are merged into `argv`, so `argv` and `flags`
share a single `lib.mkOrder` space:

- A flag with no ordering property of its own is placed at priority
  1250, between `lib.modules.defaultOrderPriority` (1000, which is
  what an unadorned `argv` definition gets) and `lib.mkAfter` (1500).
  Plain flags therefore follow the command name and any other plain
  `argv` arguments.
- `lib.mkAfter` on `argv` still lands after the flags, which is how
  trailing positional arguments are expressed.
- `lib.mkOrder` on a flag is honoured verbatim against `argv`, so a
  sub-command can be placed between two groups of flags.

Because 1250 is substituted for flags that carry no ordering property,
`lib.mkOrder 1000` on a flag is indistinguishable from leaving that
flag unadorned. To order a flag around plain `argv` entries, pick a
priority next to 1000, such as 999 or 1001.

*Type:* attribute list of (null or boolean or signed integer or (string or absolute path convertible to it))

*Default:* `{ }`

*Example:*

``` nix
{
  "--port" = "8080";
  "--verbose" = true;
  # ordered ahead of the unadorned flags above
  "--config" = lib.mkOrder 1100 "/etc/foo.conf";
}
# or, for repeated flags:
[
  { "--host" = "localhost"; }
  { "--host" = "0.0.0.0"; }
]
```

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

### `process.reloadCommand` {#service-opt-process.reloadCommand}

Command used for reloading in the underlying service manager to reload.

*Type:* null or string

*Default:* `null`

*Example:* `"${pkgs.coreutils}/bin/kill -HUP $MAINPID"`

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

### `process.reloadSignal` {#service-opt-process.reloadSignal}

Configures the reload signal to send to the service manager.

*Type:* null or string

*Default:* `null`

*Example:* `"HUP"`

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

### `services` {#service-opt-services}

A collection of [modular services](https://nixos.org/manual/nixos/unstable/#modular-services) that are configured in one go.

You could consider the sub-service relationship to be an ownership relation.
It **does not** automatically create any other relationship between services (e.g. systemd slices), unless perhaps such a behavior is explicitly defined and enabled in another option.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`lib/services/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/services/service.nix)

## Systemd-specific Service Options {#modular-service-options-systemd}

### `_module.args` {#systemd-service-opt-_module.args}

Additional arguments passed to each module in addition to ones
like `lib`, `config`,
and `pkgs`, `modulesPath`.

This option is also available to all submodules. Submodules do not
inherit args from their parent module, nor do they provide args to
their parent module or sibling submodules. The sole exception to
this is the argument `name` which is provided by
parent modules to a submodule and contains the attribute name
the submodule is bound to, or a unique generated name if it is
not bound to an attribute.

Some arguments are already passed by default, of which the
following *cannot* be changed with this option:

- `lib`: The nixpkgs library.

- `config`: The results of all options after merging the values from all modules together.

- `options`: The options declared in all modules.

- `specialArgs`: The `specialArgs` argument passed to `evalModules`.

- All attributes of `specialArgs`

  Whereas option values can generally depend on other option values
  thanks to laziness, this does not apply to `imports`, which
  must be computed statically before anything else.

  For this reason, callers of the module system can provide `specialArgs`
  which are available during import resolution.

  For NixOS, `specialArgs` includes
  `modulesPath`, which allows you to import
  extra modules from the nixpkgs package tree without having to
  somehow make the module aware of the location of the
  `nixpkgs` or NixOS directories.

  ```
  { modulesPath, ... }: {
    imports = [
      (modulesPath + "/profiles/minimal.nix")
    ];
  }
  ```

For NixOS, the default value for this option includes at least this argument:

- `pkgs`: The nixpkgs package set according to
  the [`nixpkgs.pkgs`](../../options/other/index.md#opt-nixpkgs.pkgs) option.

*Type:* lazy attribute set of raw value

*Default:* `{ }`

*Declared by:* [`lib/modules.nix`](https://github.com/NixOS/nixpkgs/blob/master/lib/modules.nix)

### `systemd.lib` {#systemd-service-opt-systemd.lib}

Library functions for working with systemd services.

Available functions:

- `escapeSystemdExecArgs`: Escapes a list of arguments for use in ExecStart.
  Prevents systemd's specifier (%) and variable ($) substitution by escaping
  them to %% and $$ respectively.

  Example: `escapeSystemdExecArgs [ "/bin/echo" "Unit %n" ]`
  produces `"/bin/echo" "Unit %%n"`

*Type:* lazy attribute set of raw value

*Default:* `{ }`

*Read only*

*Declared by:* [`nixos/modules/system/service/systemd/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/service/systemd/service.nix)

### `systemd.mainExecReload` {#systemd-service-opt-systemd.mainExecReload}

Main command line for systemd's ExecReload with systemd's specifier and
environment variable substitution enabled.

This option sets the primary ExecReload entry, and is the way to extend the
command line derived from `process.reloadCommand`.

This option allows you to use systemd specifiers like `%n` (unit name),
`%i` (instance), `%t` (runtime directory), and environment variables using
`${VAR}` syntax in your command line.

By default, it is set to `process.reloadCommand`. Because
`process.reloadCommand` is already a command line (not an argument
list), it is used verbatim so that references like `$MAINPID` are preserved.

When `process.reloadCommand` is unset, this option is `null` and no
`ExecReload` is emitted; a service may then set
`systemd.service.serviceConfig.ExecReload` itself.

To extend `process.reloadCommand` with systemd specifiers, you can append
to the command line:

``` nix
systemd.mainExecReload =
  config.process.reloadCommand + " --systemd-unit %n";
```

This pattern allows you to pass the unit name (or other systemd specifiers)
as additional arguments.

See `systemd.service(5)` (section "COMMAND LINES") for details on
variable substitution and `systemd.unit(5)` (section "SPECIFIERS")
for available specifiers like `%n`, `%i`, `%t`.

*Type:* null or string

*Default:* `config.process.reloadCommand`

*Declared by:* [`nixos/modules/system/service/systemd/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/service/systemd/service.nix)

### `systemd.mainExecStart` {#systemd-service-opt-systemd.mainExecStart}

Main command line for systemd's ExecStart with systemd's specifier and
environment variable substitution enabled.

This option sets the primary ExecStart entry. Additional ExecStart entries
can be added via `systemd.service.serviceConfig.ExecStart` with `lib.mkBefore`
or `lib.mkAfter`.

This option allows you to use systemd specifiers like `%n` (unit name),
`%i` (instance), `%t` (runtime directory), and environment variables using
`${VAR}` syntax in your command line.

By default, this is set to the escaped version of `process.argv`
to prevent systemd substitution. Set this option explicitly to enable
systemd's substitution features.

To extend `process.argv` with systemd specifiers, you can append
to the escaped arguments:

``` nix
systemd.mainExecStart =
  config.systemd.lib.escapeSystemdExecArgs config.process.argv + " --systemd-unit %n";
```

This pattern allows you to pass the unit name (or other systemd specifiers)
as additional arguments while keeping the base command from `process.argv`
properly escaped.

See `systemd.service(5)` (section "COMMAND LINES") for details on
variable substitution and `systemd.unit(5)` (section "SPECIFIERS")
for available specifiers like `%n`, `%i`, `%t`.

*Type:* string

*Default:* `config.systemd.lib.escapeSystemdExecArgs config.process.argv`

*Declared by:* [`nixos/modules/system/service/systemd/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/service/systemd/service.nix)

### `systemd.service` {#systemd-service-opt-systemd.service}

Alias of `systemd.services.""`.

*Type:* submodule

*Declared by:* [`nixos/modules/system/service/systemd/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/service/systemd/service.nix)

### `systemd.services` {#systemd-service-opt-systemd.services}

This module configures systemd services, with the notable difference that their unit names will be prefixed with the abstract service name.

This option's value is not suitable for reading, but you can define a module here that interacts with just the unit configuration in the host system configuration.

Note that this option contains *deferred* modules.
This means that the module has not been combined with the system configuration yet, no values can be read from this option.
What you can do instead is define a module that reads from the module arguments (such as `config`) that are available when the module is merged into the system configuration.

*Type:* lazy attribute set of module

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/service/systemd/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/service/systemd/service.nix)

### `systemd.socket` {#systemd-service-opt-systemd.socket}

Alias of `systemd.sockets.""`.

*Type:* submodule

*Declared by:* [`nixos/modules/system/service/systemd/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/service/systemd/service.nix)

### `systemd.sockets` {#systemd-service-opt-systemd.sockets}

Declares systemd socket units. Names will be prefixed by the service name / path.

See [`systemd.services`](../../options/systemd/index.md#opt-systemd.services).

*Type:* lazy attribute set of module

*Default:* `{ }`

*Declared by:* [`nixos/modules/system/service/systemd/service.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/service/systemd/service.nix)

<!-- TODO: more anchors -->
