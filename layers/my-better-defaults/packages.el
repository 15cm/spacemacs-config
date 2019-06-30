;;; packages.el --- my-better-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sinkerine <sinkerine@Sinkerines-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst my-better-defaults-packages
  '(
    ;; cnfonts
    anzu
    vlf
    rainbow-mode
    beacon
    fzf
    yasnippet
    ))

(defun my-better-defaults/init-anzu()
  (use-package anzu
    :defer t))

(defun my-better-defaults/init-vlf()
  (use-package vlf
    :defer t))

(defun my-better-defaults/init-rainbow-mode()
  (use-package rainbow-mode
    :defer t))

(defun my-better-defaults/init-beacon()
  (use-package beacon
    :defer t))

(defun my-better-defaults/init-fzf()
  (use-package fzf
    :defer t))
(defun my-better-defaults/post-init-yasnippet()
  (define-key yas-keymap (kbd "<tab>") 'yas-next-field))
