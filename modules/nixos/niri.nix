{ ... }:

{
  # Enable niri
  programs.niri = {
    enable = true;
  };

  # Polkit
  security.polkit.enable = true;

  # Display manager
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  services.displayManager.ly = {
    enable = true;
    settings = {
      
    };
  };

  # Secret service
  services.gnome.gnome-keyring.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
