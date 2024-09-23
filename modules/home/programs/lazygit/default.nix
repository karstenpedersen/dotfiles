{ pkgs, config, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      os = {
        editPreset = "nvim";
        open = "xdg-open {{filename}} >/dev/null";
      };
      customCommands = [
        {
          key = "C";
          command = "git cz c";
          description = "commit with commitizen";
          context = "files";
          loadingText = "opening commitizen commit tool";
          subprocess = true;
        }
      ];
    };
  };
}