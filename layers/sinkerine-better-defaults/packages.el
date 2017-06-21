;;; packages.el --- sinkerine-better-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sinkerine <sinkerine@Sinkerines-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst sinkerine-better-defaults-packages
  '(
    chinese-fonts-setup
    )
  )

(defun sinkerine-better-defaults/init-chinese-fonts-setup()
  (use-package chinese-fonts-setup
    :config
    (require 'chinese-fonts-setup)
    (chinese-fonts-setup-enable)
    (setq cfs-profiles '("programming" "reading" "spare"))
    )
  )
