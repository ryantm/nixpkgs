{ pkgs, lib, stdenv, nodejs, fetchFromGitHub, git, nodePackages, autoconf, libpng, pngquant }:

let

  pname = "mattermost-webapp";

  version = "5.37.2";

  src = fetchFromGitHub {
    owner = "mattermost";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-kHvO6apDf3uKhjjiWGP2LITZPBuBpgIWHNdNAE7GR88=";
  };

  webappNodePackages = import ./node {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  } // {
    pngquant-bin = webappNodePackages.pngquant-bin.override {
      buildPhase = ''
        cp ${pngquant}/bin/* $out/bin
      '';
    };
  };

in

webappNodePackages.package.override {
  inherit pname version src;

  nativeBuildInputs = [
    autoconf
    pngquant
  ];

  postInstall = ''
    patchShebangs --build "$out/lib/node_modules/mattermost-webapp/node_modules/"
    npm --update-notifier=false run build
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
