{ lib, config, pkgs, ... }:

let luaformatter = "stylua";
in {
  config = {
    programs.nixvim = lib.mkIf config.fordev.lua {
      extraPackages = [ pkgs.${luaformatter} ];
      plugins.conform-nvim = { formattersByFt = { cpp = [ luaformatter ]; }; };
    };
  };
}
