{ config, ... }:

{
  config = {
    home = {
      sessionVariables = {
        EDITOR = "nvim";
      };

      shellAliases = {
        hms = ''
          home-manager switch -b backup --flake "path:$(readlink -f /home/${config.user.username}/${config.configpath}/#${config.user.username})"
        '';
      };
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
