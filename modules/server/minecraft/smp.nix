{
  pkgs,
  ...
}:
{
  imports = [ ./common.nix ];

  services.minecraft-servers.servers.smp = {
    enable = true;
    package = pkgs.fabricServers.fabric-26_1_2.override { jre_headless = pkgs.openjdk25_headless; };

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
        with builtins;
        attrValues {
          a = fetchurl {
            url = "https://cdn.modrinth.com/data/VSNURh3q/versions/1qBYfTmr/c2me-fabric-mc26.1.2-0.4.0-alpha.0.28.jar";
            sha512 = "e5a0da868e28a808398bfd62c30ac1fa289ddce59aaeac08bfc3ef88620f78d21269a216344db71d787fd995aad2c58df553e9c16ccf608fb3e843bd43810afe";
          };
          b = fetchurl {
            url = "https://cdn.modrinth.com/data/EsYqsGV4/versions/s1ghgeMQ/sit%21-1.2.6.2%2B26.1.jar";
            sha512 = "91004b5817c153d5324e1692aff7a72c1d3af8a4770ff3f9baad0143099b22b4dcd877f4ab331a3c3038522e8ffe678642cdd4054f9faeb99b8314d0115e8e2f";
          };
          c = fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/1F9Sl2ke/fabric-api-0.154.0%2B26.1.2.jar";
            sha512 = "0f5885ca80716dee547e8e8ec6c2eda137b5591d40d8fb424d9d1d99a3e5c7a6d861ef11590903f9fa18838806de8876e51285c5d830cfa50f518c0217139e78";
          };
          d = fetchurl {
            url = "https://cdn.modrinth.com/data/9s6osm5g/versions/GFM8zh9J/cloth-config-26.1.154.jar";
            sha512 = "8bfb75f2cac0a9910316c6a368a228c0f8f1261ac6f03dec5fba594e1619ac04334a3df4fb29778d61d0b8290d55949371a523d722b35501bf9a2902956d3b17";
          };
          e = fetchurl {
            url = "https://cdn.modrinth.com/data/zVVpzurY/versions/VrPGp6VK/otterlib-0.3.0.1%2B26.1-fabric.jar";
            sha512 = "608d5774cee8b57b8fe21e2beaddf8d09e175f6526d06418aace3903a8c7428b3305c03caec2b123579fb343d2652619e000727c5e686299c54022aeaa96ea0c";
          };
          f = fetchurl {
            url = "https://cdn.modrinth.com/data/FlC9CXUY/versions/ctFnRns4/armorstands-fabric-3.0.4%2B26.1.jar";
            sha512 = "dd138a0fbaf31a35ef9aac9c7b27d459588ed5661b2bcfe94eeee0689e73cf40b814379eb5aa06a4ff6a12eeb2fd9683f08632277c4fb38b5dfdae20ea32b1e2";
          };
          g = fetchurl {
            url = "https://cdn.modrinth.com/data/TQTTVgYE/versions/ygtmLbO3/fabric-carpet-26.1%2Bv260402.jar";
            sha512 = "d98b02eb2bd2c7594aac3913c7ddfc8ef6ff724a6b1e86098611e09c303134626eb76e1c9fe910101c6972c8fe0993fb0b21ea99c7affc0e33a0ac64f941954b";
          };
          h = fetchurl {
            url = "https://cdn.modrinth.com/data/zQhsx8KF/versions/uS1xht5s/servux-fabric-26.1.2-0.10.3.jar";
            sha512 = "a54927750f83156ce76b009cdb9bf564e0894157d46eaf485947438aa3b5a6bfbc64cf2289b28c1ded7417363c95273fbacda493ef01677e7f780dc2d419a63a";
          };
          i = fetchurl {
            url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/rzrH7czY/lithium-fabric-0.24.4%2Bmc26.1.2.jar";
            sha512 = "5d439660968bc06deea62a3b76ce46efa6907c460602d6e6d70fd5078a22f41acbca5d1177ee8f73a354a59ca3981f33ee20dafddffbf41ff0b4bfbfc657b6ca";
          };
          j = fetchurl {
            url = "https://cdn.modrinth.com/data/uXXizFIs/versions/d5ddUdiB/ferritecore-9.0.0-fabric.jar";
            sha512 = "d81fa97e11784c19d42f89c2f433831d007603dd7193cee45fa177e4a6a9c52b384b198586e04a0f7f63cd996fed713322578bde9a8db57e1188854ae5cbe584";
          };
          k = fetchurl {
            url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/kYAGItyj/krypton-0.3.0.jar";
            sha512 = "14233210283a76f3cf435a3b8ddbcbd65a858d2b1a10b88ff643c0a01486dfd2bf1843bd3456cd4fb86cbb3b06f2dea0c4e663b1976a48e96de16d3b5a707ec9";
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
