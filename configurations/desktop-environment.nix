{ pkgs, theme }:
let
  inherit (theme) wallpaper;
  sddm-astronaut-custom = pkgs.sddm-astronaut.override {
    themeConfig = {
      Background = "${wallpaper}";
      FormPosition = "left";
    };
  };
in
{
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
  };
}
