(evil-leader/set-key "C-r" 'dotspacemacs/sync-configuration-layers)
(evil-leader/set-key "C-d" 'spacemacs/find-dotfile)

;; function
(spacemacs/declare-prefix "<SPC>" "better-defaults")
(evil-leader/set-key "<SPC>n" 'my-fzf-notes)
(evil-leader/set-key "<SPC>c" 'my-fzf-codes)
(evil-leader/set-key "<SPC>f" 'fzf)
(evil-leader/set-key "<SPC>F" 'fzf-directory)
(evil-leader/set-key "<SPC>C-f" 'fzf-git)
(evil-leader/set-key "<SPC>t" 'my-iterm-goto-filedir-or-home)
(evil-leader/set-key "<SPC>w" 'my-find-wiki)
(evil-leader/set-key "<SPC>a" 'helm-ag-project-root)
(evil-leader/set-key "<SPC>A" 'helm-ag)
(evil-leader/set-key "<SPC>l" 'browse-url-default-macosx-browser)

;; common
(global-set-key (kbd "<C-return>") 'spacemacs/evil-insert-line-below)
(global-set-key (kbd "<S-return>") 'spacemacs/evil-insert-line-above)
(global-set-key (kbd "C-s") 'save-buffer)

;; vim surround
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-f") 'right-char)
  (define-key company-active-map (kbd "<C-return>") 'newline-and-indent))

;; term
(evil-define-key 'normal term-raw-map (kbd "C-n") 'term-send-down)
(evil-define-key 'normal term-raw-map (kbd "C-p") 'term-send-up)

;; smartparens
(global-set-key (kbd "M-f") 'sp-forward-sexp)
(global-set-key (kbd "M-b") 'sp-backward-sexp)
(global-set-key (kbd "M-n") 'sp-down-sexp)
(global-set-key (kbd "M-p") 'sp-up-sexp)
(global-set-key (kbd "M-a") 'sp-beginning-of-sexp)
(global-set-key (kbd "M-e") 'sp-end-of-sexp)

;; clipboard
(define-key evil-visual-state-map (kbd "C-y") 'copy-to-clipboard)

(if (display-graphic-p)
    (global-set-key (kbd "s-v") 'paste-from-clipboard))
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; avy
(define-key evil-normal-state-map (kbd "t") 'evil-avy-goto-char-in-line)
(define-key evil-visual-state-map (kbd "t") 'evil-avy-goto-char-in-line)
(define-key evil-normal-state-map (kbd "T") 'evil-avy-goto-char-timer)
(define-key evil-visual-state-map (kbd "T") 'evil-avy-goto-char-timer)

;; anzu
(evil-leader/set-key "<SPC>r" 'anzu-query-replace-regexp)
(evil-leader/set-key "<SPC>R" 'anzu-query-replace-at-cursor)
