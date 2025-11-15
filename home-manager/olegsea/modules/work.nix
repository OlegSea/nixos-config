{ pkgs, ... }:
{
  home.packages = with pkgs; [
    remmina
    virt-viewer

    zathura
    onlyoffice-desktopeditors
  ];

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };
  };

}
