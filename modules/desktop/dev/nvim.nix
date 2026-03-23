{ pkgs, lazyvim, ... }:
{
  hm = {
    imports = [ lazyvim.homeManagerModules.default ];
    programs.lazyvim = {
      enable = true;

      plugins = {
        lazyvim = ''
          return {
            "LazyVim/LazyVim",
            opts = {
              colorscheme = "base16-gruvbox-dark-soft",
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
        lang = {
          nix.enable = true;
          python = {
            enable = true;
            installDependencies = true;
            installRuntimeDependencies = true;
          };
          rust = {
            enable = true;
            installDependencies = true;
          };
        };
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
