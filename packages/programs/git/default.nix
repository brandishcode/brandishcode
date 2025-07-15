{ config, ... }:

{
  config = {
    home.sessionVariables = {
      GITHUB_TOKEN = "$(cat ${config.sops.secrets.git_token.path})";
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
