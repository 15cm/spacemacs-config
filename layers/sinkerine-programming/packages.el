;;; packages.el --- sinkerine-programming layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sinkerine <sinkerine@Sinkerines-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst sinkerine-programming-packages
  '(
    js2-mode
    nodejs-repl
    applescript-mode
    editorconfig
    cc-mode
    sh-script
    python
    emacs-lisp
    moonscript
    )
  )

(defun sinkerine-programming/post-init-js2-mode ()
  (add-hook 'js2-mode-hook 'my-js-mode-hook)
  )

(defun sinkerine-programming/init-nodejs-repl ()
  (use-package nodejs-repl
    :init
    :defer t
    ))

(defun sinkerine-programming/post-init-cc-mode ()
  (add-hook 'c++-mode-hook 'my-c++-mode-hook)
  (add-hook 'c-mode-hook 'my-c++-mode-hook)
  )

(defun sinkerine-programming/post-init-sh-script ()
  (add-hook 'sh-mode-hook 'my-sh-mode-hook)
  )

(defun sinkerine-programming/post-init-python()
  (add-hook 'python-mode-hook 'my-python-mode-hook)
  )

(defun sinkerine-programming/post-init-emacs-lisp()
  (add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook))
(defun sinkerine-programming/init-moonscript ()
  (use-package moonscript
    :init
    :defer t
    )
  (add-hook 'moonscript-mode-hook 'my-moonscript-mode-hook)
  )
