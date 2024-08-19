{ config, lib, ... }:

{
  config = {
    programs = {
      foot = lib.mkIf (config.terminal == "foot") {
        enable = true;
        settings = {
          colors = {
            background = lib.strings.removePrefix "#" config.color.background;
            foreground = lib.strings.removePrefix "#" config.color.foreground;

            ## Normal/regular colors (color palette 0-7)
            regular0 = lib.strings.removePrefix "#" config.color.black;
            regular1 = lib.strings.removePrefix "#" config.color.red;
            regular2 = lib.strings.removePrefix "#" config.color.green;
            regular3 = lib.strings.removePrefix "#" config.color.yellow;
            regular4 = lib.strings.removePrefix "#" config.color.blue;
            regular5 = lib.strings.removePrefix "#" config.color.magenta;
            regular6 = lib.strings.removePrefix "#" config.color.cyan;
            regular7 = lib.strings.removePrefix "#" config.color.white;

            ## Bright colors (color palette 8-15)
            bright0 = lib.strings.removePrefix "#" config.color.brightblack;
            bright1 = lib.strings.removePrefix "#" config.color.brightred;
            bright2 = lib.strings.removePrefix "#" config.color.brightgreen;
            bright3 = lib.strings.removePrefix "#" config.color.brightyellow;
            bright4 = lib.strings.removePrefix "#" config.color.brightblue;
            bright5 = lib.strings.removePrefix "#" config.color.brightmagenta;
            bright6 = lib.strings.removePrefix "#" config.color.brightcyan;
            bright7 = lib.strings.removePrefix "#" config.color.brightwhite;
          };
          mouse = { hide-when-typing = "yes"; };
        };
      };
    };
  };
}
