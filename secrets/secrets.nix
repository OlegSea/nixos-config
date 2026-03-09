# TODO: it's probably a good idea to specify which secrets are available to which systems
let
  keys = {
    desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcP0cc6LcaUhSsZEXfci5sOfs2okARAXLCOi5AhfbPA";
    laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKMpAt9YITv/Ka1LD74Tay21bJBfYTJlKtT9CILCKTyO";
    home-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMjfCU7vCclxsGLXl4Rzguj5IabqKWnRmlfxIT8i49+y";
  };
  secrets = [
    "rclone-pass"
    "copyparty-pass"
    "matrix-registration-token"
  ];

in
builtins.listToAttrs (
  map (secret_name: {
    name = "${secret_name}.age";
    value = {
      publicKeys = builtins.attrValues keys;
    };
  }) secrets
)
