;; (evil-leader/set-key "C-c" 'switch-clipboard-mode)
(evil-leader/set-key "C-r" 'dotspacemacs/sync-configuration-layers)
(evil-leader/set-key "C-d" 'spacemacs/find-dotfile)

(spacemacs/declare-prefix "o" "better-defaults")
(evil-leader/set-key "on" 'my-find-notes)
(evil-leader/set-key "of" 'fzf-directory)

