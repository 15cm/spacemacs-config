;;; packages.el --- my-programming layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sinkerine <sinkerine@Sinkerines-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst my-programming-packages
  '(
    company
    js2-mode
    json-mode
    nodejs-repl
    cc-mode
    sh-script
    python-mode
    enh-ruby-mode
    emacs-lisp
    moonscript
    web-mode
    sql
    sml-mode
    applescript-mode
    dockerfile-mode
    ))

(defun my-programming/post-init-company()
  (spacemacs|add-company-backends :backends (company-c-headers company-rtags) :modes c++-mode)
  (spacemacs|add-company-backends :backends (company-c-headers company-rtags) :modes c-mode)
  (spacemacs|add-company-backends :backends (company-dabbrev-code) :modes sh-mode)
  (spacemacs|add-company-backends :backends (company-anaconda) :modes python-mode)
  )

(defun my-programming/post-init-js2-mode()
  (add-hook 'js2-mode-hook 'my-js-mode-hook)
  )

(defun my-programming/init-nodejs-repl()
  (use-package nodejs-repl
    :init
    :defer t))

(defun my-programming/post-init-cc-mode()
  (add-hook 'c++-mode-hook 'my-cc-mode-hook)
  (add-hook 'c-mode-hook 'my-cc-mode-hook)
  (add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
  (add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)
  )

(defun my-programming/post-init-sh-script()
  (add-hook 'sh-mode-hook 'my-sh-mode-hook)
  )

(defun my-programming/post-init-python-mode()
  (add-hook 'python-mode-hook 'my-python-mode-hook))

(defun my-programming/post-init-enh-ruby-mode()
    (spacemacs|add-company-backends :backends (company-robe company-dabbrev-code)
                                  :modes ruby-mode enh-ruby-mode)
  )

(defun my-programming/post-init-emacs-lisp()
  (add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook))

(defun my-programming/init-moonscript()
  (use-package moonscript
    :init
    :defer t
    :config
    (add-hook 'moonscript-mode-hook 'my-moonscript-mode-hook)
    ))

(defun my-programming/post-init-json-mode()
  (add-hook 'json-mode-hook 'my-js-mode-hook))

(defun my-programming/post-init-web-mode()
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
  )

(defun my-programming/post-init-sql()
  (add-hook 'sql-mode-hook 'my-sql-mode-hook))

(defun my-programming/post-init-sml-mode()
  (add-hook 'sml-cm-mode-hook 'my-sml-cm-mode-hook))

(defun my-programming/init-applescript-mode()
  (use-package applescript-mode))

(defun my-programming/init-dockerfile-mode()
  (use-package dockerfile-mode))
