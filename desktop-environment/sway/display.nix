{ config, ... }:

let
  # create from monitor
  createOutput = builtins.listToAttrs (builtins.map (x: {
    name = x.output;
    value = {
      position = builtins.toString x.position.x + ","
        + builtins.toString x.position.y;
      bg = "${x.wallpaper} fill";
    };
  }) config.monitor);

  # create from desktopEnvironment.workspaces
  createWorkspaceOutputAssign = builtins.map (x: {
    workspace = x.label;
    inherit (x) output;
  }) config.desktopEnvironment.workspaces;
in {
  config = {
    wayland.windowManager.sway = {
      config = {
        output = createOutput;
        workspaceOutputAssign = createWorkspaceOutputAssign;
      };
    };
  };
}
