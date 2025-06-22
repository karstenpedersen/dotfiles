{ pkgs, ... }:

{
  imports = [
    ./xserver.nix
  ];

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kcolorchooser
    kdePackages.kolourpaint
    kdePackages.ksystemlog
    kdePackages.sddm-kcm
    kdiff3
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    hardinfo2
    haruna
    wayland-utils
    wl-clipboard
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
}
