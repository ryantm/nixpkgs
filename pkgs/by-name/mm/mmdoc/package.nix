{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  xxd,
  versionCheckHook,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "mmdoc";
  version = "0.30.6";

  src = fetchFromGitHub {
    owner = "ryantm";
    repo = "mmdoc";
    tag = finalAttrs.version;
    hash = "sha256-ga2uTpxQ0b4eJJiNYCFFEs/wtpcLw5dUq5AYfRopbtE=";
  };

  nativeBuildInputs = [
    meson
    ninja
    xxd
  ];

  doCheck = true;

  nativeInstallCheckInputs = [
    versionCheckHook
  ];

  doInstallCheck = true;

  meta = {
    description = "Minimal Markdown Documentation";
    mainProgram = "mmdoc";
    homepage = "https://github.com/ryantm/mmdoc";
    changelog = "https://github.com/ryantm/mmdoc/releases/tag/${finalAttrs.version}";
    license = lib.licenses.cc0;
    maintainers = with lib.maintainers; [ ryantm ];
    platforms = lib.platforms.unix;
  };
})
