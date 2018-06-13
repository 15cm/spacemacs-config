;; Tex preview
(setq TeX-source-correlate-mode t
      TeX-source-correlate-method-active 'synctex
      TeX-source-correlate-start-server t
      )

(with-eval-after-load 'latex
  (progn
    (if (my-system-typep-darwin)
        ;; Set PDF Expert as the default PDF viewer.
        (progn
          (setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "PDF Expert")
          (add-to-list 'TeX-view-program-list '("PDF Expert" "open -a \"PDF Expert\" %o"))
          )
      ;; Set Okular as the default PDF viewer.
      (setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Okular"))
    (add-hook 'LaTeX-mode-hook
              (lambda ()
                (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
                (add-to-list 'TeX-command-list '("Latexmk" "latexmk -pdf %s" TeX-run-TeX nil t))
                ))
    ))

;; Markdown
(if (my-system-typep-darwin)
    (setq markdown-open-command (lambda ()
                                  (shell-command (format "open -a %s %s" (shell-quote-argument "/Applications/Marked 2.app") (shell-quote-argument (buffer-file-name))))))
  )

;; Blog
(setq blog-path (concat user-home-directory "tech/15cm-site/blog")
      hexo-exec "hexo"
      hexo-config-path "source/_data/next.yml"
      post-path (concat blog-path "/source/_posts")
      )
