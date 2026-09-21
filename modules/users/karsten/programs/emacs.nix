{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.emacs = inputs.wrappers.wrappers.emacs.wrap {
        inherit pkgs;

        configFile = ''
          ;; Modes
          ;; (menu-bar-mode 0)
          ;; (tool-bar-mode 0)
          (scroll-bar-mode 0)
          (blink-cursor-mode 0)

          (column-number-mode 1)
          (show-paren-mode 1)

          ;; Disable startup screens
          (setq inhibit-startup-screen t)
          (setq inhibit-startup-echo-area-message t)
          (setq inhibit-splash-screen t)
          (setq inhibit-startup-buffer-menu t)

          ;; Line numbers
          (global-display-line-numbers-mode 1)
          (setq display-line-numbers-type 'relative)

          ;; Disable line numbers for some modes
          (dolist (mode '(org-mode-hook
                          term-mode-hook
                          eshell-mode-hook))
            (add-hook mode (lambda () (display-line-numbers-mode 0))))

          ;; Window
          (setq frame-resize-pixelwise t)
          (setq window-resize-pixelwise nil)

          ;; Initialise installed packages at this early stage, by using the available cache.
          (setq package-enable-at-startup t)

          ;; Evil
          (use-package evil
            :init
            (setq evil-want-integration t)
            (setq evil-want-keybinding nil)
            (setq evil-want-C-u-scroll t)
            (setq evil-want-C-i-jump t)
            (setq evil-want-fine-undo t)
            (setq evil-want-Y-yank-to-eol t)
            :config
            (evil-set-initial-state 'debugger-mode 'motion)
            (evil-set-initial-state 'pdf-view-mode 'motion)
            (evil-set-initial-state 'term-mode 'emacs)
            (evil-set-initial-state 'calc-mode 'emacs)
            (evil-set-undo-system 'undo-tree)
            (evil-mode))

          (use-package evil-surround
            :after evil
            :defer 2
            :config
            (global-evil-surround-mode 1))

          (use-package evil-collection
            :after evil
            :config
            (evil-collection-init))

          ;; Dired
          (use-package dired
            :config
              (evil-collection-define-key 'normal 'dired-mode-map
              "h" 'dired-up-directory
              "l" 'dired-find-file))
        '';
      };
    };
}
