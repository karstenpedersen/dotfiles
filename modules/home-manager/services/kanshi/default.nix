{ ... }:

{
  services.kanshi = {
    enable = true;
    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            # position = "0,0";
            # mode = "1920x1080@144Hz";
          }
        ];
      };
      docked = {
        outputs = [
          {
            criteria = "eDP-1";
            # position = "0,0";
            # mode = "1920x1080@144Hz";
          }
          {
            criteria = "HDMI-A-1";
            # position = "0,0";
            # mode = "1920x1080@60Hz";
          }
        ];
      };
    };
  };
}
