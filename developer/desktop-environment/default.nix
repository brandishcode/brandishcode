{ config, lib, ... }:

{
  config = lib.mkIf (config.desktopEnvironment.enable) (lib.mkMerge [
    (lib.mkIf (config.desktopEnvironment.app == "sway") {
      security.polkit.enable = true;
      home-manager.users.${config.username} = { imports = [ ./sway ]; };
    })
  ]);
}
