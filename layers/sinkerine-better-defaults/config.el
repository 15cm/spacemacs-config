(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
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

;; Chinese font
(if (display-graphic-p)
    (spacemacs//set-monospaced-font "M+ 1m" "Hiragino Sans GB W3" 12 12)
    )

;; emoji (not work)
;; (defun my-set-emoji-font (&optional frame)
;;   "Adjust the font settings of FRAME so Emacs can display emoji properly."
;;   ;; For NS/Cocoa
;;   (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)
;;   )
;; (my-set-emoji-font)
;; (add-hook 'after-make-frame-functions 'my-set-emoji-font)
