{ ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "karstenfp.all@gmail.com";
        name = "Karsten Pedersen";
      };
      ui = {
        default-command = [
          "log"
        ];
        editor = "hx";
        pager = ":builtin";
      };
    };
  };
}
