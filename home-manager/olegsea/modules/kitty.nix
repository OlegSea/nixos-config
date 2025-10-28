{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
      confirm_os_window_close = 0;
      hide_window_decorations = true;
      enable_audio_bell = false;
      sync_to_monitor = true;
      wheel_scroll_multiplier = 10.0;
      scrollback_lines = 1500;
      detect_urls = true;
    };
  };
}
