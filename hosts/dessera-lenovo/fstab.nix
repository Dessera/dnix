{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/0679cb0c-913b-40e0-a990-4b51d6d0100e";
    fsType = "btrfs";
    options = [
      "subvol=root"
      "compress=zstd"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/0679cb0c-913b-40e0-a990-4b51d6d0100e";
    fsType = "btrfs";
    options = [
      "subvol=home"
      "compress=zstd"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/0679cb0c-913b-40e0-a990-4b51d6d0100e";
    fsType = "btrfs";
    options = [
      "subvol=nix"
      "noatime"
      "compress=zstd"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/5478-A4A3";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/run/media/dessera/DATA" = {
    device = "/dev/disk/by-uuid/4A4CFCA24CFC89C9";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };

  fileSystems."/run/media/dessera/WINDOWS" = {
    device = "/dev/disk/by-uuid/0472796E72796578";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/10188644-9cf2-40c2-906d-51773a94fe4e"; }
  ];
}
