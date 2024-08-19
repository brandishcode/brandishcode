{ config, ... }:

{
  config = {
    programs.ssh = {
      enable = true;

      matchBlocks = {
        "github.com" = {
          identityFile = "/home/${config.username}/.ssh/github";
        };
      };
    };
  };
}
