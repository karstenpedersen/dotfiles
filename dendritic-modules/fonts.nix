{ pkgs, ... }:

{
  flake.modules.nixos.fonts = {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        noto-fonts
        noto-fonts-color-emoji
        twemoji-color-font
        nerd-fonts.fira-mono
        julia-mono
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "Noto Serif" ];
          sansSerif = [ "Noto Sans" ];
          monospace = [ "Fira Mono" ];
        };
      };
    };
  };

  flake.modules.homeManager.fonts = {
    fonts.fontconfig.enable = true;
  };
}
