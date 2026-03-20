{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    eden
  ];
}
