{ pkgs, nixosConfigDir, ... }:
{
  home.packages = with pkgs; [
    eza
  ];
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
      update = "nh os switch ${nixosConfigDir}";
      cl = "clear";
      cd = "z";
      ls = "eza -lh --group-directories-first --icons=auto";
      lsa = "ls -a";
      lt = "eza --tree --level=2 --long --icons --git";
      lta = "lt -a";
      arch = "distrobox enter arch";
      edit = "zeditor";
      flake = "cd ${nixosConfigDir} && zeditor .";
      ta = "tmux attach";
      vpn = "sing-box run -c ${nixosConfigDir}/resources/vpn/box.json";
    };
    history.size = 10000;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      custom = "${nixosConfigDir}/resources/zsh";
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
    '';

  };

  programs.pay-respects.enableZshIntegration = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
}
