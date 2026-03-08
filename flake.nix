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

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };
}
