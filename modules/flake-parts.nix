{ inputs, ... }: {
  imports = [
    inputs.wrappers.flakeModules.wrappers
    inputs.flake-parts.flakeModules.modules
    inputs.treefmt-nix.flakeModule
  ];

  options = {
    flake = inputs.flake-parts.lib.mkSubmoduleOptions {
      wrappersModules = inputs.nixpkgs.lib.mkOption {
        default = { };
      };
    };
  };

  config = {
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    perSystem = { config, ... }: {
      treefmt = {
        projectRootFile = "flake.nix";
        programs = {
          nixfmt.enable = true;
        };
      };

      formatter = config.treefmt.build.wrapper;
    };
  };
}
