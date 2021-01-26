# Minimal manual prototype

{ pkgs ? (import ../. {}), nixpkgs ? { }} :

with pkgs;

stdenv.mkDerivation rec {
  name = "nixpkgs-minimal-manual";

  src = builtins.filterSource (path: type: type == "directory" || builtins.match ".*\.md" path == []) ./.;

  buildInputs = [ mmdoc ];

  builder = writeScript "${name}-builder" "${mmdoc}/bin/mmdoc nixpkgs $src $out";
}
