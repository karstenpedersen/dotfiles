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

      environment.sessionVariables = {
        DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
      };

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