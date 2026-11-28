# nodejsInstallManuals {#nodejs-install-manuals}

Detects manuals in Node.js packages, and attempts to install them in standard locations.
This detection is done by inspecting the package.json of the project and finding any entries
with type `man`.

There are no ways currently to configure this hook.

## Examples {#nodejs-install-manuals-example}

[npmHooks.npmBuildHook](../../hooks/npm-build-hook/index.md#npm-build-hook-example-snippet)
