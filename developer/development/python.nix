{ pkgs, config, lib, ... }:

let pythonpkg = "python312";
in {
  config = {
    home.packages = lib.mkIf config.fordev.python [
      pkgs.${pythonpkg}
      pkgs.${pythonpkg}.pkgs.pip
    ];
  };
}
