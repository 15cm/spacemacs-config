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
(evil-define-key 'insert emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
(evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
(evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
(evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
(evil-define-key 'hybrid emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
(evil-define-key 'hybrid emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
(evil-define-key 'insert emmet-mode-keymap (kbd "C-i") 'spacemacs/emmet-expand)
(evil-define-key 'hybrid emmet-mode-keymap (kbd "C-i") 'spacemacs/emmet-expand)

;; gdb
(with-eval-after-load 'gdb-mi
  (evil-make-overriding-map gdb-breakpoints-mode-map 'normal)
  (evil-set-initial-state 'gdb-breakpoints-mode 'normal)
  )
