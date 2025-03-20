{ pkgs, config, ... }:

{
  config = {
    home = {
      sessionVariables = { EDITOR = "nvim"; };

      shellAliases = {
        hms = ''
          home-manager switch -b backup --flake "path:$(readlink -f /home/${config.username}/${config.configpath}/#developer)"
        '';
      };

      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        nerd-fonts.droid-sans-mono
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
    ../modules/tmux
    ../modules/git
    ../modules/firefox
    ../modules/ssh
    ../modules/terminal
    ../modules/ncmpcpp
    ../modules/rofi
    ../modules/chromium
  ];
}

