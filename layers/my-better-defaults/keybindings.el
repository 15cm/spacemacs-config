(evil-leader/set-key "C-r" 'dotspacemacs/sync-configuration-layers)
(evil-leader/set-key "C-d" 'spacemacs/find-dotfile)

;; misc
(spacemacs/declare-prefix "<SPC>" "better-defaults")
(evil-leader/set-key "<SPC>f" 'fzf)
(evil-leader/set-key "<SPC>F" 'fzf-directory)
(evil-leader/set-key "<SPC>u" 'spacemacs/avy-open-url)

;; common
(global-set-key (kbd "<C-return>") 'spacemacs/evil-insert-line-below)
(global-set-key (kbd "<S-return>") 'spacemacs/evil-insert-line-above)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-h") 'delete-backward-char)

;; vim surround
(with-eval-after-load 'evil-surround
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region))

;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-f") 'right-char)
  (define-key company-active-map (kbd "C-h") 'delete-backward-char)
  (define-key company-active-map (kbd "<C-return>") 'newline-and-indent))

;; term
(evil-define-key 'normal term-raw-map (kbd "C-n") 'term-send-down)
(evil-define-key 'normal term-raw-map (kbd "C-p") 'term-send-up)

;; smartparens
(global-set-key (kbd "M-f") 'sp-forward-sexp)
(global-set-key (kbd "M-b") 'sp-backward-sexp)
(global-set-key (kbd "M-d") 'sp-down-sexp)
(global-set-key (kbd "M-D") 'sp-backward-down-sexp)
(global-set-key (kbd "M-u") 'sp-up-sexp)
(global-set-key (kbd "M-U") 'sp-backward-up-sexp)
(global-set-key (kbd "M-a") 'sp-beginning-of-sexp)
(global-set-key (kbd "M-e") 'sp-end-of-sexp)

;; clipboard
(define-key evil-visual-state-map (kbd "C-y") 'copy-to-clipboard)

(if (my-system-typep-darwin)
    (global-set-key (kbd "s-v") 'paste-from-clipboard))
(global-set-key (kbd "C-S-y") 'paste-from-clipboard)
(define-key helm-map (kbd "C-S-y") 'paste-from-clipboard)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)


;; avy
(define-key evil-normal-state-map (kbd "t") 'evil-avy-goto-char-in-line)
(define-key evil-visual-state-map (kbd "t") 'evil-avy-goto-char-in-line)
(define-key evil-normal-state-map (kbd "T") 'evil-avy-goto-char-timer)
(define-key evil-visual-state-map (kbd "T") 'evil-avy-goto-char-timer)

;; anzu
(evil-leader/set-key "<SPC>r" 'anzu-query-replace-regexp)
(evil-leader/set-key "<SPC>R" 'anzu-query-replace-at-cursor)

;; view mode
(with-eval-after-load 'view-mode
  (define-key view-mode-map (kbd "j") 'View-scroll-line-forward)
  (define-key view-mode-map (kbd "k") 'View-scroll-line-backward)
  )

;; yas
(global-unset-key (kbd "C-\\"))
(global-set-key (kbd "C-\\") 'yas-expand)

;; search
(evil-leader/set-key "ss" 'spacemacs/helm-file-smart-do-search)
(evil-leader/set-key "sS" 'spacemacs/helm-file-smart-do-search-region-or-symbol)
