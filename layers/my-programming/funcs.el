;; show function name in header line
;; (defun set-header-line ()
;;   (which-function-mode)
;;   (setq header-line-format
;;         '((which-function-mode ("" which-func-format " ")))))

(defun my-pyenv-find-exec (name dir)
  (let ((pyenv-version (getenv "PYENV_VERSION")))
    (setenv "PYENV_VERSION" nil)
    (let* ((pyenv-command-path (executable-find "pyenv"))
           (path (when pyenv-command-path
                   (shell-command-to-string
                    (format "PYENV_DIR='%s' %s which %s"
                            dir pyenv-command-path name)))))
      (setenv "PYENV_VERSION" pyenv-version)
      path)))

;; (defun my-python-generate-imports ()
;;   "Add default imports to python files"
;;   (interactive)
;;   (let ((surround-content-begin "# fmt: off")
;;         (surround-content-end "# fmt: on")
;;         (generated-tag  "# [auto_generated][imports_future]")
;;         (generated-content "from __future__ import annotations"))
;;     (save-excursion
;;       (goto-char (point-min))
;;       (unless (search-forward generated-tag nil t)
;;         (goto-char (point-min))
;;         (insert surround-content-begin)
;;         (newline)
;;         (insert (concat generated-content " " generated-tag))
;;         (newline)
;;         (insert surround-content-end)
;;         (newline))
;;       )))

(defun my-python-remove-unused-imports()
  "Use Autoflake to remove unused function with multi-line
import workaround patched.
https://github.com/myint/autoflake/issues/8"
  "autoflake --remove-all-unused-imports -i unused_imports.py"
  (interactive)
  "Fixes multi-line import when removing unused imports via
autoflake. "
  (let ((py-isort-options '("-rc" "-sl")))
    (py-isort-buffer))
  (if (executable-find "autoflake")
      (progn
        (write-region nil nil (buffer-file-name))
        (shell-command (format "autoflake --remove-all-unused-imports -i %s"
                               (shell-quote-argument (buffer-file-name))))
        (revert-buffer t t t))
    (message "Error: Cannot find autoflake executable.")))

;; hooks
(defun my-js-mode-hook()
  (setq js2-basic-offset 2
        js-indent-level 2
        js2-include-node-externs t
        js2-strict-missing-semi-warning nil
        js2-bounce-indent-p t
        ))

(defun my-typescript-mode-hook ()
  (setq typescript-indent-level 2))

(defun run-node (cwd)
  (interactive "Directory: ")
  (let ((default-directory cwd))
    (pop-to-buffer (make-comint (format "node-repl-%s" cwd) "node" nil "--interactive"))))


(defun my-cc-mode-hook()
  (setq c-basic-offset 4)
  (setq c-auto-newline nil)
  (eval-after-load 'editorconfig
    (editorconfig-apply))
  )

(defun my-go-mode-hook ()
  (remove-hook 'go-mode-hook 'go-eldoc-setup))

(defun my-sh-mode-hook()
  (setq sh-basic-offset 2
        sh-indentation 2
        tab-width 2))

(defun my-python-mode-hook()
  (apheleia-mode 1)
  (semantic-mode 0))

(defun my-elisp-mode-hook())

(defun my-moonscript-mode-hook()
  (setq moonscript-indent-offset 2)
  (setq comment-start "-- "))

(defun my-json-mode-hook()
  (make-local-variable 'js-indent-level)
  (setq js-indent-level 2))

(defun flycheck-node_modules-executable-find (executable)
    (or
      (let* ((base (locate-dominating-file buffer-file-name "node_modules"))
            (cmd  (if base (expand-file-name (concat "node_modules/.bin/" executable)  base))))
        (if (and cmd (file-exists-p cmd))
            cmd))
      (flycheck-default-executable-find executable)))

(defun my-web-mode-hook()
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-auto-quoting nil)
  (set-face-background 'web-mode-current-element-highlight-face "color-99")
  (defun sp-web-mode-is-code-context (id action context)
    (and (eq action 'insert)
         (not (or (get-text-property (point) 'part-side)
                  (get-text-property (point) 'block-side)))))

  (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))
  (auto-rename-tag-mode t)

  ;; Flycheck eslint.
  ;; Find node executable by path because `npx' was not supported by flycheck
  ;; https://github.com/flycheck/flycheck/issues/1428.
  (setq-local flycheck-executable-find #'flycheck-node_modules-executable-find)
  (flycheck-add-next-checker 'javascript-eslint))

(defun my-sql-mode-hook()
  (setq tab-width 2))

(defun my-sml-cm-mode-hook()
  (setq-local comment-start "(* ")
  (setq-local comment-end " *)"))

(defun disable-sp-hippie-advice (&rest _)
  (setq smartparens-mode-original-value smartparens-mode)
  (setq smartparens-mode nil)
  t) ; We should still return t.

(defun reenable-sp-hippie-advice (&rest _)
  (when (boundp 'smartparens-mode-original-value)
    (setq smartparens-mode smartparens-mode-original-value)
    (makunbound 'smartparens-mode-original-value)))

(defun my-toml-mode-hook ()
  (setq c-basic-offset 2)
  (setq tab-width 2))

(defun my-caddyfile-mode-hook ()
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode nil))

