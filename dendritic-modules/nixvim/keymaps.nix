{ ... }:

{
  flake.modules.homeManager.nixvim.programs.nixvim = {
    keymaps = [
      {
        action = ":CornelisLoad<CR>:CornelisQuestionToMeta<CR>";
        key = "<C-c><C-l>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisGoals<CR>";
        key = "<C-c><C-?>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisPrevGoal<CR>";
        key = "<C-c><C-b>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisNextGoal<CR>";
        key = "<C-c><C-f>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisNextGoal<CR>";
        key = "<C-c><C-f>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisGive<CR>";
        key = "<C-c><C-SPC>";
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
      {
        action = ":CornelisElaborate <RW>";
        key = "<C-c><C-m>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisAuto<CR>";
        key = "<C-c><C-a>";
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
        action = ":CornelisTypeContext <RW>";
        key = "<C-c><C-,>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisTypeInfer <RW>";
        key = "<C-c><C-d>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisTypeContextInfer <RW>";
        key = "<C-c><C-.>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisNormalize <CM>";
        key = "<C-c><C-n>";
        options = {
          silent = true;
        };
      }
      {
        action = ":CornelisHelperFunc <RW>";
        key = "<C-c><C-h>";
        options = {
          silent = true;
        };
      }
      {
        mode = "i";
        key = "<localleader>u";
        action = "<C-O>:call cornelis#prompt_input()<CR>";
        options = {
          silent = true;
          desc = "Interactive Unicode Input (Cornelis)";
        };
      }
    ];
  };
}