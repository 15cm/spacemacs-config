;; hooks
(defun my-js-mode-hook()
  (setq js2-basic-offset 2
        js-indent-level 2
        js2-include-node-externs t
        js2-strict-missing-semi-warning nil
        )
  ;; include '_' in word motion
  (modify-syntax-entry ?_ "w")
  )

(defun run-node (cwd)
  (interactive "Directory: ")
  (let ((default-directory cwd))
    (pop-to-buffer (make-comint (format "node-repl-%s" cwd) "node" nil "--interactive"))))


(defun my-cc-mode-hook()
  (setq c-basic-offset 4)
  (modify-syntax-entry ?_ "w")
  )

(defun my-sh-mode-hook()
  (setq sh-basic-offset 2
        sh-indentation 2
        tab-width 2
        )
  )

(defun my-python-mode-hook()
  (modify-syntax-entry ?_ "w")
  )

(defun my-elisp-mode-hook()
  (modify-syntax-entry ?- "w")
  )

(defun my-moonscript-mode-hook()
  (setq moonscript-indent-offset 2)
  (setq comment-start "-- ")
  )

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

  (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))
  )
