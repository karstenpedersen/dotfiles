{ ... }:

{
  imports = [
    ../../users/karsten
  ];

  # Home
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
