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
  version = "0.21.0-unstable-2026-07-14";

  src = fetchFromGitHub {
    owner = "ryantm";
    repo = "mmdoc";
    rev = "8021aaffd82aec0306e3180164361e822596366a";
    hash = "sha256-mlTgGb9o1FJI0AQ9BMAvNo2affnwGQcfjnsVsnDu+yM=";
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
