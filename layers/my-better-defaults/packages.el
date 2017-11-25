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
    cnfonts
    ))

(defun my-better-defaults/init-cnfonts()
  (use-package cnfonts
    :config
    (require 'cnfonts)
    (cnfonts-enable)
    (setq cfs-profiles '("programming" "reading"))
    ))
