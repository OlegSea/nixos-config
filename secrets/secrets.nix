# TODO: it's probably a good idea to specify which secrets are available to which systems
let
  keys = {
    desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJsnIB4KnlunmmtFD1kiYNGJ0yP0SshJKVD7S26mBT0i";
    laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKMpAt9YITv/Ka1LD74Tay21bJBfYTJlKtT9CILCKTyO";
    home-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMjfCU7vCclxsGLXl4Rzguj5IabqKWnRmlfxIT8i49+y";
  };
  secrets = [
    "rclone-pass"
    "copyparty-pass"
    "matrix-registration-token"
    "cert-1"
    "cert-2"
    "cert-3"
    "cert-4"
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
