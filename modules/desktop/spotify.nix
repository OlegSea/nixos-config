{ spicetify-nix, ... }:
{
  hm = {
    imports = [ spicetify-nix.homeManagerModules.default ];
    programs.spicetify.enable = true;
  };
}
