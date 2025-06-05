{
  pkgs,
  config,
  lib,
  ...
}:

{
  config = {
    # SDDM ,and DesktopManager setup
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    services.displayManager = lib.mkIf config.desktopEnvironment.displayManager.enable (
      lib.mkMerge [
        (lib.mkIf config.desktopEnvironment.sway {
          defaultSession = "sway";
          sessionPackages = [ pkgs.sway ];
        })
        (
          with config.desktopEnvironment;
          lib.mkIf (displayManager.name == "sddm") {
            sddm = {
              theme = displayManager.extraConfig.themeName;
              enable = true;
              wayland.enable = true;
              package = pkgs.kdePackages.sddm;
              extraPackages = displayManager.extraConfig.qtPackages;
            };
          }
        )
      ]
    );
    environment.systemPackages =
      with config.desktopEnvironment;
      lib.mkIf (
        displayManager.name == "sddm" && (lib.hasAttr "extraConfig" displayManager)
      ) displayManager.extraConfig.themePackages;
  };
}
