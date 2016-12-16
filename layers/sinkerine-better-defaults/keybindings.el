;; (evil-leader/set-key "C-c" 'switch-clipboard-mode)
(evil-leader/set-key "C-r" 'dotspacemacs/sync-configuration-layers)
(evil-leader/set-key "C-d" 'spacemacs/find-dotfile)

(spacemacs/declare-prefix "<SPC>" "better-defaults")
(evil-leader/set-key "<SPC>n" 'my-find-notes)
(evil-leader/set-key "<SPC>c" 'my-find-codes)
(evil-leader/set-key "<SPC>f" 'fzf)
(evil-leader/set-key "<SPC>d" 'fzf-directory)

(define-key company-active-map (kbd "C-f") 'right-char)
(define-key company-filter-map (kbd "C-f") 'right-char)

