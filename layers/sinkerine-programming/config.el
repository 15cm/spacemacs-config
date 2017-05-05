;; ycmd
(setq ycmd-server-command (list "/usr/local/bin/python" (concat user-home-directory ".spacemacs.d/plugins/YouCompleteMe/third_party/ycmd/ycmd/")))
(setq ycmd-global-config (concat user-home-directory ".spacemacs.d/plugins/YouCompleteMe/global_conf.py"))
(setq ycmd-force-semantic-completion t)

;; company c headers
(setq c-c++-enable-clang-support nil)
(setq company-c-headers-path-system '("/usr/include/c++/4.2.1/"))

;; default indent style
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-always-indent nil)

;; emmet-mode
(setq emmet-move-cursor-after-expanding nil) ;; default t
