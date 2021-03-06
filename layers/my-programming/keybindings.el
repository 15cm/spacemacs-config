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

;; emmet mode
(with-eval-after-load 'emmet
  (evil-define-key 'insert emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
  (evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
  (define-key emmet-mode-keymap (kbd "C-j") 'spacemacs/emmet-expand)
  (define-key emmet-mode-keymap (kbd "C-l") 'emmet-expand-line))

;; gdb
(with-eval-after-load 'gdb-mi
  (evil-make-overriding-map gdb-breakpoints-mode-map 'normal)
  (evil-set-initial-state 'gdb-breakpoints-mode 'normal))

(with-eval-after-load 'company-lsp
    (define-key company-active-map (kbd "<S-return>") 'company-lsp-complete-selection-no-snippet))

;; python
(spacemacs/set-leader-keys-for-major-mode 'python-mode "gD" 'xref-find-definitions-other-window)
(spacemacs/set-leader-keys-for-major-mode 'python-mode "ir" 'my-python-remove-unused-imports)
