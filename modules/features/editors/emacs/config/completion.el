;; Completion

(use-package vertico
  :config
  (vertico-mode))

(use-package consult)

(use-package orderless
  :custom
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  ;; (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; In-buffer completion framework
(add-hook 'after-init-hook 'global-company-mode)
