{ config, ... }:

{
  config = {
    sops.defaultSopsFile = ../secrets/nixos.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/nix/persist/var/lib/sops-nix/keys.txt";
    sops.secrets."users/${config.user.username}" = {
      owner = config.user.username;
      neededForUsers = true;
    };
  };
}
