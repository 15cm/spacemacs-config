;; (evil-leader/set-key "C-c" 'switch-clipboard-mode)
(evil-leader/set-key "C-r" 'dotspacemacs/sync-configuration-layers)
(evil-leader/set-key "C-d" 'spacemacs/find-dotfile)

(spacemacs/declare-prefix "<SPC>" "better-defaults")
(evil-leader/set-key "<SPC>n" 'my-fzf-notes)
(evil-leader/set-key "<SPC>c" 'my-fzf-codes)
(evil-leader/set-key "<SPC>f" 'fzf)
(evil-leader/set-key "<SPC>F" 'fzf-directory)
(evil-leader/set-key "<SPC>C-f" 'fzf-git)
(evil-leader/set-key "<SPC>t" 'my-iterm-goto-filedir-or-home)
(evil-leader/set-key "<SPC>w" 'my-find-wiki)
(evil-leader/set-key "<SPC>a" 'helm-ag)
(evil-leader/set-key "<SPC>A" 'helm-ag-project-root)
(evil-leader/set-key "<SPC>'" 'switch-clipboard-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-f") 'right-char)
  (define-key company-active-map (kbd "<C-return>") 'newline-and-indent))

(evil-define-key 'normal term-raw-map (kbd "C-n") 'term-send-down)
(evil-define-key 'normal term-raw-map (kbd "C-p") 'term-send-up)

(define-key smartparens-mode-map (kbd "C-M-n") 'sp-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-p") 'sp-down-sexp)