{ ... }:

{
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # TODO: Move somewhere else
  services.libinput.enable = true;
}
