{ pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Nordzy-cyan";
      package = pkgs.nordzy-icon-theme;
    };
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };
    cursorTheme = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 32;
    };
    font = {
      package = pkgs.nerd-fonts.iosevka;
      name = "NerdFonts Iosevka";
      size = 10;
    };
  };
}
