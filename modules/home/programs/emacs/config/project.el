
(use-package projectile
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map))
  :config
  (setq projectile-enable-caching t)
        projectile-cache-file (expand-file-name "projectile.cache" "~")
        projectile-known-projects-file (expand-file-name "projectile-known-projects.eld" "~"))

