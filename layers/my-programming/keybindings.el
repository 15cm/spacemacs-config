(spacemacs/declare-prefix-for-mode 'js2-mode "n" "nodejs-repl")
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "ns" 'nodejs-repl-switch-to-repl)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "nr" 'nodejs-repl-send-region)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "nb" 'nodejs-repl-send-buffer)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "ne" 'nodejs-repl-send-last-sexp)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "ni" 'run-node)

(evil-leader/set-key "jgd" 'dumb-jump-go)
(evil-leader/set-key "jgD" 'dumb-jump-go-other-window)
(evil-leader/set-key "jgb" 'dumb-jump-back)
(evil-leader/set-key "jgp" 'dumb-jump-go-prompt)
(evil-leader/set-key "jgq" 'dumb-jump-quick-look)

;; emmet mode
(evil-define-key 'insert emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
(evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
(evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
(evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
(evil-define-key 'hybrid emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
(evil-define-key 'hybrid emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
(evil-define-key 'insert emmet-mode-keymap (kbd "C-i") 'spacemacs/emmet-expand)
(evil-define-key 'hybrid emmet-mode-keymap (kbd "C-i") 'spacemacs/emmet-expand)
