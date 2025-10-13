{
  pkgs,
  config,
  lib,
  ...
}:

let
  isGpu = config.gpu == "amd";
in
{
  config = {
    boot.kernelModules = lib.mkIf isGpu [ "kvm-amd" ];
    hardware.cpu.amd = lib.mkIf isGpu {
      updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
  };
}
