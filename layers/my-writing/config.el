;; Tex preview
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method-active 'synctex)
(setq TeX-source-correlate-start-server t)
(setq TeX-view-program-selection '((output-pdf "PDF Expert")))
(setq TeX-view-program-list '(
        ("PDF Expert" "open -a \"PDF Expert\" %o")
        ("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o")
      ))

(with-eval-after-load 'latex
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
              (add-to-list 'TeX-command-list '("Latexmk" "latexmk -pdf %s" TeX-run-TeX nil t))
              ))
  )

;; Markdown
(setq markdown-open-command (lambda ()
                              (shell-command (format "open -a %s %s" (shell-quote-argument "/Applications/Marked 2.app") (shell-quote-argument (buffer-file-name))))))

;; Blog
(setq blog-path (concat user-home-directory "Geek/repos/15cm-site/blog"))
(setq hexo-exec "hexo")
(setq hexo-config-path "source/_data/next.yml")
(setq post-path (concat blog-path "/source/_posts"))
