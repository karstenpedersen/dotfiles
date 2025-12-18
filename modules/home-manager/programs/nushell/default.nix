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
      def nvidia-offload [...cmd] {
        with-env {
          __NV_PRIME_RENDER_OFFLOAD: "1",
          __NV_PRIME_RENDER_OFFLOAD_PROVIDER: "NVIDIA-G0",
          __GLX_VENDOR_LIBRARY_NAME: "nvidia",
          __VK_LAYER_NV_optimus: "NVIDIA_only" 
        } {
          exec ...$cmd
        }
      }
      
      # zellij
      def start_zellij [] {
        if "ZELLIJ" not-in ($env | columns) {
          if "ZELLIJ_AUTO_ATTACH" in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == "true" {
            zellij attach -c
          } else {
            zellij
          }

          if "ZELLIJ_AUTO_EXIT" in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == "true" {
            exit
          }
        }
      }

      start_zellij
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
}
