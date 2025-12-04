{
  pkgs,
  ...
}:

{
  networking.firewall.allowedTCPPorts = [
    25500
  ];

  networking.firewall.allowedUDPPorts = [
    25500
  ];
  services.minecraft-servers.servers.smp = {
    enable = true;
    package = pkgs.fabricServers.fabric-1_21_10;

    operators = {
      olegsea = "f423d004-b056-4f79-87b3-a0fc33cb9acf";
      bushbush = "7523d0d5-1640-45d1-bc38-12155a8efd30";
    };

    whitelist = {
      olegsea = "f423d004-b056-4f79-87b3-a0fc33cb9acf";
      bushbush = "7523d0d5-1640-45d1-bc38-12155a8efd30";
      lessiplay = "57975c41-701e-46eb-a4a4-a739ab25cdfd";
    };

    serverProperties = {
      motd = "Candycane kingdom!";
      allow-flight = true;
      view-distance = 16;
      white-list = true;
      server-port = 25500;
      initial-enabled-packs = "vanilla,afk-display,anti-enderman-grief,armor-statuses,multiplayer-sleep,player-head-drops,wandering-traders";
    };

    symlinks = {
      "world/datapacks/afk-display.zip" = ../../../resources/minecraft/datapacks/afk-display.zip;
      "world/datapacks/anti-enderman-grief.zip" =
        ../../../resources/minecraft/datapacks/anti-enderman-grief.zip;
      "world/datapacks/armor-statuses.zip" = ../../../resources/minecraft/datapacks/armor-statuses.zip;
      "world/datapacks/multiplayer-sleep.zip" =
        ../../../resources/minecraft/datapacks/multiplayer-sleep.zip;
      "world/datapacks/player-head-drops.zip" =
        ../../../resources/minecraft/datapacks/player-head-drops.zip;
      "world/datapacks/silence-mobs.zip" = ../../../resources/minecraft/datapacks/silence-mobs.zip;
      "world/datapacks/track-raw-statistics.zip" =
        ../../../resources/minecraft/datapacks/track-raw-statistics.zip;
      "world/datapacks/wandering-traders.zip" =
        ../../../resources/minecraft/datapacks/wandering-traders.zip;

      mods = pkgs.linkFarmFromDrvs "mods" (
        builtins.attrValues {
          emoji = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/q7vRRpxU/versions/nR4TD20V/emoji-type-2.3.3-1.21.10-fabric.jar";
            sha512 = "014c9e232c77ddd7f196273950bd8e62cd1a45206c67af418024e0fa57b958902a08ac9e811291db939a3f91d13e21c0c0cfa8aca3d73db98bf5dfd82e935ce9";
          };
          lithium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/NsswKiwi/lithium-fabric-0.20.1%2Bmc1.21.10.jar";
            sha512 = "79b2892d123f3bb12649927dd8fccc25c955ff38a19f3aba7cd0180c4cf5506c2a76d49418b13050f90bba7bb59f3623af06e8a275e2ae8c63808084043902bb";
          };
          krypton = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/O9LmWYR7/krypton-0.2.10.jar";
            sha512 = "4dcd7228d1890ddfc78c99ff284b45f9cf40aae77ef6359308e26d06fa0d938365255696af4cc12d524c46c4886cdcd19268c165a2bf0a2835202fe857da5cab";
          };
          c2me = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/VSNURh3q/versions/uNick7oj/c2me-fabric-mc1.21.10-0.3.5.1.0.jar";
            sha512 = "4d079c872ab910fd65a6c9e8709c7050178626f7125c849389ca38388e19995bd874e071e86e6acf6fbefaa2f294fdbebecb9af8444a908b9a3de894d807c4db";
          };
          sit = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/VKXzIykF/versions/bWn9qA6T/sit-1.21.10-29.jar";
            sha512 = "b07a645287f9ab40ca37f151f9124ecc2359914badce7c666ec24942be71e030d2746b3ea46b7f49234c065b337c9b6ddd8e6f9ddfe7ec75a5ae49571f9dc644";
          };
          fabric-api = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/dQ3p80zK/fabric-api-0.138.3%2B1.21.10.jar";
            sha512 = "dc73a3653c299476d1f70cb692c4e35ac3f694b3b0873e3d0b729e952e992b878d1a8e0b1d1049a442a0d483d3068073194f15af52ea9938544616e20433cc38";
          };
          cloth-config = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/9s6osm5g/versions/qMxkrrmq/cloth-config-20.0.149-fabric.jar";
            sha512 = "df1d9e0349dc64fc0859f17b65b67b0d7745a26b4905e87fc148ddebc0285de51a3255848599f0d5ee24f6aab00fbac4849d40bb9052936eaa452d216c7ada62";
          };
        }
      );
    };
  };
}
