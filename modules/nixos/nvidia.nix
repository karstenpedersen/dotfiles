{ config, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      prime = {
        # offload.enable = true;
        amdgpuBusId = "PCI:1:0:0";
        nvidiaBusId = "PCI:7:0:0";
      };
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # nvidiaSettings = true;
    };
  };
}
