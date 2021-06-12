# Minimal manual prototype

{ pkgs ? (import ../. {}), nixpkgs ? { }} :

with pkgs;

stdenv.mkDerivation rec {
  name = "nixpkgs-minimal-manual";

  src = builtins.filterSource (path: type: type == "directory" || builtins.match ".*\.md" path == []) ./.;

  phases = [ "buildPhase" ];

  buildPhase = ''
    cp -r $src source
    chmod -R u+w source
    cp ${import ./doc-support/lib-functions-docs-cm.nix { inherit pkgs; }}/*.md source/functions/library/
    ${mmdoc}/bin/mmdoc nixpkgs source $out
  '';
}
