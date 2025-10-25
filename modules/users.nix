{ pkgs, ... }:

{
  users.users.olegsea = {
      isNormalUser = true;
      description = "OlegSea";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      #  thunderbird

      ];
    };
}
