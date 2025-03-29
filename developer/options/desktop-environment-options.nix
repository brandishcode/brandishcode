{ lib, ... }: {
  options = {
    desktopEnvironment = { sway = lib.mkEnableOption "Sway window manager"; };
  };
}
