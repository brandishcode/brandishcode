{ config, lib, ... }:

{
  config = {
    programs = {
      foot = lib.mkIf (config.terminal == "foot") {
        enable = true;
        settings = {
          colors = {
            ## Normal/regular colors (color palette 0-7)
            regular0 = "573d26"; # black
            regular1 = "be2d26"; # red
            regular2 = "6ba18a"; # green
            regular3 = "e99d2a"; # yellow
            regular4 = "5a86ad"; # blue
            regular5 = "ac80a6"; # magenta
            regular6 = "74a6ad"; # cyan
            regular7 = "e0dbb7"; # white

            ## Bright colors (color palette 8-15)
            bright0 = "9b6c4a"; # bright black
            bright1 = "e84627"; # bright red
            bright2 = "95d8ba"; # bright green
            bright3 = "d0d150"; # bright yellow
            bright4 = "b8d3ed"; # bright blue
            bright5 = "d19ecb"; # bright magenta
            bright6 = "93cfd7"; # bright cyan
            bright7 = "fff9d5"; # bright white
          };
          mouse = { hide-when-typing = "yes"; };
        };
      };
    };
  };
}
