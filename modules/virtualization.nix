{
  winapps,
  pkgs,
  ...
}:

{
  virtualisation.spiceUSBRedirection.enable = true;
  # users.groups.libvirtd.members = [ "olegsea" ];
  # virtualisation.libvirtd = {
  #   enable = true;
  #   onBoot = "start";
  # };
  # FIX ME: wait for libvirtd to stop being a bitch

  networking = {
    firewall = {
      allowedTCPPortRanges = [
        {
          from = 5900;
          to = 6900;
        }
      ];

      trustedInterfaces = [ "virbr0" ];
    };

    nat = {
      enable = true;
      internalInterfaces = [ "virbr0" ];
    };
  };

  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
    libvirt
    spice
    virtiofsd
    libguestfs
    virt-viewer
    winapps.packages."${system}".winapps
    winapps.packages."${system}".winapps-launcher
  ];
}
