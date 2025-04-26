{ pkgs, config, ... }:

let
  desktop-environment = (import ./desktop-environment.nix {
    inherit pkgs;
    theme = config.theme;
  });
  myconfig = { imports = [ ./theme.nix desktop-environment ./desktop ]; };
in { home-manager.users.${config.username} = myconfig; } // myconfig
