{
  flake.modules.homeManager.keepassxc = args: {
    programs.keepassxc = {
      enable = true;
      autostart = true;
      settings = {
        FdoSecrets.Enabled = true;
      };
    };

    xdg.autostart.enable = true;
  };
}