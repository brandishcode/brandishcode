{ config, ... }:

{
  config = {
    programs.ssh = {
      enable = true;

      matchBlocks = {
        "github.com" = {
          identityFile = "/home/developer/.ssh/github";
        };
      };
    };
  };
}
