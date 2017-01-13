;; (evil-leader/set-key "C-c" 'switch-clipboard-mode)
(evil-leader/set-key "C-r" 'dotspacemacs/sync-configuration-layers)
(evil-leader/set-key "C-d" 'spacemacs/find-dotfile)

(spacemacs/declare-prefix "<SPC>" "better-defaults")
(evil-leader/set-key "<SPC>n" 'my-fzf-notes)
(evil-leader/set-key "<SPC>c" 'my-fzf-codes)
(evil-leader/set-key "<SPC>f" 'fzf)
(evil-leader/set-key "<SPC>d" 'fzf-directory)
(evil-leader/set-key "<SPC>t" 'my-iterm-goto-filedir-or-home)
(evil-leader/set-key "<SPC>w" 'my-find-wiki)

(define-key company-active-map (kbd "C-f") 'right-char)
(define-key company-filter-map (kbd "C-f") 'right-char)

(evil-define-key 'normal term-raw-map (kbd "C-n") 'term-send-down)
(evil-define-key 'normal term-raw-map (kbd "C-p") 'term-send-up)
