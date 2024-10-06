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

;; Disable arrow keys
(defun self/no-arrow()
  (interactive)
  (message "Arrow keys are bad, you know?"))

  ;; Disable arrow keys in normal and visual modes
  (define-key evil-normal-state-map (kbd "<left>") 'self/no-arrow)
  (define-key evil-normal-state-map (kbd "<right>") 'self/no-arrow)
  (define-key evil-normal-state-map (kbd "<down>") 'self/no-arrow)
  (define-key evil-normal-state-map (kbd "<up>") 'self/no-arrow)
  (evil-global-set-key 'motion (kbd "<left>") 'self/no-arrow)
  (evil-global-set-key 'motion (kbd "<right>") 'self/no-arrow)
  (evil-global-set-key 'motion (kbd "<down>") 'self/no-arrow)
  (evil-global-set-key 'motion (kbd "<up>") 'self/no-arrow)
