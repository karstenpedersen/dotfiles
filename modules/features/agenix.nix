{ inputs, ... }:

{
  flake.modules.nixos.agenix =
    { pkgs, ... }:
    {
      imports = [
        inputs.agenix.nixosModules.default
      ];

      environment.systemPackages = [
        pkgs.age
        inputs.agenix.packages.x86_64-linux.default
      ];
    };

  flake.modules.homeManager.agenix =
    { pkgs, ... }:
    {
      imports = [
        inputs.agenix.homeManagerModules.default
      ];
    };
}