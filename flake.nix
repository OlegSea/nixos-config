{
  description = "My config";

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      flakeDir = toString ./.;
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = (import ./systems { inherit lib inputs flakeDir; }).nixosConfigurations;
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:FlameFlag/nixcord";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    lazyvim.url = "github:pfassina/lazyvim-nix";

    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };
}
