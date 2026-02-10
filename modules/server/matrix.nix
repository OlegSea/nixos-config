{ inputs, pkgs, ... }:

{
  services.matrix-continuwuity = {
    enable = true;
    settings = {
      global = {
        server_name = "matrix.olegsea.ru";
        # Listening on localhost by default
        # address and port are handled automatically
        allow_registration = true;
        allow_encryption = true;
        allow_federation = true;
        trusted_servers = [ "matrix.org" ];
      };
    };
  };
}
