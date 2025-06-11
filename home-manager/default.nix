{ pkgs, config, ... }:

{
  config = {
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

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "gtk";
      style.package = pkgs.tokyonight-gtk-theme;
    };
    home = {
      sessionVariables = {
        EDITOR = "nvim";
      };

      shellAliases = {
        hms = ''
          home-manager switch -b backup --flake "path:$(readlink -f /home/${config.user.username}/${config.configpath}/#${config.user.username})"
        '';
      };

      pointerCursor = {
        enable = true;
        name = "Nordzy-cursors-white";
        package = pkgs.nordzy-cursor-theme;
        size = 32;
        gtk.enable = true;
        sway.enable = true;
      };

      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        nerd-fonts.iosevka
        dconf
      ];
    };

    programs = {
      home-manager.enable = true;
      direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
      bash.enable = true;
    };
  };

  imports = [
    ../packages
  ];
}
