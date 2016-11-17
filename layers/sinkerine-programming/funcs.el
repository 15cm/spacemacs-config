;; hooks
(defun my-js-mode-hook ()
  (setq js2-basic-offset 2
        js-indent-level 2
        js2-include-node-externs t
        js2-strict-missing-semi-warning nil
        )
  ;; include '-' and '_' in word motion
  (modify-syntax-entry ?_ "w")
  )

(defun my-c++-mode-hook ()
  (setq c-basic-offset 4
        )
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
