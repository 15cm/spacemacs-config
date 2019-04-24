;; default indent style
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-always-indent nil)

;; emmet-mode
(setq emmet-move-cursor-after-expanding nil) ;; default t

;; dockerfile-mode
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode ))
(add-to-list 'auto-mode-alist '("\\.lex\\'" . sml-lex-mode))
(add-to-list 'auto-mode-alist '("\\..*rc\\(.[a-z]+\\)+$" . shell-script-mode))

;; go
(setq go-format-before-save t)
(setq go-tab-width 4)

;; PKGBUILD
(add-to-list 'auto-mode-alist '("PKGBUILD\\'" . sh-mode))

;; smartparens hack
(defvar smartparens-mode-original-value)
