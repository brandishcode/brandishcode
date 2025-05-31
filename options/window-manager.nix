{ lib, ... }:

{
  options = {
    windowManager.sway = {
      enable = lib.mkEnableOption "Personal Sway window manager";

    };
  };
}
