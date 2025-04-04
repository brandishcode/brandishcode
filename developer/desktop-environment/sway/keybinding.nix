{ lib, config, ... }:

let
  modifier = "Mod4"; # Super key
  createMoveToWorkspace = builtins.listToAttrs (builtins.map (x: {
    name = "${modifier}+${builtins.toString x.shortcut}";
    value = "workspace ${x.label}";
  }) config.desktopEnvironment.workspaces);
  createMoveWindowToWorkspace = builtins.listToAttrs (builtins.map (x: {
    name = "${modifier}+Shift+${builtins.toString x.shortcut}";
    value = "move window to workspace ${x.label}";
  }) config.desktopEnvironment.workspaces);
in {
  config = {
    wayland.windowManager.sway.config = {
      inherit modifier;
      keybindings = lib.mkOptionDefault ({
        "${modifier}+Shift+b" = "exec firefox";
      } // createMoveToWorkspace // createMoveWindowToWorkspace);
    };
  };
}
