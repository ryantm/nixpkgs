{ path } :
let
  pkgs = import ./. { system = "x86_64-linux";};
in
with pkgs.lib;
let
  python-pkgs = attrNames pkgs.python3Packages;
  filters = filter (n:
    (elem n [
      "pkg-config"
    ]) ||
    (
    (isDerivation (pkgs.${n} or false)) &&
    (isString ((pkgs.${n}.meta or {}).position or false)) &&
    !(hasInfix "build-support" pkgs.${n}.meta.position) &&
    !(hasInfix "os-specific/darwin" pkgs.${n}.meta.position) &&
    !(elem n [
      "autoconf"
      "automake"
      "nix-update-script"
      "meson"
      "ninja"
      "python3"
      "python"
    ]) &&
    !(elem n python-pkgs) &&
    !(hasSuffix "Hook" n)
    )
  );
  renames = {
    "pkgconfig" = "pkg-config";
  };
  rename = map (p: renames.${p} or p);
  addPkgs = map (p: "pkgs." + p);
in

builtins.toJSON (
  addPkgs (
    filters (
      rename (
        attrNames (
          functionArgs (import ./pkgs/development/python-modules/${path}/default.nix
          ))))))
