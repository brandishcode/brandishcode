{ config, ... }:
let
  imports = [
    ./hardware-options.nix
    ./desktop-environment-options.nix
    ./theme-options.nix
  ];
in {
  inherit imports;
  home-manager.users.${config.username} = { inherit imports; };
}
