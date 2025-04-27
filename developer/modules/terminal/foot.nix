{ config, lib, ... }:

let
in {
  config = {
    programs = {
      foot = lib.mkIf (config.terminal == "foot") {
        enable = true;
        settings = {
          colors = with config.theme.colors; {
            alpha = "0.8";
            background = lib.strings.removePrefix "#" background;
            foreground = lib.strings.removePrefix "#" foreground;

            ## Normal/regular colors (color palette 0-7)
            regular0 = lib.strings.removePrefix "#" black;
            regular1 = lib.strings.removePrefix "#" red;
            regular2 = lib.strings.removePrefix "#" green;
            regular3 = lib.strings.removePrefix "#" yellow;
            regular4 = lib.strings.removePrefix "#" blue;
            regular5 = lib.strings.removePrefix "#" magenta;
            regular6 = lib.strings.removePrefix "#" cyan;
            regular7 = lib.strings.removePrefix "#" white;

            ## Bright colors (color palette 8-15)
            bright0 = lib.strings.removePrefix "#" brightblack;
            bright1 = lib.strings.removePrefix "#" brightred;
            bright2 = lib.strings.removePrefix "#" brightgreen;
            bright3 = lib.strings.removePrefix "#" brightyellow;
            bright4 = lib.strings.removePrefix "#" brightblue;
            bright5 = lib.strings.removePrefix "#" brightmagenta;
            bright6 = lib.strings.removePrefix "#" brightcyan;
            bright7 = lib.strings.removePrefix "#" brightwhite;
          };
          mouse = { hide-when-typing = "yes"; };
        };
      };
    };
  };
}
