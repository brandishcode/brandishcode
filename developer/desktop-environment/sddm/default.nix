{ pkgs, ... }:

{
  # SDDM ,and DesktopManager setup
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  services = {
    displayManager = {
      defaultSession = "sway";
      sessionPackages = with pkgs; [ sway ];
      sddm = {
        theme = "sddm-astronaut-theme";
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [ sddm-astronaut ];
      };
    };
  };
  environment.systemPackages = with pkgs;
    [ (sddm-astronaut.override { embeddedTheme = "japanese_aesthetic"; }) ];
}
