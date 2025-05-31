{ lib, ... }:

{
  options = {
    systemd-boot-entry1 = lib.mkOption {
      default = {
        "arch.conf" = ''
          title   Arch Linux
          linux   /vmlinuz-linux
          initrd  /initramfs-linux.img
          options root=UUID=954bde48-30b6-417d-b04c-c1debaa2eafe rw
        '';
        "arch-fallback.conf" = ''
          title   Arch Linux (fallback initframs)
          linux   /vmlinuz-linux
          initrd  /initramfs-linux-fallback.img
          options root=UUID=954bde48-30b6-417d-b04c-c1debaa2eafe rw
        '';
      };
      type = lib.types.attrs;
      description = ''
        systemd-boot entry for other os
      '';
    };
  };
}
