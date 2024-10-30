{ pkgs, ... }:

{
  wsl = {
    enable = true;
  };
  system.stateVersion = "24.05";
  environment.systemPackages = with pkgs; [
    wget
  ];
  vscode-remote-workaround.enable = true;
}
