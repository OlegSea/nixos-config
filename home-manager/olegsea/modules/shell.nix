{ pkgs, nixosConfigDir, ... }:
{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "nh os switch ${nixosConfigDir}";
      cl = "clear";
      cd = "z";
    };
    history.size = 10000;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "robbyrussell";
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
      # Example:
      set -g mouse on
    '';

  };

  programs.pay-respects.enableZshIntegration = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

}
