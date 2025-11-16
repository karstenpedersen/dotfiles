{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "compact";
        position = "right";
        widgets = {
          left = [
            
          ];
          center = [
            {
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "Battery";
              alwaysShowPercentage = false;
              warningsThreshold = 30;
            }
            {
              id = "Clock";
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Monochrome";
      network = {
        wifiEnabled = true;
      };
      notifications = {
        enabled = true;
        location = "top_right";
      };
      templates = {
        gtk = true;
        qt = true;
        kcolorscheme = true;
        fuzzel = true;
        alacritty = true;
      };
      battery = {
        chargingMode = 0;
      };
    };
  };
}
