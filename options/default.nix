{ config, ... }:
let
  imports = [
    ./user.nix
    ./hardware-options.nix
    ./desktop-environment-options.nix
    ./theme-options.nix
    ./directory-options.nix
    ./systemd-boot-options.nix
  ];
in
{
  inherit imports;
  home-manager.users.developer = { inherit imports; };
}
