{ config, pkgs, ... }:

{
    networking.networkmanager.enable = true;
    networking.nftables.enable = true;
    systemd.services.zapret = {
    description = "Zapret DPI Bypass";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.bash}/bin/bash /opt/zapret/main_script.sh -nointeractive";
        User = "root";
        Environment = [
        "PATH=${pkgs.git}/bin:${pkgs.nftables}/bin:${pkgs.gnugrep}/bin:${pkgs.gnused}/bin:${pkgs.coreutils}/bin:${pkgs.sudo}/bin"
        "BASE_DIR=/opt/zapret/"
        "CONF_FILE=/opt/zapret/conf.env"
        "NFQWS_PATH=/opt/zapret/nfqws"
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
