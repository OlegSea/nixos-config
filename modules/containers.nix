{ pkgs, ... }:

{
  # virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "podman";

  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  hardware.nvidia-container-toolkit.enable = true;

  users.groups.docker.members = [ "olegsea" ];

  environment.systemPackages = with pkgs; [
    distrobox
    podman-compose
    nvidia-container-toolkit
  ];
  environment.etc."distrobox/distrobox.conf".text = ''
    unset LD_LIBRARY_PATH ALSA_PLUGIN_DIR
    container_additional_volumes="/nix/store:/nix/store:ro /etc/profiles/per-user:/etc/profiles/per-user:ro /etc/static/profiles/per-user:/etc/static/profiles/per-user:ro"
  '';

}
