{
  lib,
  stdenv,
  fetchFromGitHub,
  cmark-gfm,
  xxd,
  libfastjson,
  libzip,
  ninja,
  meson,
  pkg-config,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "mmdoc";
  version = "0.25.0-unstable-2026-07-17";

  src = fetchFromGitHub {
    owner = "ryantm";
    repo = "mmdoc";
    rev = "3cfd7300d399dfe0a168165d9787d958bb57e5ae";
    hash = "sha256-HTZ68Xeai9D1JeChVU5YYVU5DQqULkc/hiH8M2U8y6M=";
  };

  nativeBuildInputs = [
    ninja
    meson
    pkg-config
    xxd
  ];

  buildInputs = [
    cmark-gfm
    libfastjson
    libzip
  ];

  meta = {
    description = "Minimal Markdown Documentation";
    mainProgram = "mmdoc";
    homepage = "https://github.com/ryantm/mmdoc";
    license = lib.licenses.cc0;
    maintainers = with lib.maintainers; [ ryantm ];
    platforms = lib.platforms.unix;
  };
})
