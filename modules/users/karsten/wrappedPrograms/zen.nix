{ inputs, ... }:
{
  perSystem = { pkgs, ... }: {
    packages.zen = inputs.zen-browser.packages.${pkgs.system}.default;
  };
}