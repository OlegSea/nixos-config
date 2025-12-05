{
  pkgs,
  ...
}:

{
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
      Renter512 = "92e653a3ca1e4adc929f3e58a0c48a8c";
      LessiPlay = "57975c41701e46eba4a4a739ab25cdfd";
      doomNL = "70adda3c65b14ae9b5a32c9d8244e0c8";
      lasl = "53ff5fbc33614b4e9b7c8ea41e90e49f";
      kricostro = "77767908994d4f41a28652686cbd5c9b";
      whoatethefruit = "45a959153f68471d8436ffb512c17810";
      ifen7 = "c4dd4a066f3a4324bd45a4fcea18f7c8";
      TurtleTortois = "ea7603266b04417191652a028986c5e0";
      koivas = "fc68532bca8349d58fe43b1cd974a4ad";
      whodaddy = "230ab83784d546f4a374f1c7b18e65f7";
    };

    serverProperties = {
      motd = "Candycane kingdom!";
      allow-flight = true;
      view-distance = 12;
      white-list = true;
      difficulty = "hard";
      server-port = 25500;
      level-seed = 8883383888011263481;
      initial-enabled-packs = "vanilla,afk-display,anti-enderman-grief,armor-statuses,multiplayer-sleep,player-head-drops,wandering-traders";
    };

    symlinks = {
      mods = pkgs.linkFarmFromDrvs "mods" (
        builtins.attrValues {
          disable-end = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/26FOsJLr/versions/M9RRh6lk/noend-0.5-1.21.10-BETA.jar";
            sha512 = "9cefcc830d8ab6c2e8c28d4c26b7a7c97c1bd8ee27ca409f8c684b992408b6d52c2a7d22e452277dc76ff05c632112dc0eaf5df7df74a460b6533b5aba884ad9";
          };
          owo-lib = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/ccKDOlHs/versions/dZPuIa4j/owo-lib-0.12.24%2B1.21.9.jar";
            sha512 = "2313b8bfb79a098e5bbb6642eed4f76feb464dd65b320668f9146588973f3f236e9644fb77dd3b4a8e2057fd63037dcc1d969da7944b8388e69321e9a1f2b21d";
          };
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
            url = "https://cdn.modrinth.com/data/EsYqsGV4/versions/wOMpgPKm/sit%21-1.2.5.1%2B1.21.9-1.21.10.jar";
            sha512 = "85cc5c0881aaf803a2df9ea89e05602b2bac4bd1871c7c04eddb5b6e1afd5c8c12ecac3d55aec236f280a1f34af69efded8596365cbb34ca55a3eaeab8d57741";
          };
          fabric-api = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/dQ3p80zK/fabric-api-0.138.3%2B1.21.10.jar";
            sha512 = "dc73a3653c299476d1f70cb692c4e35ac3f694b3b0873e3d0b729e952e992b878d1a8e0b1d1049a442a0d483d3068073194f15af52ea9938544616e20433cc38";
          };
          cloth-config = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/9s6osm5g/versions/qMxkrrmq/cloth-config-20.0.149-fabric.jar";
            sha512 = "df1d9e0349dc64fc0859f17b65b67b0d7745a26b4905e87fc148ddebc0285de51a3255848599f0d5ee24f6aab00fbac4849d40bb9052936eaa452d216c7ada62";
          };
          otter-lib = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/zVVpzurY/versions/zlJvj7Xn/otterlib-0.2.2.1%2B1.21.10-fabric.jar";
            sha512 = "d421fbd9c3fa10dc4afcd54687dfb1099e735a695015716356ed7a554c98a519cb94a6a22a28195c5ce4ffded3d415423659abd82368dacf0cbbf8df817c87ed";
          };
        }
      );
    };

    files = {
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
    };
  };
}
