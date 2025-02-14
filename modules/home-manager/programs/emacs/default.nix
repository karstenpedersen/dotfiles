{ config, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: [
      epkgs.evil
      epkgs.evil-surround
      epkgs.evil-collection
      epkgs.general
      epkgs.which-key
      epkgs.hydra
      epkgs.yasnippet
      epkgs.undo-tree
      epkgs.company               # completion framework
      epkgs.projectile
      epkgs.consult
      epkgs.vertico
      epkgs.orderless

      # epkgs.direnv
      epkgs.envrc
      epkgs.bazel

      # epkgs.eterm-256color

      epkgs.magit

      epkgs.pdf-tools

      epkgs.presentation
      epkgs.catppuccin-theme

      # epkgs.gtags-mode
      epkgs.ggtags

      # epkgs.dired-single

      # Languages
      epkgs.go-mode
      epkgs.emmet-mode
      epkgs.web-mode
      epkgs.rjsx-mode
    ];
  };
  services.emacs.enable = true;
  home.file.".config/emacs/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home-manager/programs/emacs/config";
    recursive = true;
  };
  # home.file.".config/emacs/variables.el".text = ''
  #   ;; Variables

  #   ;; Directories
  #   (defvar variables/home (concat (getenv "HOME") "/") "Home directory.")
  #   (defvar variables/nextcloud (concat variables/home "Nextcloud/") "Nextcloud directory.")
  #   (defvar variables/notes (concat variables/nextcloud "notes/") "Notes directory.")
  #   (defvar variables/dotfiles (concat variables/home "dotfiles/") "Dotfiles directory.")
  #   (defvar variables/repos (concat variables/home "repos/") "Projects directory.")
  #   (defvar variables/trash (concat variables/home ".Trash/") "Trash directory.")

  #   ;; org-mode
  #   (setq org-directory variables/notes)

  #   (provide 'variables)
  # '';
}
