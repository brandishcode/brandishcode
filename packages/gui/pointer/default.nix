{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    name = "Nordzy-cursors-white";
    package = pkgs.nordzy-cursor-theme;
    size = 32;
    gtk.enable = true;
    sway.enable = true;
  };
}
