{ pkgs, inputs, ... }:
{
  imports = [ inputs.lazyvim.homeManagerModules.default ];
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
      '';
      autocmds = ''
        vim.api.nvim_create_autocmd("FocusLost", {
          command = "silent! wa",
          desc = "Auto-save on focus loss",
        })
      '';
    };

    extras = {
      lang.nix.enable = true;
      lang.python = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
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
}
