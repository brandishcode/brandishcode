{ lib, ... }:

{
  options = {
    gpu = lib.mkOption {
      default = "amd";
      type = lib.types.str;
      description = ''
        Graphic card used
      '';
    };

    configpath = lib.mkOption {
      default = "nixos-configuration";
      type = lib.types.str;
      description = ''
        NixOS configuration path. Value should be relative to the home folder.
      '';
    };

    username = lib.mkOption {
      default = "developer";
      type = lib.types.str;
      description = ''
        Distro username
      '';
    };

    hostname = lib.mkOption {
      default = "nixos";
      type = lib.types.str;
      description = ''
        Nixos hostname
      '';
    };

    nonnixos = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Only for non-nixos distro
      '';
    };

    terminal = lib.mkOption {
      default = "foot";
      type = lib.types.str;
      description = ''
        Terminal
      '';
    };

    git = lib.mkOption {
      default = {
        username = "brandishcode";
        useremail = "";
        token = "";
      };
      description = ''
        Git options
      '';
    };

    color = lib.mkOption {
      # Tokyo night as default
      default = {
        background = "#1a1b26";
        foreground = "#c0caf5";
        black = "#414868";
        red = "#f7768e";
        green = "#9ece6a";
        yellow = "#e0af68";
        blue = "#7aa2f7";
        magenta = "#bb9af7";
        cyan = "#7dcfff";
        white = "#a9b1d6";
        brightblack = "#414868";
        brightred = "#f7768e";
        brightgreen = "#9ece6a";
        brightyellow = "#e0af68";
        brightblue = "#7aa2f7";
        brightmagenta = "#bb9af7";
        brightcyan = "#7dcfff";
        brightwhite = "#c0caf5";
      };
      description = ''
        Color theme
      '';
    };
  };
}
