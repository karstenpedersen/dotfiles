{ ... }:

{
  flake.modules.homeManager.nushell =
    { pkgs, ... }:
    {
      programs.nushell = {
        enable = true;
        settings = {
          show_banner = false;
          completions.algorithm = "fuzzy";
        };
        extraConfig = ''
          # nvidia offload


          # zellij
          # def start_zellij [] {
          #   if "ZELLIJ" not-in ($env | columns) {
          #     if "ZELLIJ_AUTO_ATTACH" in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == "true" {
          #       zellij attach -c
          #     } else {
          #       zellij
          #     }

          #     if "ZELLIJ_AUTO_EXIT" in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == "true" {
          #       exit
          #     }
          #   }
          # }

          # start_zellij
        '';
        shellAliases = {
          l = "ls";
          fg = "job unfreeze";
        };
        plugins = with pkgs.nushellPlugins; [
          query
          gstat
          polars
        ];
      };
    };
}