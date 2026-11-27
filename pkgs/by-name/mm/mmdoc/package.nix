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
  version = "0.29.3";

  src = fetchFromGitHub {
    owner = "ryantm";
    repo = "mmdoc";
    rev = finalAttrs.version;
    hash = "sha256-42r8QcAVoBOV3AFwZqwv+66B4BJS5fMlzqpnVKmpXFg=";
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
