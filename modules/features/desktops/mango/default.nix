{ self, inputs, ... }:

{
  flake.modules.nixos.mangowc =
    { pkgs, ... }:
    {
      imports = [
        inputs.mangowc.nixosModules.mango

        self.modules.nixos.wayland
        self.modules.nixos.audio
        self.modules.nixos.bluetooth
        self.modules.nixos.dms
      ];

      programs.mango = {
        enable = true;
      };

      environment.systemPackages = with pkgs; [
        foot # Mango's default terminal
      ];

      security.polkit.enable = true;
      services.displayManager.ly.enable = true;
      services.gnome.gnome-keyring.enable = true;
    };
}