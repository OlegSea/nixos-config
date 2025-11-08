{ pkgs, ... }:

{
  nix.settings.trusted-users = [
    "root"
    "olegsea"
  ];
  users.users.olegsea = {
    isNormalUser = true;
    description = "OlegSea";
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
    packages = with pkgs; [
      keepassxc
    ];
  };
}
