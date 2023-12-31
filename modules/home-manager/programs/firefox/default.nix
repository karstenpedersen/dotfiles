{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.karsten = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        duckduckgo-privacy-essentials
        firefox-color                
        markdownload                 
        react-devtools               
        vimium                       
      ];
    };
  };
}
