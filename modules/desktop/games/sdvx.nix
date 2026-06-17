{ pkgs, ... }:
{
  services.pipewire.extraConfig.pipewire."10-spice2x-loopback" = {
    "context.modules" = [
      {
        name = "libpipewire-module-loopback";
        args = {
          "audio.position" = [
            "FL"
            "FR"
          ];
          "capture.props" = {
            "media.class" = "Audio/Sink";
            "audio.format" = "S16LE";
            "audio.rate" = 48000;
            "audio.channels" = 2;
            "node.name" = "spice2x41";
            "node.description" = "spice2x @ 48000";
          };
          "playback.props" = {
            "node.passive" = true;
            "node.name" = "spice2x41.output";
            "node.description" = "SPICE2X 48000 OUTPUT";
            "target.object" = "alsa_output.usb-Kingston_HyperX_Cloud_Alpha_S_000000000001-00.analog-stereo";
            "audio.format" = "S16LE";
          };
        };
      }
    ];
  };
  environment.systemPackages = with pkgs; [
    (wine-with-pcsclite.override {
      wineBuild = "wineWow64";
    })
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-base
    gst_all_1.gst-vaapi
    winetricks
  ];

  nixpkgs.overlays = [
    (final: prev: {
      wine-with-pcsclite = prev.wine.overrideAttrs (old: {
        buildInputs = old.buildInputs ++ [ final.pcsclite ];
        configureFlags = old.configureFlags ++ [ "--with-pcsclite" ];
      });

    })
  ];
}
