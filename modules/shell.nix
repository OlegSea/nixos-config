{
  pkgs,
  config,
  flakeDir,
  ...
}:
{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  hm = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      localVariables = {
        ZSH_DISABLE_COMPFIX = "true";
      };

      shellAliases = {
        ll = "ls -l";
        cl = "clear";
        cd = "z";
        ls = "eza -lh --group-directories-first --icons=auto";
        lsa = "ls -a";
        lt = "eza --tree --level=2 --long --icons --git";
        lta = "lt -a";
        arch = "distrobox enter arch";
        edit = "zeditor";
        flake = "cd ${flakeDir} && zeditor .";
        ta = "tmux attach";
        vpn1 = "sudo sing-box run -c ${config.age.secrets.vpn1.path}";
        vpn2 = "sudo sing-box run -c ${config.age.secrets.vpn2.path}";
        vpn3 = "sudo sing-box run -c ${config.age.secrets.vpn3.path}";
        nixenv = "echo \"use flake\" >> .envrc && direnv allow";
      };
      history.size = 10000;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
        custom = "${flakeDir}/resources/zsh";
        theme = "theme";
      };
      initContent = ''
        if [[ -z "$TMUX" ]] && [[ "$TERM" != "linux" ]]; then
              tmux attach -t default || tmux new -s default
            fi
      '';
    };

    programs.tmux = {
      enable = true;
      keyMode = "vi";
      plugins = with pkgs.tmuxPlugins; [
        yank
      ];
      extraConfig = ''
        set-option -g default-shell "${pkgs.zsh}/bin/zsh"
        set -g mouse on
        set -sg escape-time 5
      '';

    };

    programs.pay-respects = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zoxide.enable = true;
    programs.zoxide.enableZshIntegration = true;

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
