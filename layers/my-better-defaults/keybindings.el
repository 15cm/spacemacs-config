;; Spacemacs defaults
(evil-leader/set-key "C-r" 'dotspacemacs/sync-configuration-layers)
(evil-leader/set-key "C-d" 'spacemacs/find-dotfile)

;; misc
(spacemacs/declare-prefix "<SPC>" "better-defaults")
(evil-leader/set-key "<SPC>f" 'fzf)
(evil-leader/set-key "<SPC>F" 'fzf-directory)
(evil-leader/set-key "<SPC>a" 'ranger)
(evil-leader/set-key "<SPC>e" 'edit-indirect-region)
(evil-leader/set-key "<SPC>l" 'revert-buffer-quick)

;; common
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-/") 'company-files)

;; evil
(with-eval-after-load 'evil-surround
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region))

;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-f") 'right-char)
  (define-key company-active-map (kbd "C-h") 'delete-backward-char)
  (define-key company-active-map (kbd "<S-return>") 'newline-and-indent))
(evil-leader/set-key "<SPC>c" 'my-completion-at-end-of-symbol-in-normal-state)

;; term
(evil-define-key 'normal term-raw-map (kbd "C-n") 'term-send-down)
(evil-define-key 'normal term-raw-map (kbd "C-p") 'term-send-up)

;; smartparens
(with-eval-after-load 'smartparens
  (global-set-key (kbd "M-l") 'sp-next-sexp)
  (global-set-key (kbd "M-h") 'sp-previous-sexp)
  (global-set-key (kbd "M-k") 'sp-backward-sexp)
  (global-set-key (kbd "M-j") 'sp-forward-sexp)
  (global-set-key (kbd "M-u") 'sp-down-sexp)
  (global-set-key (kbd "M-U") 'sp-backward-down-sexp)
  (global-set-key (kbd "M-i") 'sp-up-sexp)
  (global-set-key (kbd "M-I") 'sp-backward-up-sexp)
  (global-set-key (kbd "M-o") 'sp-end-of-sexp)
  (global-set-key (kbd "M-y") 'sp-beginning-of-sexp)
  (global-set-key (kbd "M-f") 'sp-beginning-of-sexp)
  (spacemacs/set-leader-keys-for-minor-mode smartparens-mode "ns" 'sp-narrow-to-sexp))


;; clipboard
(setq my-paste-key (if (my-system-typep-darwin) "s-v" "C-S-v"))

(define-key evil-visual-state-map (kbd "C-y") 'copy-selection-to-clipboard)
(define-key evil-normal-state-map (kbd "C-y") 'copy-kill-ring-to-clipboard)
(global-set-key (kbd my-paste-key) 'paste-from-clipboard)
(global-set-key (kbd "M-c") 'consult-yank-from-kill-ring)

;; avy
(define-key evil-normal-state-map "t" 'evil-avy-goto-char-in-line)
(define-key evil-visual-state-map "t" 'evil-avy-goto-char-in-line)
(define-key evil-normal-state-map "T" 'evil-avy-goto-symbol-1)
(define-key evil-visual-state-map "T" 'evil-avy-goto-symbol-1)

;; anzu
(evil-leader/set-key "<SPC>r" 'anzu-query-replace-regexp)
(evil-leader/set-key "<SPC>R" 'anzu-query-replace-at-cursor)

;; view mode
(with-eval-after-load 'view-mode
  (define-key view-mode-map (kbd "j") 'View-scroll-line-forward)
  (define-key view-mode-map (kbd "k") 'View-scroll-line-backward))

;; yas
(global-unset-key (kbd "C-\\"))
(global-set-key (kbd "C-\\") 'yas-expand)

;; search
(with-eval-after-load 'consult
  (evil-leader/set-key "sd" 'my-compleseus-search-dir)
  (evil-leader/set-key "sD" 'my-compleseus-search-dir-with-input)
  (evil-leader/set-key "ss" 'my-compleseus-search-file)
  (evil-leader/set-key "sS" 'my-compleseus-search-file-with-input))
(define-key minibuffer-mode-map (kbd "<next>") 'vertico-scroll-up)
(define-key minibuffer-mode-map (kbd "<prior>") 'vertico-scroll-down)
(define-key minibuffer-mode-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-mode-map (kbd "C-n") 'next-history-element)
(with-eval-after-load 'vertico-mode
  (define-key vertico-map (kbd "<next>") 'vertico-scroll-up)
  (define-key vertico-map (kbd "<prior>") 'vertico-scroll-down)
  (define-key vertico-map (kbd "C-p") 'previous-history-element)
  (define-key vertico-map (kbd "C-n") 'next-history-element))
