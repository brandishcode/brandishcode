{ pkgs }:
let
  inherit ((import ./theme.nix).theme) wallpaper icons;
  inherit (import ./display.nix) monitor;
  sddm-astronaut-custom = pkgs.sddm-astronaut.override {
    themeConfig = {
      Background = "${wallpaper}";
      FormPosition = "left";
    };
  };
in {
  desktopEnvironment = {
    sway = true;
    displayManager = {
      enable = true;
      name = "sddm";
      extraConfig = {
        themePackages = [ sddm-astronaut-custom ];
        themeName = "sddm-astronaut-theme";
        qtPackages = [ pkgs.kdePackages.qtmultimedia ];
      };
    };
    workspaces = [
      {
        label = icons.terminal;
        inherit (builtins.elemAt monitor 0) output;
      }
      {
        label = icons.browser;
        inherit (builtins.elemAt monitor 1) output;
      }
      {
        label = icons.devBrowser;
        inherit (builtins.elemAt monitor 2) output;
      }
    ];
  };
}
