{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      niri,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      nixosConfigDir = "/home/olegsea/flake";
    in
    {
      nixosConfigurations.oleg-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit nixosConfigDir;
          inherit inputs;
          inherit system;
          inherit stylix;
        };
        modules = [
          ./hosts/laptop/configuration.nix

          ./modules/core.nix
          ./modules/cachix.nix
          ./modules/nh.nix
          ./modules/network.nix
          ./modules/gnome.nix
          ./modules/niri.nix
          ./modules/audio.nix
          ./modules/gaming.nix
          ./modules/devices.nix
          ./modules/users.nix
          ./modules/power.nix
          ./modules/containers.nix
          ./modules/stylix.nix

          stylix.nixosModules.stylix
          niri.nixosModules.niri

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit nixosConfigDir;
              inherit inputs;
              inherit system;
            };
            home-manager.users.olegsea = {
              imports = [
                ./home-manager/olegsea/home.nix
              ];
            };
          }
        ];
      };
    };
}
