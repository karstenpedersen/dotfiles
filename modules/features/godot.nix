{ ... }:
{
  flake.modules.nixos.godot =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.godot-mono

        (with pkgs.dotnetCorePackages; combinePackages [
          sdk_8_0
          sdk_10_0
        ])
      ];

      programs.nix-ld = {
        libraries = with pkgs; [
          (with pkgs.dotnetCorePackages; combinePackages [
            sdk_8_0
            sdk_10_0
          ])
        ];
      };
    };
}