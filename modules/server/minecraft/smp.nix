{
  pkgs,
  ...
}:
{
  imports = [ ./common.nix ];

  services.minecraft-servers.servers.smp = {
    enable = true;
    package = pkgs.fabricServers.fabric-1_21_11;

    operators = {
      olegsea = "f423d004-b056-4f79-87b3-a0fc33cb9acf";
      bushbush = "7523d0d5-1640-45d1-bc38-12155a8efd30";
    };

    whitelist = {
      aromaxia = "2b180110-2325-489f-922f-b5e9a1fcbfbc";
      Renter512 = "92e653a3ca1e4adc929f3e58a0c48a8c";
      LessiPlay = "57975c41701e46eba4a4a739ab25cdfd";
      nDoom = "70adda3c65b14ae9b5a32c9d8244e0c8";
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
            url = "https://cdn.modrinth.com/data/26FOsJLr/versions/kYuqbqon/Disable%20End-0.7-1.21.11-BETA.jar";
            sha512 = "fc7170a96f720bd69e77c5d440e381f22f8fe5a106e34d39598ddac23503893d83a0bc9d16b1873e236d18e936a7d7303ed28484d59caf517e5e1fea7b7a79ea";
          };

          owo-lib = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/ccKDOlHs/versions/33Ei8Thm/owo-lib-0.13.0%2B1.21.11.jar";
            sha512 = "acdd14f068a1751ec9e9baa4c6febc1a807a522ada80c2d999abf07e4a5693892fc92497f13043fbb7fc6e04c1eb42fb59a364a6ef813302f60833355a489c2e";
          };
          emoji = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/q7vRRpxU/versions/6RHnbOv3/emoji-type-3.0.0-1.21.10-fabric.jar";
            sha512 = "ee26d2592e2f783b98a0faaacc1688ed7268da5c2c70a5c455b8d2dcb1cec4584175c89431440ecb3d785bb53b251585eeddfa5b2bdc42dd6e030662b5cbfdb3";
          };
          lithium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/qvNsoO3l/lithium-fabric-0.21.3%2Bmc1.21.11.jar";
            sha512 = "2883739303f0bb602d3797cc601ed86ce6833e5ec313ddce675f3d6af3ee6a40b9b0a06dafe39d308d919669325e95c0aafd08d78c97acd976efde899c7810fd";
          };
          krypton = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/O9LmWYR7/krypton-0.2.10.jar";
            sha512 = "4dcd7228d1890ddfc78c99ff284b45f9cf40aae77ef6359308e26d06fa0d938365255696af4cc12d524c46c4886cdcd19268c165a2bf0a2835202fe857da5cab";
          };
          c2me = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/VSNURh3q/versions/vsiqVtu6/c2me-fabric-mc1.21.11-0.3.7%2Balpha.0.9.jar";
            sha512 = "b2f92ef8a6dc7473305211c43dd54d509cb8a0dc2bbbd89e9267efb35b0a9871d0bb1a9b3c3e5c349bafa1a60567915e19f50d2b58bb90608556f93b290d72f6";
          };
          sit = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/EsYqsGV4/versions/xy4C23w4/sit%21-1.2.5.2%2B1.21.11.jar";
            sha512 = "2c53a85dcaf9db9866e99e06bec8b0f678b47ab2dc055ea02dd1aac14edd870043ade70e90e6628304f451d97f0c7aeee124863d5bef3d5678999d315ed678c5";
          };
          fabric-api = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/i5tSkVBH/fabric-api-0.141.3%2B1.21.11.jar";
            sha512 = "c20c017e23d6d2774690d0dd774cec84c16bfac5461da2d9345a1cd95eee495b1954333c421e3d1c66186284d24a433f6b0cced8021f62e0bfa617d2384d0471";
          };
          cloth-config = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/9s6osm5g/versions/xuX40TN5/cloth-config-21.11.153-fabric.jar";
            sha512 = "8f455489d4b71069e998568cf4e1450116f4360a4eb481cd89117f629c6883164886cf63ca08ac4fc929dd13d1112152755a6216d4a1498ee6406ef102093e51";
          };
          otter-lib = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/zVVpzurY/versions/97STrMee/otterlib-0.2.2.1%2B1.21.11-fabric.jar";
            sha512 = "3f62f95d620f5e5a476120b97232847607edb2e2559e0ef282650ce033e4d778a586539614fc3222975999b380f1c1d782813bb190a2677c7ab1f828ce575aac";
          };
          armor-stands = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/PFwYNrHb/versions/pqoCZONH/ArmorPoser-fabric-1.21.11-13.2.0.jar";
            sha512 = "7d83b60cde24e5ffd00f14a3adc333cdbdedc2cdebff9249de1ca33bc190479b1b5adb8d0c9903bf32bb5938608d8ab0121edbfca0f6eb77380b72729b7f59fc";
          };
          carpet = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/TQTTVgYE/versions/HzPcczDK/fabric-carpet-1.21.11-1.4.194%2Bv251223.jar";
            sha512 = "1135807e44b34a628c89674a4df94d617120aea932c24c7d4a375410103884e94713b4252d29035d1722d149cc65465afef24eafbfc476c51bc64b6fffff57e0";
          };
          servux = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/zQhsx8KF/versions/wdbe92T5/servux-fabric-1.21.11-0.9.2.jar";
            sha512 = "0f5efd7707007aa7ecb502e7140baff78919b3c37bb85cb8fd9673442d0446e88e36bc151ecaccf0ef223aca957dbcfb0ef0454d3733ed05349fd562014df544";
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
