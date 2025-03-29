{ config, ... }:

let myconfig = { imports = [ ]; };
in { home-manager.users.${config.username} = myconfig; } // myconfig
