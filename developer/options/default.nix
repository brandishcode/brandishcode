{ config, ... }:
let
  imports = [
    ./hardware-options.nix
    ./desktop-environment-options.nix
    ./icon-options.nix
  ];
in {
  inherit imports;
  home-manager.users.${config.username} = { inherit imports; };
}
