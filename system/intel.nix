{ pkgs, config, lib, ... }:

let isGpu = config.gpu == "intel";
in {
  config = {
    boot.kernelModules = lib.mkIf isGpu [ "kvm-intel" ];
    hardware.graphics = lib.mkIf isGpu {
      extraPackages = with pkgs; [ vpl-gpu-rt ];
      extraPackages32 = with pkgs; [ driversi686Linux.intel-vaapi-driver ];
    };
    hardware.cpu.intel = lib.mkIf isGpu {
      updateMicrocode =
        lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
  };
}
