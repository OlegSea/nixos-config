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
  networking.nftables.enable = true;

  networking.extraHosts = ''
    10.252.207.6 engine.olegsea.local
    10.252.207.5 engine.olegsea-repl.local
    10.255.4.200 engine.ps.local
  '';

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

  systemd.services.zapret = {
    description = "Zapret DPI Bypass";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.bash}/bin/bash ${nixosConfigDir}/zapret/main_script.sh -nointeractive";
      User = "root";
      Environment = [
        "PATH=${pkgs.git}/bin:${pkgs.nftables}/bin:${pkgs.gnugrep}/bin:${pkgs.gnused}/bin:${pkgs.coreutils}/bin:${pkgs.sudo}/bin"
        "BASE_DIR=${nixosConfigDir}/zapret"
      ];
    };
  };
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
