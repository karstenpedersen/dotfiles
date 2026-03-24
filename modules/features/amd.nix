{ ... }:

{
  flake.modules.nixos.amd =
    { ... }:
    {
      services.xserver.videoDrivers = [
        "amdgpu"
      ];
    };
}