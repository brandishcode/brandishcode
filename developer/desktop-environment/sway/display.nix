{ config, myLib, ... }:

{
  config = {
    wayland.windowManager.sway = {
      config = {
        output = myLib.monitorToSwayOutput config.monitor;
        workspaceOutputAssign =
          myLib.desktopEnvironmentWorkspacesToSwayOutputAssign
          config.desktopEnvironment.workspaces;
      };
    };
  };
}
