{ pkgs, config, lib, ... }:

{
  config = {
    hardware.graphics = lib.mkIf (config.gpu == "amd") {
      extraPackages = with pkgs; [ amdvlk ];
      extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
    };
  };
}
