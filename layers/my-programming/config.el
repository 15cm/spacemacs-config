;; company c headers
(setq company-c-headers-path-system '("/usr/include/c++/4.2.1/"))

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

(add-to-list 'auto-mode-alist '("\\.ti[gh]$" . tiger-mode))

;; smartparens hack
(defvar smartparens-mode-original-value)
