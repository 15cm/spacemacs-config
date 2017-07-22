;; Tex preview
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method-active 'synctex)
(setq TeX-source-correlate-start-server t)
(setq TeX-view-program-selection '((output-pdf "Skim")))
(setq TeX-view-program-list 
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o")))

(with-eval-after-load 'latex
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))))
  )

;; Markdown
(setq markdown-open-command "~/.spacemacs.d/plugins/open-markdown-marked2.sh")

;; Blog
(setq blog-path (concat user-home-directory "Geek/repos/15cm-site/blog"))
(setq hexo-exec (concat node-bin-path "/hexo"))
(setq post-path (concat blog-path "/source/_posts"))
(setq qiniu-domain "http://7xrgcf.com1.z0.glb.clouddn.com")

