{ lib }:

{
  monitorType = lib.mkOptionType {
    name = "monitor";
    description = ''
      Monitor properties:
      - wallpaper (path to the wallpaper file, jpg, png)
      - position (set with x and y integer attributes)
      - output (DP-1, HDMI-A-1, etc)
    '';
    check =
      x:
      lib.hasAttr "output" x
      && lib.isString x.output
      && lib.hasAttr "wallpaper" x
      && lib.isPath x.wallpaper
      && lib.hasAttr "position" x
      && lib.hasAttr "x" x.position
      && lib.isInt x.position.x
      && lib.hasAttr "y" x.position
      && lib.isInt x.position.y;
  };
}
