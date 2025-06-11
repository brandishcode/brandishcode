{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk";
    style.package = pkgs.tokyonight-gtk-theme;
  };
}
