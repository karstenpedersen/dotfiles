{ ... }:

{
  # Polkit
  security.polkit.enable = true;

  # Display manager
  services.displayManager.sddm.enable = true;
  
  # Desktop
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
}
