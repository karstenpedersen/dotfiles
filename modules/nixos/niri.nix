{ ... }:

{
  # Enable niri
  programs.niri.enable = true;

  # Polkit
  security.polkit.enable = true;

  # Display manager
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Secret service
  services.gnome.gnome-keyring.enable = true;
}
