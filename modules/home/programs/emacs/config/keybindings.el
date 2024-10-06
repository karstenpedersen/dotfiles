;; Keybindings

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 ;; Navigation
 "-" '(dired-jump :which-key "dired jump"))

(self/leader-keys
 "f" '(nil :which-key "files")
 "fj" '(projectile-find-file :which-key "find file")
 "fk" '(consult-buffer :which-key "find file")
 "fb" '(consult-bookmark :which-key "bookmarks")
 "fn" '(spacemacs/new-empty-buffer :which-key "new file")
 "fr" '(consult-recent-file :which-key "recent files")

 ;; Windows
 "w" '(nil :which-key "window")
 "wd" '(evil-window-delete :which-key "delete window")
 "w-" '(jib/split-window-vertically-and-switch :which-key "split below")
 "w/" '(jib/split-window-horizontally-and-switch :which-key "split right")
 "wl" '(evil-window-right :which-key "evil-window-right")
 "wh" '(evil-window-left :which-key "evil-window-left")
 "wj" '(evil-window-down :which-key "evil-window-down")
 "wk" '(evil-window-up :which-key "evil-window-up")

 ;; Compilation
 "c" '(nil :which-key "compilation")
 "cc" '(compile :which-key "compile")
 "cr" '(recompile :which-key "recompile")
 "ce" '(compile-goto-error :which-key "compile-goto-error")

 ;; Visuals
 "ts" '(hydra-text-scale/body :which-key "scale text")
 )

