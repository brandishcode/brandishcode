{ config, ... }:

{
  config = {
    sops.defaultSopsFile = ../secrets/homemanager.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/home/${config.user.username}/.config/sops/age/keys.txt";
    sops.secrets.git_token = { };
  };
}
