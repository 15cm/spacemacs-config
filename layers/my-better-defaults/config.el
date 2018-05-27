;; (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
;; (set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; encoding for repl env
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

;; pangu-spacing
(setq pangu-spacing-real-insert-separtor t)

;; disable copying to system clipboard on macOS
;; (case system-type
;;   ('darwin (setq select-enable-clipboard nil))
;;   ('gnu/linux (setq select-enable-clipboard t)))
(setq select-enable-clipboard nil)
(case system-type
  ('gnu/linux (progn
                (setq interprogram-cut-function nil)
                (setq interprogram-paste-function 'x-paste-function))))

