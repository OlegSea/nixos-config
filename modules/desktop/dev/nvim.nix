{ pkgs, lazyvim, ... }:
{
  hm = {
    imports = [ lazyvim.homeManagerModules.default ];
    programs.lazyvim = {
      enable = true;

      plugins = {
        colorscheme = ''
          return {
            "ellisonleao/gruvbox.nvim",
          }
        '';
        lazyvim = ''
          return {
            "LazyVim/LazyVim",
            opts = {
              colorscheme = "gruvbox",
            },
          }
        '';

      };
      config = {
        options = ''
          vim.opt.foldmethod = "manual"
          vim.opt.clipboard = ""
        '';
        autocmds = ''
          vim.api.nvim_create_autocmd("FocusLost", {
            command = "silent! wa",
            desc = "Auto-save on focus loss",
          })
        '';
      };

      extras = {
        coding.mini-surround.enable = true;
        editor.dial.enable = true;
        editor.inc-rename.enable = true;
        util.mini-hipatterns.enable = true;
        lang = builtins.listToAttrs (
          builtins.map
            (w: {
              name = w;
              value = {
                enable = true;
                installDependencies = true;
                installRuntimeDependencies = true;
              };
            })
            [
              "nix"
              "python"
              "rust"
              "json"
              "markdown"
              "typescript"
              "dotnet"
            ]
        );
      };

      extraPackages = with pkgs; [
        nixd
        alejandra
        gcc
        tree-sitter
        statix
      ];

      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        wgsl
        templ
      ];
    };
  };
}
