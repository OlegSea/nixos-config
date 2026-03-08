{
  lib,
  inputs,
  flakeDir,
  ...
}:
let
  mkSystem =
    name:
    { system }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./${name}

        inputs.agenix.nixosModules.default
        {
          age.secrets =
            let
              readDir = dir: builtins.attrNames (builtins.readDir dir);
              files = readDir ../secrets ++ readDir ../secrets/certificates;
              secrets = builtins.filter (f: lib.hasSuffix ".age" f) files;
            in
            builtins.listToAttrs (
              map (name: {
                name = lib.removeSuffix ".age" name;
                value = {
                  file = ../secrets/${name};
                };
              }) secrets
            );
        }

        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          hm.programs.home-manager.enable = true;
          hm.home.stateVersion = "25.05";
        }
        (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "olegsea" ])

        inputs.stylix.nixosModules.stylix

        { networking.hostName = name; }
      ];

      specialArgs = inputs // {
        inherit flakeDir;
      };

    };
in
{
  nixosConfigurations = lib.mapAttrs mkSystem {
    oleg-desktop = {
      system = "x86_64-linux";
    };
    oleg-laptop = {
      system = "x86_64-linux";
    };
    oleg-home-server = {
      system = "x86_64-linux";
    };
  };
}
