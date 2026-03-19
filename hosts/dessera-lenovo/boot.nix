{ pkgs, ... }:

{
  dnix.boot = {
    grub.enable = true;
    plymouth.enable = true;
  };

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "vmd"
      "nvme"
      "usb_storage"
      "sd_mod"
    ];
    supportedFilesystems = [
      "ntfs"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
