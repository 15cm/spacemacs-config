;; (evil-leader/set-key "C-c" 'switch-clipboard-mode)
(evil-leader/set-key "C-r" 'dotspacemacs/sync-configuration-layers)
(evil-leader/set-key "C-d" 'spacemacs/find-dotfile)

(spacemacs/declare-prefix "<SPC>" "better-defaults")
(evil-leader/set-key "<SPC>n" 'my-find-notes)
(evil-leader/set-key "<SPC>f" 'fzf)
(evil-leader/set-key "<SPC>d" 'fzf-directory)

