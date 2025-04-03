{
  monitorToSwayOutput = x1:
    builtins.listToAttrs (builtins.map (x2: {
      name = x2.output;
      value = {
        position = builtins.toString x2.position.x + ","
          + builtins.toString x2.position.y;
        bg = "${x2.wallpaper} fill";
      };
    }) x1);
  desktopEnvironmentWorkspacesToSwayOutputAssign = x1:
    builtins.map (x2: {
      workspace = x2.label;
      inherit (x2) output;
    }) x1;
}
