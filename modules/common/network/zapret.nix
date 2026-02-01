{ inputs, pkgs, ... }:
{
  imports = [
    inputs.zapret-discord-youtube.nixosModules.default
    {
      services.zapret-discord-youtube = {
        enable = true;
        config = "general (SIMPLE FAKE)";
      };
    }
  ];
}
