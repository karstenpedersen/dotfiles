{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
    plugins.cornelis.enable = true;
    plugins.direnv.enable = true;

    autoCmd = [
      {
        event = [ "BufRead" "BufNewFile" ];
        pattern = "*.agda";
      }
      # {
      #   event = "BufWritePost";
      #   pattern = "*.agda";
      #   command = "CornelisLoad";
      # }
    ];

    keymaps = [
       {
        action = ":CornelisLoad<CR>";
        key = "<C-c><C-l>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisMakeCase<CR>";
        key = "<C-c><C-c>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisRefine<CR>";
        key = "<C-c><C-r>";
        options = {
          silent = true;
        };
      }
      # {
      #   action = ":CornelisMakeCase<CR>";
      #   key = "<leader>d";
      #   options = {
      #     silent = true;
      #   };
      # }
      # {
      #   action = ":CornelisTypeContext<CR>";
      #   key = "<leader>,";
      #   options = {
      #     silent = true;
      #   };
      # }
      # {
      #   action = ":CornelisTypeContextInfer<CR>";
      #   key = "<leader>.";
      #   options = {
      #     silent = true;
      #   };
      # }
      # {
      #   action = ":CornelisSolve<CR>";
      #   key = "<leader>n";
      #   options = {
      #     silent = true;
      #   };
      # }
      # {
      #   action = ":CornelisAuto<CR>";
      #   key = "<leader>a";
      #   options = {
      #     silent = true;
      #   };
      # }
    ];
  };
}
