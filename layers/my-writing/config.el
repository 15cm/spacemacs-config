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
    ))

;; Markdown
(if (my-system-typep-darwin)
    (setq markdown-open-command (lambda ()
                                  (shell-command (format "open -a %s %s" (shell-quote-argument "/Applications/Marked 2.app") (shell-quote-argument (buffer-file-name))))))
  )
