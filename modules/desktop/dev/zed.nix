{ pkgs, lib, ... }:
{
  hm = {
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
        "git-firefly"
        "comment"
        "sql"
        "make"
        "lua"
        "csharp"
        "csv"
        "ini"
        "just"
      ];
      userSettings = {
        theme = lib.mkForce {
          mode = "dark";
          dark = "Gruvbox Dark";
          light = "One Light";
        };
        buffer_font_family = lib.mkForce "CaskaydiaCove NF";
        ui_font_family = lib.mkForce "IBM Plex Sans";

        agent = {
          always_allow_tool_actions = true;
          default_profile = "write";
          default_model = {
            provider = "copilot_chat";
            model = "claude-sonnet-4";
          };
        };
        edit_predictions.mode = "subtle";

        inlay_hints = true;

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
  };
}
