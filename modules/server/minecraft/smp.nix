{
  pkgs,
  ...
}:
{
  imports = [ ./common.nix ];

  services.minecraft-servers.servers.smp = {
    enable = true;
    package = pkgs.fabricServers.fabric-26_2;

    operators = {
      olegsea = "f423d004-b056-4f79-87b3-a0fc33cb9acf";
      bushbush = "7523d0d5-1640-45d1-bc38-12155a8efd30";
    };

    whitelist = {
      aromaxia = "2b180110-2325-489f-922f-b5e9a1fcbfbc";
      renter512 = "92e653a3-ca1e-4adc-929f-3e58a0c48a8c";
      ndoom = "70adda3c-65b1-4ae9-b5a3-2c9d8244e0c8";
      whodaddy = "230ab837-84d5-46f4-a374-f1c7b18e65f7";
      lessiplay = "57975c41-701e-46eb-a4a4-a739ab25cdfd";
      softi = "cd2780d0-252d-47e9-836a-37cf1eed2bb2";
      lasl = "53ff5fbc-3361-4b4e-9b7c-8ea41e90e49f";
      styl102 = "550766e8-1ee2-4ab8-9512-abf14911c199";
      kricostro = "77767908-994d-4f41-a286-52686cbd5c9b";
      whoatethefruit = "45a95915-3f68-471d-8436-ffb512c17810";
      turtletortois = "ea760326-6b04-4171-9165-2a028986c5e0";
      ifen7 = "c4dd4a06-6f3a-4324-bd45-a4fcea18f7c8";
      koivas = "fc68532b-ca83-49d5-8fe4-3b1cd974a4ad";
      speed_addict = "a48f177d-1cb1-4a0a-ae27-dec0371c5585";
      bunnymonsterrrr = "68cbce28-e525-42b4-afa3-aa3216e46e15";
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
          c2me = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/VSNURh3q/versions/nvOkOiyi/c2me-fabric-mc26.2-0.4.2-alpha.0.9.jar";
            sha512 = "31e6ff1f07872e9cdd4532919610df4b53fa2900f41b45df73ebc7ede8fff9379ee9ae3f57d63dba7303d176676d59ac588bbc2adedd317af79fa6a01ad84490";
          };
          sit = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/EsYqsGV4/versions/yymwWm0P/sit%21-1.2.6.3%2B26.2.jar";
            sha512 = "d6d1310de1f77601e45bbb25c5f5a8194053b3dc31b6c70f4f162c598354b1913bc6e07996e6cbf37a6673097444ce845403e52dd850437414d4d4c838f36e79";
          };
          fabric-api = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/Cpy2Px2f/fabric-api-0.154.0%2B26.2.jar";
            sha512 = "fcdb09692eec3047a9091d942dae08c234fd2c4577d94bfb4f9f5309a5201ff3b247b4f27eeaf3f6bab71a34e5ca82753b3dbf6deeb86ac45fe5429e74892dcf";
          };
          cloth-config = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/9s6osm5g/versions/Nv3xnWXd/cloth-config-26.2.155.jar";
            sha512 = "37b1e402f0df5a383656e21a38ee18cdd15cb4ba3fb62fbeba82ef4b959a4479fc32718ac0d9d154a7d9104c5f7315bfa67dbeced0b8ff240b8039d4848d5df1";
          };
          otter-lib = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/zVVpzurY/versions/3UwHuXqT/paper-0.4.0.0%2B26.2-paper-all.jar";
            sha512 = "e8e1da51b5984de5657dfe173c93586c94772383d842bf315fc3119b0005c11b52b84c2a34a519cc709dde567f92add750c3b497b482b47c80a95d047a4ac9c3";
          };
          armor-stands = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/FlC9CXUY/versions/lV6sGGrC/armorstands-fabric-3.0.4%2B26.2.jar";
            sha512 = "1c3569c37cfc7fd8a60475372cbbeb6c7e932e29999f11c23cfed95b5aa22d1fdafc4fafe2eca16428dee35b43fcc2f3c9c1d8f4885f390fd0fe63f0463adecb";
          };
          carpet = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/TQTTVgYE/versions/bGrLxJ8v/fabric-carpet-26.2%2Bv260616.jar";
            sha512 = "8b8fac6979bd3153f5cfb4faa6bab52e1357eab814492a6658f3c0e1ac2856ad37a626c0a03a0839c39abb7bf56661f77b09d05d10ac01173bcdd373a33c6265";
          };
          servux = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/zQhsx8KF/versions/LJbDtH2B/servux-fabric-26.2-0.11.1.jar";
            sha512 = "6ccc5cea50f062f283665c26101508364f66175221cee18259f044dcd42722d5332f8490f1a1c8b1c49990b013667d297de3ef31be56bee7e650d90073924017";
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
