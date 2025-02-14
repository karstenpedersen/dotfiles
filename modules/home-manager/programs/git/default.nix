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
  };
}
