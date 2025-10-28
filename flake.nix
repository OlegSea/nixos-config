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
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      nixosConfigDir = "/home/olegsea/flake";
    in
    {
      nixosConfigurations.oleg-desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit nixosConfigDir;
          inherit inputs;
          inherit system;
          inherit stylix;
        };
        modules = [
          # Импортируем основной конфиг хоста
          ./hosts/desktop/configuration.nix

          # Подключаем модули NixOS
          ./modules/core.nix
          ./modules/network.nix
          ./modules/gnome.nix
          ./modules/niri.nix
          ./modules/audio.nix
          ./modules/users.nix
          ./modules/power.nix
          # TODO: Вернуть, когда починят qgnomeplatform
          # ./modules/stylix.nix

          stylix.nixosModules.stylix

          # Подключаем Home Manager
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
