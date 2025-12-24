{ pkgs, ... }:
{
  home.packages = [
    pkgs.zed-editor
  ];
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "html"
      "typst"
    ];
    userSettings = {
      theme = {
        mode = "dark";
        dark = "Gruvbox Dark";
        light = "One Light";
      };
      buffer_font_family = "CaskaydiaCove NF";
      # ui_font_family = "CaskaydiaMono NF";

      agent = {
        always_allow_tool_actions = true;
        default_profile = "write";
        default_model = {
          provider = "copilot_chat";
          model = "claude-sonnet-4";
        };
      };
      edit_predictions.mode = "subtle";

      diagnostics.inline.enabled = true;

      vim_mode = true;
      vim = {
        use_system_clipboard = "on_yank";
      };

      autosave.after_delay.milliseconds = 500;

      languages = {
        Python = {
          language_servers = [ "pyright" ];
        };
      };
    };
  };
}
