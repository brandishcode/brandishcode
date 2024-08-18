{ config, ... }:

{
  config = {
    programs.git = {
      enable = true;
      userName = config.git.username;
      userEmail = config.git.useremail;
      extraConfig = { init.defaultBranch = "main"; };
    };
  };
}
