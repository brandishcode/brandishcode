{ config, ... }:

let myconfig = { imports = [ ./laptop ./theme.nix ]; };
in { home-manager.users.${config.username} = myconfig; } // myconfig
