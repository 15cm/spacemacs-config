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
    js2-mode
    json-mode
    nodejs-repl
    cc-mode
    sh-script
    python
    emacs-lisp
    moonscript
    web-mode
    emmet-mode
    sql
    ))

(defun my-programming/post-init-js2-mode()
  (add-hook 'js2-mode-hook 'my-js-mode-hook)
  (add-hook 'js2-mode-hook 'ycmd-mode)
  (spacemacs|add-company-backends :backends (company-files company-capf company-ycmd) :modes js2-mode))

(defun my-programming/init-nodejs-repl()
  (use-package nodejs-repl
    :init
    :defer t))

(defun my-programming/post-init-cc-mode()
  (add-hook 'c++-mode-hook 'my-cc-mode-hook)
  (add-hook 'c-mode-hook 'my-cc-mode-hook)
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (add-hook 'c-mode-hook 'ycmd-mode)
  (spacemacs|add-company-backends :backends (company-files company-capf company-c-headers company-ycmd) :modes c++-mode)
  (spacemacs|add-company-backends :backends (company-files company-capf company-c-headers company-ycmd) :modes c-mode))

(defun my-programming/post-init-sh-script()
  (add-hook 'sh-mode-hook 'my-sh-mode-hook)
  (spacemacs|add-company-backends :backends (company-files company-capf company-shell) :modes sh-mode))

(defun my-programming/post-init-python()
  (add-hook 'python-mode-hook 'my-python-mode-hook))

(defun my-programming/post-init-emacs-lisp()
  (add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook))

(defun my-programming/init-moonscript()
  (use-package moonscript
    :init
    :defer t)
  (add-hook 'moonscript-mode-hook 'my-moonscript-mode-hook))

(defun my-programming/post-init-json-mode()
  (add-hook 'json-mode-hook 'my-js-mode-hook))

(defun my-programming/post-init-web-mode()
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook #'turn-on-smartparens-mode t)
  (spacemacs|add-company-backends :backends (company-files company-capf company-css company-html) :modes web-mode))

(defun my-programming/init-emmet-mode()
  (use-package emmet-mode
    :defer t
    :config
    (progn
      (evil-define-key 'insert emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
      (evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
      (evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
      (evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
      (evil-define-key 'hybrid emmet-mode-keymap (kbd "TAB") 'indent-for-tab-command)
      (evil-define-key 'hybrid emmet-mode-keymap (kbd "<tab>") 'indent-for-tab-command)
      (evil-define-key 'insert emmet-mode-keymap (kbd "C-i") 'spacemacs/emmet-expand)
      (evil-define-key 'hybrid emmet-mode-keymap (kbd "C-i") 'spacemacs/emmet-expand))))

(defun my-programming/post-init-sql()
  (add-hook 'sql-mode-hook 'my-sql-mode-hook))
