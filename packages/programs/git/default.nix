{ config, lib, ... }:

{
  config = {
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
      bash = {
        initExtra = lib.mkMerge [
          # "export GITHUB_TOKEN=$(cat ${config.sops.secrets.git_token.path})"
        ];
      };
    };
  };
}
