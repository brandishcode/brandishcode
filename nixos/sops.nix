{ config, ... }:

{
  config = {
    sops.defaultSopsFile = ../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/home/${config.user.username}/.config/sops/age/keys.txt";
    sops.secrets."users/${config.user.username}" = {
      owner = config.user.username;
      neededForUsers = true;
    };

    users.users.${config.user.username} = {
      hashedPasswordFile = config.sops.secrets."users/${config.user.username}".path;
    };
  };
}
