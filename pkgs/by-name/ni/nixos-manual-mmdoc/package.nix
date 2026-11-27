{
  stdenvNoCC,
  lib,
  pkgs,
  path,
  callPackage,
  writeText,
  mmdoc,
  python3,
  nixosOptionsDoc,
  nixos-doc-src,
}:

let
  nixosEval = import (path + "/nixos/lib/eval-config.nix") {
    system = stdenvNoCC.hostPlatform.system;
    modules = [ ];
  };

  nixos-lib = import (path + "/nixos/lib") { };

  revision = "master";
  stripPrefix = lib.removePrefix "${toString path}/";

  moduleChapterId =
    p:
    let
      stem = lib.removeSuffix ".nix" (baseNameOf p.file);
    in
    if stem == "default" then baseNameOf (dirOf p.file) else stem;

  moduleChaptersJSON = writeText "nixos-module-chapters.json" (
    builtins.toJSON (
      map (p: {
        id = moduleChapterId p;
        value = "${p.value}";
      }) (lib.sortOn (p: p.file) nixosEval.config.meta.doc)
    )
  );

  testOptionsDoc =
    let
      eval = nixos-lib.evalTest {
        config.node.type = lib.types.deferredModule;
        config.hostPkgs = pkgs;
        options._module.args = lib.mkOption { internal = true; };
      };
    in
    nixosOptionsDoc {
      inherit (eval) options;
      inherit revision;
      transformOptions =
        opt:
        opt
        // {
          declarations = map (
            decl:
            let
              declStr = toString decl;
            in
            if lib.hasPrefix "${toString path}/" declStr then
              let
                subpath = stripPrefix declStr;
              in
              {
                url = "https://github.com/NixOS/nixpkgs/blob/master/${subpath}";
                name = subpath;
              }
            else
              decl
          ) opt.declarations;
        };
      documentType = "none";
      variablelistId = "test-options-list";
      optionIdPrefix = "test-opt-";
    };

  portableServiceOptions = nixosOptionsDoc {
    inherit
      (lib.evalModules {
        modules = [
          (lib.importService {
            pkgs = throw "nixos docs / portableServiceOptions: Do not reference pkgs in docs";
          })
        ];
      })
      options
      ;
    inherit revision;
    transformOptions = opt: opt // { declarations = map (d: stripPrefix (toString d)) opt.declarations; };
  };

  systemdServiceOptions = nixosOptionsDoc {
    inherit (lib.evalModules { modules = [ (path + "/nixos/modules/system/service/systemd/service.nix") ]; }) options;
    inherit revision;
    transformOptions = opt: opt // { declarations = map (d: stripPrefix (toString d)) opt.declarations; };
  };

  testDriverMachineDocstrings = callPackage (
    path + "/nixos/lib/test-driver/nixos-test-driver-docstrings.nix"
  ) { };

  prepareConfig = writeText "nixos-mmdoc-config.json" (
    builtins.toJSON {
      docDir = "doc";
      optionsJson = "${nixosEval.config.system.build.manual.optionsJSON}/share/doc/nixos/options.json";
      testOptionsJson = "${testOptionsDoc.optionsJSON}/share/doc/nixos/options.json";
      portableServiceOptionsJson = "${portableServiceOptions.optionsJSON}/share/doc/nixos/options.json";
      systemdServiceOptionsJson = "${systemdServiceOptions.optionsJSON}/share/doc/nixos/options.json";
      machineMethodsMd = "${testDriverMachineDocstrings}/machine-methods.md";
      moduleChaptersJson = "${moduleChaptersJSON}";
      navJson = "${nixos-doc-src + "/nav.json"}";
      version = lib.version;
    }
  );
in

stdenvNoCC.mkDerivation rec {
  name = "nixos-minimal-manual";

  src = lib.fileset.toSource {
    root = nixos-doc-src;
    fileset = lib.fileset.fileFilter (file: file.hasExt "md" || file.hasExt "dot") nixos-doc-src;
  };

  dontUnpack = true;

  buildCommand = ''
    cp -r $src doc
    chmod -R u+w doc
    cp ${./favicon.svg} doc/favicon.svg
    ${lib.getExe python3} ${./prepare-nixos-docs.py} ${prepareConfig}
    ${mmdoc}/bin/mmdoc nixos doc $out
  '';

  meta = with lib; {
    description = "NixOS minimal manual";
    homepage = "https://github.com/nixos/nixpkgs";
    license = licenses.mit;
    maintainers = with maintainers; [ ryantm ];
    platforms = platforms.unix;
  };
}
