{ config, ... }:

let myconfig = { imports = [ ./theme.nix ./desktop ]; };
in { home-manager.users.${config.username} = myconfig; } // myconfig
