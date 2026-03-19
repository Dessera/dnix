{
  dnix.hardware = {
    bluetooth.enable = true;
  };

  hardware = {
    facter.reportPath = ./facter.json;

    nvidia = {
      open = true;
      prime = {
        intelBusId = "PCI:0@0:2:0";
        nvidiaBusId = "PCI:1@0:0:0";
      };
    };
  };
}
