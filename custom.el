(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-toggle-key "C-M-z")
 '(evil-want-Y-yank-to-eol nil)
 '(fzf/args "-x --color bw --print-query")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (ranger pipenv helm-xref all-the-icons memoize spaceline powerline pyim-basedict pcre2el spinner ht org-category-capture alert log4e gntp markdown-mode skewer-mode json-snatcher json-reformat multiple-cursors epc ctable concurrent simple-httpd htmlize parent-mode window-purpose imenu-list haml-mode pcache gitignore-mode flyspell-correct pos-tip flycheck flx magit magit-popup git-commit ghub with-editor iedit smartparens paredit anzu highlight sbt-mode scala-mode projectile counsel swiper ivy ycmd pkg-info request-deferred let-alist request deferred epl web-completion-data dash-functional tern rtags restclient know-your-http-well lua-mode eclim inf-ruby packed anaconda-mode pythonic dash pinyinlib helm helm-core auto-complete popup org-plus-contrib evil goto-chg diminish bind-map bind-key yasnippet undo-tree sml-mode test-simple loc-changes load-relative js2-mode f s company seq auctex avy hydra async nlinum-relative nlinum csv-mode yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vlf vimrc-mode vi-tilde-fringe uuidgen use-package toc-org tagedit symon string-inflection sql-indent spaceline-all-the-icons solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe restclient-helm restart-emacs realgud rbenv rake rainbow-mode rainbow-delimiters pyvenv pytest pyim pyenv-mode py-isort pug-mode prodigy popwin pippel pip-requirements persp-mode password-generator paradox pangu-spacing ox-pandoc ox-gfm overseer orgit org-projectile org-preview-html org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-sml ob-restclient ob-http noflet nodejs-repl neotree nameless mvn multi-term move-text moonscript mmm-mode minitest meghanada maven-test-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc insert-shebang indent-guide importmagic impatient-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag groovy-mode groovy-imports gradle-mode google-translate google-c-style golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fzf fuzzy font-lock+ flyspell-correct-helm flycheck-ycmd flycheck-rtags flycheck-pos-tip flycheck-bashate flx-ido fish-mode find-by-pinyin-dired fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help ensime enh-ruby-mode emmet-mode elisp-slime-nav editorconfig dumb-jump dockerfile-mode disaster define-word dactyl-mode cython-mode counsel-projectile company-ycmd company-web company-tern company-statistics company-shell company-rtags company-restclient company-lua company-emacs-eclim company-c-headers company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow coffee-mode cnfonts clean-aindent-mode clang-format chruby centered-cursor-mode bundler beacon auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile applescript-mode aggressive-indent adaptive-wrap ace-window ace-pinyin ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(safe-local-variable-values (quote ((eval progn (pp-buffer) (indent-buffer)))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
