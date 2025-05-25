{ config, ... }:

{
  config = {
    programs.ssh = {
      enable = true;

      matchBlocks = {
        "github.com" = {
          identityFile = "/home/${config.user.username}/.ssh/github";
        };
      };
    };
  };
}
