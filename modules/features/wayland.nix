{ ... }:
{
  flake.modules.nixos.wayland =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wev
        wl-clipboard

        # wlr-randr
        # slurp
        # wl-clip-persist
        # brightnessctl
        # wireplumber
        # wev
      ];
    };
}