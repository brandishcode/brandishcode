{ lib, config, pkgs, ... }:

let pythonformatter = "black";
in {
  config = {
    programs.nixvim = lib.mkIf config.fordev.python {
      extraPackages = [ pkgs.${pythonformatter} ];
      plugins.conform-nvim = {
        formattersByFt = { python = [ pythonformatter ]; };
      };
    };
  };
}
