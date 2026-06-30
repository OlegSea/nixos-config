{ pkgs, nix-gaming, ... }:
let
  osu = pkgs.callPackage (
    {
      makeWrapper,
      osu-lazer-bin,
      symlinkJoin,
    }:
    symlinkJoin {
      name = "osu-wrapped-${osu-lazer-bin.version}";
      paths = [ osu-lazer-bin ];
      nativeBuildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/osu! \
          --set SDL_VIDEODRIVER wayland \
          --set PIPEWIRE_LATENCY 256/48000 \
          --set PIPEWIRE_ALSA "{ alsa.format=S32_LE alsa.rate=48000 alsa.channels=2 alsa.buffer-bytes=1024 alsa.period-bytes=256 }"
      '';
    }
  ) { };
in
{
  nixpkgs.overlays = [
    (final: prev: {
      osu-lazer-bin = final.callPackage ../../../packages/osu-lazer-bin.nix { };
    })
  ];

  environment.systemPackages = [
    osu
    nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
  ];
}
