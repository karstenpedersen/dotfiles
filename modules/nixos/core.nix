{ inputs, outputs, ... }:

{
  imports = [
    ./nix.nix
    ./sops.nix
    ./locale.nix
  ];
}