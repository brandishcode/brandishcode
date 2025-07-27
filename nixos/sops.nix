{ config, ... }:

{
  config = {
    sops.defaultSopsFile = ../secrets/nixos.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/nix/persist/var/lib/sops-nix/keys.txt";
    sops.secrets."users/developer" = {
      owner = "developer";
      neededForUsers = true;
    };
    sops.secrets."users/root" = {
      owner = "root";
      neededForUsers = true;
    };
  };
}
