{ ... }:

{
  programs.git = {
    enable = true;
    userName  = "Karsten Pedersen";
    userEmail = "karstenfp.all@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      rb = "rebase";
      pl = "pull";
      df = "diff";
      sw = "switch";
      rs = "restore";
      l = "log --oneline --decorate --graph";
      last = "log -1 HEAD";
      unstage = "reset HEAD --";
    };
  };
}
