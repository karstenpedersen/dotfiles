;; Load variables
(load (expand-file-name "variables.el" user-emacs-directory))

;; Keybindings
(use-package general
  :config
  (general-evil-setup t)
  (general-create-definer self/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))
(use-package hydra)


;; Emacs
(setq dired-free-space nil)

;; Whitespaces
(setq show-trailing-whitespace t)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq use-short-answers t) ;; "yes" or "no" becomes "y" and "n"
(setq confirm-kill-emacs 'yes-or-no-p) ;; Confirm to quit

;; Lines
;; (setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)
(setq line-move-visual t)
(setq sentence-end-double-space nil)

;; Delete
(setq trash-directory variables/trash)
(setq delete-by-moving-to-trash t)

;; compilation-mode
(use-package compile
  :config
  (setq compilation-scroll-output t)
  (define-key compilation-mode-map (kbd "g") nil)
  (define-key compilation-mode-map (kbd "r") 'recompile)
  (define-key compilation-mode-map (kbd "h") nil)
  (global-set-key (kbd "C-c C-r") 'recompile))

;; Basic
(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs_undo_history"))))

(use-package savehist
  :init
  (savehist-mode))

;; Environment
(use-package envrc
  :hook (after-init . envrc-global-mode))

;; Theme
(use-package catppuccin-theme
  :config
  (load-theme 'catppuccin :no-confirm))

;; Snippets
(use-package yasnippet
  :config
  (setq yas-snippet-dirs (list (expand-file-name "snippets/" user-emacs-directory)))
  (yas-global-mode 1))

;; Version control
(use-package magit)

;; Terminal
(use-package term
  :config
  (setq explicit-shell-file-name "bash")
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

;; Visual packages
(use-package paren
  ;; highlight matching delimiters
  :ensure nil
  :config
  (setq show-paren-delay 0.1
	show-paren-highlight-openparen t
	show-paren-when-point-inside-paren t
	show-paren-when-point-in-periphery t)
  (show-paren-mode 1))

;; Load files
(load (expand-file-name "project.el" user-emacs-directory))
(load (expand-file-name "evil.el" user-emacs-directory))
(load (expand-file-name "completion.el" user-emacs-directory))
(load (expand-file-name "modes/presentation.el" user-emacs-directory))
(load (expand-file-name "keybindings.el" user-emacs-directory))

;; STAR
