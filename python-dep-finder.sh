#!/usr/bin/env bash
set -euo pipefail

function depsFor() {
    inputs=$(nix eval --raw --impure --expr "import ./python-deps.nix { path = \"$1\";}" || echo "[]")
    if [[ "$inputs" == "[]" ]]; then
        return
    fi
    echo "${inputs}" | jq --compact-output "{"\"$1\"": {\"deps\": .}}"
}

python_modules=($(ls -1 pkgs/development/python-modules/))
for name in "${python_modules[@]}"; do
    depsFor $name >> python_mapping.json
done
