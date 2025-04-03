{ lib }:

{
  iconType = lib.mkOptionType {
    name = "icon-type";
    description = ''
      Icon character.
    '';
    check = x: lib.isString x;
  };

  wallpaperType = lib.mkOptionType {
    name = "monitor-wallpaper";
    description = "Path to your wallpaper";
    check = x: lib.isPath x;
  };
}
