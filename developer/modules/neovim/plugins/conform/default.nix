{ pkgs, ... }:

let nixformatter = "nixfmt";
in {
  programs.nixvim = {
    extraPackages = [ pkgs.${nixformatter} ];
    plugins.conform-nvim = {
      enable = true;
      formatOnSave = { timeoutMs = 500; };
      formattersByFt = { nix = [ nixformatter ]; };
    };
  };

  imports = [ ./lua.nix ./cpp.nix ./python.nix ];
}
