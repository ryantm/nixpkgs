{ pkgs, lib, stdenv, nodejs, fetchFromGitHub, git, nodePackages, autoconf, libpng, pngquant, callPackage }:

let

  fetchNodeModules = callPackage ./fetchNodeModules.nix { };

  pname = "mattermost-webapp";

  version = "5.37.2";

  src = fetchFromGitHub {
    owner = "mattermost";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-kHvO6apDf3uKhjjiWGP2LITZPBuBpgIWHNdNAE7GR88=";
  };

  node_modules = fetchNodeModules {
    inherit src;
    nodejs = nodejs;
    hash = "sha256-a6pwAMQ42QTdQodKxFz2a/7qVuwh6/GmJYHHyDJR1sU=";
    makeTarball = false;
    production = false;
  };

in

stdenv.mkDerivation {
  inherit pname version src;

  nativeBuildInputs = [
    nodejs
  ];

  buildPhase = ''
    rm -rf node_modules
    cp -r ${node_modules}/lib/node_modules node_modules
    ls -la node_modules
    npm run build
  '';

  postInstall = ''
    mv dist $out
  '';

  meta = with lib; {
    description = "Open-source, self-hosted Slack-alternative";
    homepage = "https://www.mattermost.org";
    license = with licenses; [ agpl3 asl20 ];
    maintainers = with maintainers; [ fpletz ryantm ];
    platforms = platforms.unix;
  };
}
