{ config, ... }:

let imports = [ ];
in {
  inherit imports;
  home-manager.users.${config.username} = { inherit imports; };
}
