{ lib, ... }: {
  genRegistry = source:
    let
      registryVals = { name, value }:
        let
          evaluated = builtins.tryEval (builtins.trace name value);
          val = evaluated.value;
        in
        if (! evaluated.success)
        then []
        # else [{ inherit name; value = {}; }];
        # else if lib.isDerivation val && lib.meta.availableOn (source.system or builtins.currentSystem) val
        else if lib.isDerivation val
        then [{
          inherit name;
          value = {
            # meta = val.meta or null;
            # name = val.name or null;
            # outputName = val.outputName or null;
            # outputs = val.outputs or null;
            pname = val.pname or null;
            # system = val.system or null;
            # version = val.version or null;
          };
        }]
        else if lib.isAttrs val && (val.recurseForDerivations or false) == true
        then builtins.map
          (scopeAttr: {
            name = "${name}.${scopeAttr.name}";
            inherit (scopeAttr) value;
          })
          (toRegistryItems val)
        else [];
      toRegistryItems = attrs: lib.flatten (builtins.map registryVals (lib.attrsToList attrs));
    in lib.listToAttrs (toRegistryItems source);
}
