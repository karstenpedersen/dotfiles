{ inputs, ... }:

{
  flake.modules.homeManager.nixvim = {
    imports = [
      inputs.nixvim.homeModules.nixvim
    ];

    programs.nixvim = {
      enable = true;

      colorschemes.catppuccin.enable = true;
      plugins.lualine.enable = true;
      plugins.cornelis.enable = true;
      plugins.direnv.enable = true;
      plugins.which-key.enable = true;

      # autoCmd = [
      #   {
      #     event = [ "BufRead" "BufNewFile" ];
      #     pattern = "*.agda";
      #   }
      # ];
    };
  };
}