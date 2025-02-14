{ lib, inputs, config, ... }:

{
  nix = {
    # Make nix3 and legacy nix commands consistent
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # See https://jackson.dev/post/nix-reasonable-defaults/
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB

      # Deduplicate and optimize nix store
      auto-optimise-store = true;

      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };

    extraOptions = ''
      # max-jobs = auto  # Allow building multiple derivations in parallel
      # keep-outputs = true  # Do not garbage-collect build time-only dependencies (e.g. clang)
      # Allow fetching build results from the Lean Cachix cache
      trusted-substituters = https://lean4.cachix.org/
      trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= lean4.cachix.org-1:mawtxSxcaiWE24xCXXgh3qnvlTkyU7evRRnGeAhD4Wk=
    '';

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
}
