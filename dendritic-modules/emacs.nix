{ ... }:

{
  flake.modules.nixos.emacs = {
    services.emacs.enable = true;
  };
}