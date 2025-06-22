{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default

    ../nixos/nix.nix
    ../nixos/locale.nix
  ];

  # WSL
  wsl = {
    enable = true;
  };

  # State version
  system.stateVersion = "24.05";
}
