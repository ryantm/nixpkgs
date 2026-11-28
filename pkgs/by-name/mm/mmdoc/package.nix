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
  version = "0.30.5";

  src = fetchFromGitHub {
    owner = "ryantm";
    repo = "mmdoc";
    tag = finalAttrs.version;
    hash = "sha256-qIGRalrpIayBtYza6EnJ63SffzGcp6RkWzgg8jtg2gA=";
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
