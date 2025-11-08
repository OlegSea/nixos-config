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
  networking.nftables.enable = true;

  # security.pki.certificates =
  #   let
  #     dir = inputs.certificates;
  #     files = builtins.readDir dir;
  #   in
  #   map (name: builtins.readFile (dir + "/${name}")) (
  #     builtins.filter (name: files.${name} == "regular") (builtins.attrNames files)
  #   );

  environment.systemPackages = with pkgs; [
    xray
    nekoray
    sing-box
    qbittorrent
    networkmanagerapplet
    yt-dlp
  ];

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

  programs.nekoray.tunMode.enable = true;
  security.wrappers = {
    nekobox_core = {
      owner = "root";
      group = "root";
      source = "${pkgs.nekoray.nekobox-core}/bin/nekobox_core";
      capabilities = "cap_net_admin=ep";
    };
  };
}
