# nodejsInstallExecutables {#nodejs-install-executables}

Hook for wrapping Node.js executables.
Primarily created for a multi-language environment.

## Examples {#nodejs-install-executables-example}

[npmHooks.npmBuildHook](../../hooks/npm-build-hook/index.md#npm-build-hook-example-snippet)

## Variables controlling `nodejsInstallExecutables` {#nodejs-install-executables-variables}

### `nodejsInstallExecutables` Exclusive Variables {#nodejs-install-executables-exclusive-variables}

#### `makeWrapperArgs` {#nodejs-install-executables-wrapper-args}

Flags to pass to the call to [`makeWrapper`](../../stdenv/stdenv/index.md#fun-makeWrapper).
To avoid double-wrapping, this flag can also be accessed in Bash.

``` nix
stdenv.mkDerivation (finalAttrs: {
  #...
  dontWrapGApps = true;

  postInstall = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';
  #...
})
```
