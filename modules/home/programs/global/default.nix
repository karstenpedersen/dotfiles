{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    global
    universal-ctags
  ];
  # home.file.".globalrc".text = ''
  #   
  # '';
}