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

    # hyprland.url = "github:hyprwm/Hyprland";
    hyprland = {
      url = "github:hyprwm/Hyprland/71a1216abcc7031776630a6d88f105605c4dc1c9";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    lazyvim.url = "github:pfassina/lazyvim-nix";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    copyparty.url = "github:9001/copyparty";
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
      b = builtins;
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

      nixosConfigurations.oleg-desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit nixosConfigDir;
          inherit inputs;
          inherit system;
        };
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };
}
