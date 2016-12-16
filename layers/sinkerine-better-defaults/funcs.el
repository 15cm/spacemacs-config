;; Temporary solve overwriting of system clipboard
;; by adding two clipboard modes: system-mode, local-mode
;; (setq-default
;;  origin-interprogram-cut-function interprogram-cut-function
;;  origin-interprogram-paste-function interprogram-paste-function
;;  my-osx-paste-mode-system-flag nil
;;  )
;; (defun copy-from-osx ()
;;   (shell-command-to-string "pbpaste"))
;; (defun paste-to-osx (text &optional push)
;;   (let ((process-connection-type nil))
;;     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;       (process-send-string proc text)
;;       (process-send-eof proc))))

;; (defun switch-clipboard-mode ()
;;   (interactive)
;;   (if (not my-osx-paste-mode-system-flag)
;;       ;; (progn (setq-default interprogram-cut-function 'pbcopy-select-text)
;;       (progn (setq-default interprogram-cut-function 'paste-to-osx)
;;              (setq-default interprogram-paste-function 'copy-from-osx)
;;              (setq-default my-osx-paste-mode-system-flag t)
;;              (message "system-mode")
;;              )
;;     (progn (setq-default interprogram-cut-function origin-interprogram-cut-function)
;;            (setq-default interprogram-paste-function origin-interprogram-paste-function)
;;            (setq-default my-osx-paste-mode-system-flag nil)
;;            (message "local-mode")
;;            ))
;;   )

(defun my-find-notes ()
  (interactive)
  (fzf-directory "~/Geek/Wiki/notes/")
  )

(defun my-find-codes ()
  (interactive)
  (fzf-directory "~/Geek/Wiki/static/code/")
  )
