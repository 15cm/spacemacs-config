;; ycmd
(setq ycmd-project-path (concat user-home-directory "Geek/opensource-application/YouCompleteMe/"))
(setq ycmd-server-command (list (concat user-home-directory ".pyenv/shims/python3") (concat ycmd-project-path "third_party/ycmd/ycmd")))
(setq ycmd-global-config (concat ycmd-project-path "global_conf.py"))
(setq ycmd-force-semantic-completion t)

;; company c headers
(setq company-c-headers-path-system '("/usr/include/c++/4.2.1/"))

;; default indent style
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-always-indent nil)

;; emmet-mode
(setq emmet-move-cursor-after-expanding nil) ;; default t

;; react-mode
(add-hook 'react-mode-hook 'ycmd-mode)
(spacemacs|add-company-backends :backends (company-files company-capf company-ycmd) :modes react-mode)

;; dockerfile-mode
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode ))
(add-to-list 'auto-mode-alist '("\\.lex\\'" . sml-lex-mode))
(add-to-list 'auto-mode-alist '("\\..*rc\\(.[a-z]+\\)+$" . shell-script-mode))

(add-to-list 'auto-mode-alist '("\\.ti[gh]$" . tiger-mode))
