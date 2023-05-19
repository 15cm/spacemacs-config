(spacemacs/declare-prefix-for-mode 'js2-mode "n" "nodejs-repl")
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "ns" 'nodejs-repl-switch-to-repl)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "nr" 'nodejs-repl-send-region)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "nb" 'nodejs-repl-send-buffer)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "ne" 'nodejs-repl-send-last-sexp)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "ni" 'run-node)

(evil-leader/set-key "jd" 'dumb-jump-go)
(evil-leader/set-key "jD" 'dumb-jump-go-other-window)
(spacemacs/declare-prefix "jg" "dumb-jump")
(evil-leader/set-key "jgb" 'dumb-jump-back)
(evil-leader/set-key "jgp" 'dumb-jump-go-prompt)

(with-eval-after-load 'emmet-mode
     (define-key emmet-mode-keymap (kbd "C-j") nil))

(with-eval-after-load 'web-mode
  (define-key typescript-tsx-mode-map (kbd "C-j") 'web-mode-navigate))

;; gdb
(with-eval-after-load 'gdb-mi
  (evil-make-overriding-map gdb-breakpoints-mode-map 'normal)
  (evil-set-initial-state 'gdb-breakpoints-mode 'normal))

(with-eval-after-load 'company-lsp
    (define-key company-active-map (kbd "<S-return>") 'company-lsp-complete-selection-no-snippet))

;; python
(spacemacs/set-leader-keys-for-major-mode 'python-mode "gD" 'xref-find-definitions-other-window)
(spacemacs/set-leader-keys-for-major-mode 'python-mode "ir" 'my-python-remove-unused-imports)
(spacemacs/set-leader-keys-for-major-mode 'python-mode "==" 'apheleia-format-buffer)

;; Lsp
(with-eval-after-load 'lsp-mode
  (spacemacs/lsp-define-key lsp-command-map "to" #'lsp-treemacs-symbols))
