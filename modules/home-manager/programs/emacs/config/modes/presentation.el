;; Presentation

(defun my-presentation-on ())

(defun my-presentation-off ())

(add-hook 'presentation-on-hook #'my-presentation-on)
(add-hook 'presentation-off-hook #'my-presentation-off)

(setq presentation-default-text-scale 5)

(use-package presentation :defer t)