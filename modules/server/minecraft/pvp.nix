{
  pkgs,
  ...
}:

{
  services.minecraft-servers.servers.pvp = {
    enable = true;
    package = pkgs.paperServers.paper-1_21_4;
    operators = {
      olegsea = "f423d004-b056-4f79-87b3-a0fc33cb9acf";
    };
    serverProperties = {
      motd = "OlegSea's PVP server";
      allow-flight = true;
      view-distance = 12;
    };
  };
}
