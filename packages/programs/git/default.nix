{ config, ... }:

{
  config = {
    home.sessionVariables = {
      GITHUB_TOKEN = config.git.token;
    };

    programs = {
      git = {
        enable = true;
        userName = config.git.username;
        userEmail = config.git.useremail;
        extraConfig = {
          init.defaultBranch = "main";
        };
      };
      gh = {
        enable = true;
      };
    };
  };
}
