;; Modes
(menu-bar-mode 0)
(tool-bar-mode 0)
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
