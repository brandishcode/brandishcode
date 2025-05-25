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
        "${modifier}+Shift+e" =
          "exec foot --app-id foot-ranger -T 'File Explorer' ranger";
        "${modifier}+Shift+b" = "exec firefox --name firefox-surf";
        "${modifier}+Control+Shift+a" = "move workspace to output ${
            (builtins.elemAt config.monitor 0).output
          }";
        "${modifier}+Control+Shift+o" = "move workspace to output ${
            (builtins.elemAt config.monitor 1).output
          }";
        "${modifier}+Control+Shift+e" = "move workspace to output ${
            (builtins.elemAt config.monitor 2).output
          }";
      } // createMoveToWorkspace // createMoveWindowToWorkspace);
    };
  };
}
