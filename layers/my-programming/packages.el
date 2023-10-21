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
    yasnippet
    js2-mode
    typescript-mode
    json-mode
    cc-mode
    go-mode
    sh-script
    (python :location built-in)
    enh-ruby-mode
    emacs-lisp
    moonscript
    web-mode
    sql
    sml-mode
    applescript-mode
    dockerfile-mode
    caddyfile-mode
    toml-mode
    company-fuzzy
    apheleia
    (lark-mode :location local)))

(defun my-programming/post-init-company()
  (spacemacs|add-company-backends :backends (company-dabbrev-code) :modes sh-mode))

(defun my-programming/post-init-yasnippet ()
  (with-eval-after-load 'yasnippet
    ;; Better fix for conflict of yasnippet and smartparens
    ;; https://github.com/joaotavora/yasnippet/issues/785
    ;; This advice could be added to other functions that usually insert
    ;; balanced parens, like `try-expand-list'.
    (advice-add 'yas-hippie-try-expand :after-while #'disable-sp-hippie-advice)

    (advice-add 'hippie-expand :after #'reenable-sp-hippie-advice
                ;; Set negative depth to make sure we go after
                ;; `sp-auto-complete-advice'.
                '((depth . -100)))

    ;; Add global snippets(provided by fundamental-mode)
    ;; https://github.com/joaotavora/yasnippet/issues/557
    (add-hook 'yas-minor-mode-hook
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))
    ))

(defun my-programming/post-init-js2-mode()
  (add-hook 'js2-mode-hook 'my-js-mode-hook))

(defun my-programming/post-init-typescript-mode()
  (add-hook 'typescript-mode-hook 'my-typescript-mode-hook))

(defun my-programming/post-init-cc-mode()
  (add-hook 'c++-mode-hook 'my-cc-mode-hook)
  (add-hook 'c-mode-hook 'my-cc-mode-hook))

(defun my-programming/post-init-go-mode()
  (add-hook 'go-mode-hook 'my-go-mode-hook))

(defun my-programming/post-init-sh-script()
  (add-hook 'sh-mode-hook 'my-sh-mode-hook))

(defun my-programming/init-python()
  (use-package python
    :defer t
    :config
    (add-hook 'python-mode-hook 'my-python-mode-hook)))

(defun my-programming/post-init-enh-ruby-mode()
    (spacemacs|add-company-backends :backends (company-robe company-dabbrev-code)
                                    :modes ruby-mode enh-ruby-mode))

(defun my-programming/post-init-emacs-lisp()
  (add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook))

(defun my-programming/init-moonscript()
  (use-package moonscript
    :defer t
    :config
    (add-hook 'moonscript-mode-hook 'my-moonscript-mode-hook)
    ))

(defun my-programming/post-init-json-mode()
  (add-hook 'json-mode-hook 'my-js-mode-hook))

(defun my-programming/post-init-web-mode()
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  (add-hook 'web-mode-hook #'turn-on-smartparens-mode t))

(defun my-programming/post-init-sql()
  (add-hook 'sql-mode-hook 'my-sql-mode-hook))

(defun my-programming/post-init-sml-mode()
  (add-hook 'sml-cm-mode-hook 'my-sml-cm-mode-hook))

(defun my-programming/init-applescript-mode()
  (use-package applescript-mode
    :defer t))

(defun my-programming/init-dockerfile-mode()
  (use-package dockerfile-mode
    :defer t))

(defun my-programming/init-caddyfile-mode()
  (use-package caddyfile-mode
    :defer t
    :config
    (add-hook 'caddyfile-mode-hook 'my-caddyfile-mode-hook)))

(defun my-programming/post-init-toml-mode ()
  (add-hook 'toml-mode-hook 'my-toml-mode-hook))

(defun my-programming/init-apheleia ()
  (use-package apheleia
    :defer t
    :config
    (setf (alist-get 'isort apheleia-formatters)
          '("isort" "--stdout" "-"))
    (setf (alist-get 'isort apheleia-formatters)
          '("docformatter" "-"))
    (setf (alist-get 'python-mode apheleia-formatters)
          '(black isort docformatter))
    ))

(defun my-programming/init-prisma-mode ()
  (use-package prisma-mode
    :defer t))

(defun my-programming/init-company-fuzzy ()
  (use-package company-fuzzy
    :defer t))

(defun my-programming/init-lark-mode ()
  (use-package lark-mode
    :commands (lark-mode)))
