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
    ))

;; (defun my-better-defaults/init-cnfonts()
;;   (use-package cnfonts
;;     :config
;;     (require 'cnfonts)
;;     (cnfonts-enable)
;;     (setq cfs-profiles '("programming" "reading"))
;;     ))

(defun my-better-defaults/init-anzu()
  (use-package anzu))

(defun my-better-defaults/init-vlf()
  (use-package vlf))

(defun my-better-defaults/init-rainbow-mode()
  (use-package rainbow-mode))

(defun my-better-defaults/init-beacon()
  (use-package beacon))

(defun my-better-defaults/init-fzf()
  (use-package fzf))
