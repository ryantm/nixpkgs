{
lib,
fetchFromGitHub,

git,
nix,
hub,
jq,
tree,
gist,
coreutils,
nixpkgs-review,
haskell,
haskellPackages,
}:

let

  developPackageAttrs = {
    name = "nixpkgs-update";
    root = fetchFromGitHub {
      owner = "ryantm";
      repo = "nixpkgs-update";
      rev = "2b479c77fac583883a75dd8274618884583af028";
      sha256 = "sha256-KZq4ABhZAHx7SOt+0yJaY/nSDLzhL1IkuP9enikXNgo=";
    };
    returnShellEnv = false;
  };

  drvAttrs = attrs: {
    NIX = nix;
    GIT = git;
    HUB = hub;
    JQ = jq;
    TREE = tree;
    GIST = gist;
    # TODO: are there more coreutils paths that need locking down?
    TIMEOUT = coreutils;
    NIXPKGSREVIEW = nixpkgs-review;
    meta = with lib; {
      description = "Updating nixpkgs packages since 2018";
      homepage = "https://github.com/ryantm/nixpkgs-update";
      license = licenses.cc0;
      maintainers = with maintainers; [ ryantm ];
    };
  };

in

haskell.lib.justStaticExecutables (
  haskell.lib.failOnAllWarnings (
    haskell.lib.disableExecutableProfiling (
      haskell.lib.disableLibraryProfiling (
        haskell.lib.generateOptparseApplicativeCompletion "nixpkgs-update" (
          (haskellPackages.developPackage developPackageAttrs).overrideAttrs drvAttrs
        )
      )
    )
  )
)
