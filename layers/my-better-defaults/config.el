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

;; clipboard
(setq select-enable-clipboard nil)

(defvar auto-mode-alist-has-been-patched nil
  "Mark whether the auto-mode-list has been patched")

(with-eval-after-load "ispell"
        (setq ispell-program-name "hunspell")
        ;; ispell-set-spellchecker-params has to be called
        ;; before ispell-hunspell-add-multi-dic will work
        (ispell-set-spellchecker-params)
        (ispell-find-hunspell-dictionaries)
        (setq ispell-dictionary "en_US"))
