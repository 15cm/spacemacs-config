(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   '(("XeLaTeX" "%`xelatex -8bit -shell-escape --synctex=1%(mode)%' %t" TeX-run-TeX nil t)
     ("Latexmk" "latexmk -pdf %s" TeX-run-TeX nil t)
     ("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t t :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command")))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(auth-source-save-behavior nil)
 '(beacon-color "#cc6666")
 '(blacken-allow-py36 nil)
 '(c-default-style
   '((c++-mode . "linux")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(company-auctex-arg-lookup-table
   '((TeX-arg-define-macro "\\MacroName")
     (TeX-arg-counter "Counter")
     (TeX-arg-define-counter "\\CounterName")
     (TeX-arg-file "Filename")
     (TeX-arg-bibliography "Filename")
     (TeX-arg-bibstyle "Style")
     (TeX-arg-environment "Environment")
     (TeX-arg-define-environment "EnvironmentName")
     (TeX-arg-size "(w, h)")
     (TeX-arg-ref "Name")
     (TeX-arg-index "Index")
     (TeX-arg-define-label "Label")
     (LaTeX-arg-section "Title")
     (LaTeX-arg-usepackage "Package")
     (LaTeX-arg-detokenize "text")
     (LaTeX-env-label)
     (LaTeX-amsmath-env-aligned
      ["htbp!"])
     (LaTeX-amsmath-env-alignat
      ["# Columns"])
     (LaTeX-env-array
      ["bct"]
      "lcrpmb|")
     (LaTeX-env-item)
     (LaTeX-env-document)
     (LaTeX-env-figure
      ["htbp!"])
     (LaTeX-env-contents "Filename")
     (LaTeX-env-minipage
      ["htbp!"]
      "Width")
     (LaTeX-env-list "Label" "\\itemsep,\\labelsep,...")
     (LaTeX-env-picture "(w, h)" "(x, y)")
     (LaTeX-env-tabular* "Width"
                         ["htbp!"]
                         "lcrpmb|><")
     (LaTeX-env-bib "WidestLabel")
     (TeX-arg-conditional
      [""])
     (2 "" "")
     (3 "" "" "")
     (4 "" "" "" "")
     (5 "" "" "" "" "")
     (6 "" "" "" "" "" "")
     (7 "" "" "" "" "" "" "")
     (8 "" "" "" "" "" "" "" "")
     (9 "" "" "" "" "" "" "" "" "")))
 '(company-statistics-file "~/.emacs.d/.cache/company-statistics-cache.el")
 '(compilation-message-face 'default)
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)
     ((:application eshell)
      eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state=abcde" "-o" "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . tramp-ps-time)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o" "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (user . string)
       (group . string)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (ttname . string)
       (time . tramp-ps-time)
       (nice . number)
       (etime . tramp-ps-time)
       (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (group . string)
       (comm . 52)
       (state . string)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . number)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh")
      (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":")
      (null-device . "/dev/null"))
     (eshell-connection-default-profile
      (eshell-path-env-list))))
 '(create-lockfiles nil)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "fa3328c4b23fdba77a360fff513b4a6b2ad44e39b70b650bd5f3407bed60b784" "66d837d5bad27c5ea9480d07048d1a469678823c42daea672e3a7dd4fac6a1bf" "07b0650a8c00ccdc946e8452f931384b536e761106fc7c81e62ba2fb6afef8b6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))
 '(delete-by-moving-to-trash t)
 '(emojify-display-style 'unicode)
 '(emojify-emoji-json "/home/sinkerine/.spacemacs.d/data/emoji.json")
 '(enable-local-variables :all)
 '(evil-toggle-key "C-M-z")
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(flycheck-disabled-checkers '(python-pylint))
 '(flycheck-javascript-eslint-executable "eslint")
 '(frame-background-mode 'dark)
 '(fzf/args "-x --color bw --print-query")
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   '(("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100)))
 '(hl-bg-colors
   '("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")))
 '(magit-delete-by-moving-to-trash nil)
 '(magit-diff-use-overlays nil)
 '(magit-git-global-arguments
   '("--no-pager" "-c" "core.preloadindex=true" "-c" "log.showSignature=false" "-c" "color.ui=false" "-c" "color.diff=false"))
 '(my-org-wiki/blog-post-project-root "~/tech/15cm-site/blog")
 '(my-org/blog-post-project-root "/home/sinkerine/tech/15cm-site/blog")
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(org-attach-auto-tag nil)
 '(org-cliplink-simpleclip-source t)
 '(org-roam-db-update-method 'immediate)
 '(org-roam-directory "~/org/")
 '(org-roam-file-exclude-regexp '("\\.stversions/" "data/"))
 '(org-roam-node-display-template "${title:60} ${tags:40}")
 '(org-roam-tag-sources '(prop vanilla))
 '(org-use-property-inheritance t)
 '(package-selected-packages
   '(esup company-emoji emoji-cheat-sheet-plus wfnames emojify rustic embark-consult compleseus-spacemacs-help consult-lsp consult-yasnippet embark flyspell-correct-popup marginalia orderless vertico wgrep loop caddyfile-mode helm-nixos-options nix-mode nixos-options org-roam orgit-forge string-edit-at-point forge closql orgit eldoc company-nixos-options emacsql-sqlite-builtin help-fns+ hide-comnt journalctl-mode kbd-mode xref load-env-vars pylookup shfmt reformatter space-doc spacemacs-whitespace-cleanup term-cursor tree-sitter tsc treemacs queue vim-powerline evil-evilified-state holy-mode code-cells lsp-docker evil-tex multi-vterm spacemacs-purpose-popwin compat tree-sitter-langs elisp-def treemacs-persp treemacs-icons-dired string-edit quickrun pydoc prisma-mode org-contrib npm-mode nose multi-line shut-up keychain-environment inspector info+ git-modes gendoxy yaml annalist emmet-mode edit-indirect drag-stuff company-fuzzy auto-rename-tag evil-collection apheleia company-math math-symbol-lists org-roam-server poetry cfrs emacsql-sqlite3 direnv pony-mode py-docformatter valign lsp-latex grip-mode evil-easymotion dired-quick-sort sphinx-doc org-rich-yank lsp-origami origami ron-mode lsp-pyright org-superstar posframe emr lsp-haskell intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell dante lcr company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode attrap lsp-ui dap-mode lsp-treemacs lsp-mode magit-section org-ql peg ov org-super-agenda ts flycheck-elsa mixed-pitch unicode-fonts ucs-utils font-utils persistent-soft list-utils terminal-here helm-ls-git vterm treemacs-magit hybrid-mode add-node-modules-path tide bui tree-mode xr lsp-scala helm-org go-impl rubocopfmt lsp-python-ms python cpp-auto-include company-reftex geiser devdocs toml-mode symbol-overlay racer flycheck-rust cargo rust-mode helm-lsp flycheck-package package-lint blacken company-go company-quickhelp flycheck-golangci-lint godoctor go-tag go-rename go-guru go-gen-test go-fill-struct go-eldoc go-mode import-js grizzl evil-textobj-line lv transient treemacs-projectile treemacs-evil pfuture emacsql systemd writeroom-mode visual-fill-column helm-org-rifle ccls simpleclip org-cliplink doom-modeline eldoc-eval shrink-path treepy graphql eglot jsonrpc twilight-bright-theme phpunit phpcbf php-extras php-auto-yasnippets drupal-mode company-php ac-php-core xcscope php-mode company-lsp lsp-python lsp-javascript-typescript lsp-java cquery evil-lisp-state typescript-mode prettier-js helm-git-grep seeing-is-believing chinese-conv gitignore-templates dotenv-mode nginx-mode rjsx-mode magit-svn json-navigator hierarchy evil-goggles magithub ghub+ apiwrap magit-gh-pulls github-search github-clone git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito diff-hl browse-at-remote stickyfunc-enhance srefactor swift-mode ranger pipenv helm-xref all-the-icons memoize spaceline powerline pyim-basedict pcre2el spinner ht org-category-capture alert log4e gntp markdown-mode skewer-mode json-snatcher json-reformat multiple-cursors epc ctable concurrent simple-httpd htmlize parent-mode window-purpose imenu-list haml-mode pcache gitignore-mode flyspell-correct pos-tip flycheck flx magit magit-popup git-commit ghub with-editor iedit smartparens paredit anzu highlight sbt-mode scala-mode projectile counsel swiper ivy ycmd pkg-info request-deferred let-alist request deferred epl web-completion-data dash-functional tern rtags restclient know-your-http-well lua-mode eclim inf-ruby packed anaconda-mode pythonic dash pinyinlib helm helm-core auto-complete popup org-plus-contrib evil goto-chg diminish bind-map bind-key yasnippet undo-tree sml-mode test-simple loc-changes load-relative js2-mode f s company seq auctex avy hydra async nlinum-relative nlinum csv-mode yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vlf vimrc-mode vi-tilde-fringe uuidgen use-package toc-org tagedit symon string-inflection sql-indent spaceline-all-the-icons solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe restclient-helm restart-emacs realgud rbenv rake rainbow-mode rainbow-delimiters pyvenv pytest pyim pyenv-mode py-isort pug-mode prodigy popwin pippel pip-requirements persp-mode password-generator paradox pangu-spacing ox-pandoc ox-gfm overseer org-projectile org-preview-html org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-sml ob-restclient ob-http noflet nodejs-repl neotree nameless mvn multi-term move-text moonscript mmm-mode minitest meghanada maven-test-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc insert-shebang indent-guide importmagic impatient-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag groovy-mode groovy-imports gradle-mode google-translate google-c-style golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fzf fuzzy font-lock+ flyspell-correct-helm flycheck-ycmd flycheck-rtags flycheck-pos-tip flycheck-bashate flx-ido fish-mode find-by-pinyin-dired fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help ensime enh-ruby-mode elisp-slime-nav editorconfig dumb-jump dockerfile-mode disaster define-word dactyl-mode cython-mode counsel-projectile company-ycmd company-web company-tern company-statistics company-shell company-rtags company-restclient company-lua company-emacs-eclim company-c-headers company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow coffee-mode clean-aindent-mode clang-format chruby centered-cursor-mode bundler beacon auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile applescript-mode aggressive-indent adaptive-wrap ace-window ace-pinyin ace-link ace-jump-helm-line ac-ispell))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(persp-autokill-buffer-on-remove 'kill-weak)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(pyenv-mode nil)
 '(recentf-max-saved-items 5000)
 '(safe-local-variable-values
   '((python-shell-extra-pythonpaths "/home/sinkerine/tech/repo/otominato-server/__pypackages__/3.10/lib")
     (python-shell-extra-pythonpaths "/home/sinkerine/tech/repo/otominato-server/otominato/__pypackages__/3.10/lib")
     (python-shell-process-environment "DJANGO_SETTINGS_MODULE=otominato.settings.dev" "OTOMINATO_CONFIG_PATH=$HOME/tech/repo/otominato-server/environments/dev/otominato-dev.toml")))
 '(save-interprogram-paste-before-kill nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sp-escape-quotes-after-insert nil)
 '(sp-navigate-interactive-always-progress-point t)
 '(split-height-threshold nil)
 '(sql-postgres-login-params
   '((user :default "postgres")
     (server :default "localhost")
     (database :default "postgres" :completion
               #[771 "\211\242\302=\206\12\0\211\303=?\2053\0r\301\204\27\0p\202(\0\304 \305\1!\203%\0\306\1!\202&\0p\262\1q\210\307\1\300\5!\5\5$)\207"
                     [#[257 "\300 \207"
                            [sql-postgres-list-databases]
                            2 "\12\12(fn _)"]
                      nil boundaries metadata minibuffer-selected-window window-live-p window-buffer complete-with-action]
                     8 "\12\12(fn STRING PRED ACTION)"]
               :must-match confirm)))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(treemacs-follow-mode t)
 '(treemacs-fringe-indicator-mode nil)
 '(treemacs-show-cursor nil)
 '(vc-annotate-background-mode nil)
 '(warning-suppress-log-types
   '((use-package)
     (use-package)
     ((editorconfig editorconfig--advice-find-file-noselect))
     (comp)))
 '(warning-suppress-types
   '((emacs)
     (use-package)
     ((editorconfig editorconfig--advice-find-file-noselect))
     (comp)))
 '(weechat-color-list
   '(unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))
 '(window-divider-mode nil)
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Nerd Font Mono" :foundry "UKWN" :slant normal :weight regular :height 128 :width normal))))
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
