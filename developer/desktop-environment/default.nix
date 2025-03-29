{ config, lib, ... }:

{
  config = lib.mkIf (config.desktopEnvironment == "sway") {
    security.polkit.enable = true;
    home-manager.users.${config.username} = { imports = [ ./options ./sway ]; };
  };
}
