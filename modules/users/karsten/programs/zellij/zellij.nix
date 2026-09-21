{ ... }: {
  flake.wrappers.zellij = { pkgs, wlib, ... }: {
    imports = [ wlib.modules.default ];

    package = pkgs.zellij;
    env.ZELLIJ_CONFIG_FILE = ./config.kdl;
  };
}
