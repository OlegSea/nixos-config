{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      nixosConfigDir = "/home/olegsea/flake";
    in
    {
      nixosConfigurations.oleg-desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit nixosConfigDir; };
        modules = [
          # Импортируем основной конфиг хоста
          ./hosts/desktop/configuration.nix

          # Подключаем модули NixOS
          ./modules/core.nix
          ./modules/network.nix
          ./modules/gnome.nix
          ./modules/audio.nix
          ./modules/users.nix

          # Подключаем Home Manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit nixosConfigDir; };
            home-manager.users.olegsea = import ./home-manager/olegsea/home.nix;
          }
        ];
      };
    };
}
