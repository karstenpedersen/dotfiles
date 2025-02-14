{ pkgs, config, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
    shellAliases = {
      lg = "lazygit";
      "g." = "cd ~/dotfiles";
      "gr" = "cd ~/repos";
      "gd" = "cd ~/downloads";
      "gD" = "cd ~/documents";
      gv = "cd ~/Nextcloud/vault/";
      gn = "cd ~/Nextcloud/nb/";
      ll = "exa -alh";
      ls = "exa";
      tree = "exa --tree";
      top10 = "history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n10";
    };
  };
}
