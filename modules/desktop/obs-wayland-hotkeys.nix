{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  obs-studio,
  qt6,
}:

stdenv.mkDerivation rec {
  pname = "obs-wayland-hotkeys";
  version = "v1.1.0";

  src = fetchFromGitHub {
    owner = "leia-uwu";
    repo = "obs-wayland-hotkeys";
    rev = version;
    sha256 = "sha256-vOQfOEAnxn5vCaWpwDED1C107BB/d7T10kmKTXJ4k8k=";
  };

  nativeBuildInputs = [
    cmake
    qt6.wrapQtAppsHook
  ];
  buildInputs = [
    obs-studio
    qt6.qtbase
  ];

  NIX_CFLAGS_COMPILE = [ "-Wno-error=deprecated-declarations" ];

  cmakeFlags = [ "-DBUILD_OUT_OF_TREE=On" ];

  postInstall = ''
    rm -rf $out/{data,obs-plugins}
  '';

  meta = {
    description = "OBS Studio plugin that implements the global shortcuts portal";
    homepage = "https://github.com/leia-uwu/obs-wayland-hotkeys";
    license = lib.licenses.gpl2Only;
    inherit (obs-studio.meta) platforms;
  };
}
