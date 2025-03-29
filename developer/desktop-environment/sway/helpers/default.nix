{
  convertToSwayOutput = x1:
    builtins.listToAttrs (builtins.map (x2: {
      name = x2.output;
      value = {
        position = builtins.toString x2.position.x + ","
          + builtins.toString x2.position.y;
        bg = "${x2.wallpaper} fill";
      };
    }) x1);
}
