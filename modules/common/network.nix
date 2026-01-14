{
  inputs,
  nixosConfigDir,
  pkgs,
  ...
}:

{
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };
  networking.firewall.enable = true;

  networking.extraHosts = ''
    10.252.207.6 engine.olegsea.local
    10.252.207.5 engine.olegsea-repl.local
    10.255.4.200 engine.ps.local
    172.25.1.100 repo-zvirt.orionsoft.ru
  '';

  imports = [
    inputs.zapret-discord-youtube.nixosModules.default
    {
      services.zapret-discord-youtube = {
        enable = true;
        config = "general (SIMPLE FAKE)";
      };
    }
  ];

  networking.firewall.trustedInterfaces = [ "tun" ];

  security.pki.certificates =
    let
      dir = ../../resources/certificates;
      files = builtins.readDir dir;
    in
    map (name: builtins.readFile (dir + "/${name}")) (
      builtins.filter (name: files.${name} == "regular") (builtins.attrNames files)
    );

  environment.systemPackages = with pkgs; [
    xray
    sing-box
    networkmanagerapplet
    throne
  ];

  # Если хочется перманентный впн - раскоментировать
  # services.sing-box = {
  #   enable = true;
  #   settings = builtins.fromJSON (builtins.readFile ../../resources/vpn/box.json);
  # };

  programs.throne.tunMode.enable = true;
  services.resolved.enable = true;

  security.wrappers = {
    xray = {
      owner = "root";
      group = "root";
      source = "${pkgs.xray}/bin/xray";
      capabilities = "cap_net_admin=ep";
    };

    sing-box = {
      owner = "root";
      group = "root";
      source = "${pkgs.sing-box}/bin/sing-box";
      capabilities = "cap_net_admin=ep";
    };

    throne-core = {
      owner = "root";
      group = "root";
      source = "${pkgs.throne.core}/bin/Core";
      capabilities = "cap_net_admin=ep";
    };
  };
}
