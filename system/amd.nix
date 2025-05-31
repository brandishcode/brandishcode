{ pkgs, config, lib, ... }:

let isGpu = config.gpu == "amd";
in {
  config = {
    boot.kernelModules = lib.mkIf isGpu [ "kvm-amd" ];
    hardware.graphics = lib.mkIf isGpu {
      extraPackages = with pkgs; [ amdvlk ];
      extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
    };
    hardware.cpu.amd = lib.mkIf isGpu {
      updateMicrocode =
        lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
  };
}
