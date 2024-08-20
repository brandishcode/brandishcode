{ pkgs, config, ... }:

{
  config = {
    home = {
      username = "developer";
      homeDirectory = "/home/developer";

      stateVersion = "24.05";

      sessionVariables = { EDITOR = "nvim"; };

      shellAliases = {
        hms = ''
          home-manager switch -b backup --flake "path:$(readlink -f /home/${config.username}/${config.configpath}/#developer)"
        '';
      };

      packages = with pkgs; [ noto-fonts noto-fonts-cjk noto-fonts-emoji ];
    };

    programs = { home-manager.enable = true; };
  };

  imports = [
    ../modules/tmux
    ../modules/git
    ../modules/firefox
    ../modules/sway
    ../modules/ssh
    ../modules/terminal
  ];
}

