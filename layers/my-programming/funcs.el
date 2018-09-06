;; show function name in header line
(defun set-header-line ()
  (which-func-mode)
  (setq header-line-format
        '((which-func-mode ("" which-func-format " ")))))

;; hooks
(defun my-js-mode-hook()
  (setq js2-basic-offset 2
        js-indent-level 2
        js2-include-node-externs t
        js2-strict-missing-semi-warning nil
        js2-bounce-indent-p t
        )
  ;; include '_' in word motion
  (modify-syntax-entry ?_ "w")
  (set-header-line)
  )

(defun run-node (cwd)
  (interactive "Directory: ")
  (let ((default-directory cwd))
    (pop-to-buffer (make-comint (format "node-repl-%s" cwd) "node" nil "--interactive"))))


(defun my-cc-mode-hook()
  (setq c-basic-offset 4)
  (setq c-auto-newline nil)
  (modify-syntax-entry ?_ "w")
  (set-header-line)
  ;; auto enable cquery
  (when
      (and (not (and (boundp 'lsp-mode) lsp-mode))
           ;; (or
           ;;  (cl-some (lambda (x) (string-match-p x buffer-file-name)) my-cquery-whitelist)
           ;;  (cl-notany (lambda (x) (string-match-p x buffer-file-name)) my-cquery-blacklist))
      (or (locate-dominating-file default-directory "compile_commands.json")
          (locate-dominating-file default-directory ".cquery")))
    (setq eldoc-idle-delay 0.2)
    (lsp-cquery-enable)
    (when (>= emacs-major-version 26)
      (lsp-ui-doc-mode 1)))
  )

(defun my-sh-mode-hook()
  (setq sh-basic-offset 2
        sh-indentation 2
        tab-width 2))

(defun my-python-mode-hook()
  (modify-syntax-entry ?_ "w")
  (set-header-line)
  )

(defun my-elisp-mode-hook()
  (modify-syntax-entry ?- "w")
  (set-header-line)
  )

(defun my-moonscript-mode-hook()
  (setq moonscript-indent-offset 2)
  (setq comment-start "-- "))

(defun my-json-mode-hook()
  (make-local-variable 'js-indent-level)
  (setq js-indent-level 2))

(defun my-web-mode-hook()
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (set-face-background 'web-mode-current-element-highlight-face "color-99")
  (defun sp-web-mode-is-code-context (id action context)
    (and (eq action 'insert)
         (not (or (get-text-property (point) 'part-side)
                  (get-text-property (point) 'block-side)))))

  (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context)))

(defun my-sql-mode-hook()
  (setq tab-width 2))

(defun my-sml-cm-mode-hook()
  (setq-local comment-start "(* ")
  (setq-local comment-end " *)"))
