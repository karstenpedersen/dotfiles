{ ... }:

{
  flake.modules.nixos.plasma =
    { pkgs, ... }:
    {
      services = {
        desktopManager.plasma6.enable = true;
        displayManager.sddm.enable = true;
        displayManager.sddm.wayland.enable = true;
      };

      environment.systemPackages = with pkgs; [
        wayland-utils
        wl-clipboard
      ];
    };
}