{ pkgs, config, ... }:

let
  desktop-environment = (
    import ./desktop-environment.nix {
      inherit pkgs;
      theme = config.theme;
    }
  );
  myconfig = {
    imports = [
      ./theme.nix
      desktop-environment
      ./laptop
    ];
  };
in
{ home-manager.users.developer = myconfig; } // myconfig
