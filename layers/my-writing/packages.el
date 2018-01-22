;; packages.el --- my-writting layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sinkerine <sinkerine@Sinkerines-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst my-writing-packages
  '(
    org
    impatient-mode
    org-preview-html
    prodigy
    ))

(defun my-writing/init-impatient-mode()
  (use-package impatient-mode
    :defer t)
  (add-hook 'impatient-mode-hook 'my-impatient-mode-hook))

(defun my-writing/init-org-preview-html()
  (use-package org-preview-html
    :defer t))

(defun my-writing/post-init-org()
  (with-eval-after-load 'org
    (progn
      (define-key org-mode-map (kbd "<drag-n-drop>") 'my-dnd-func)
      (define-key org-mode-map (kbd "<S-drag-n-drop>") 'my-dnd-func)
      (define-key org-mode-map (kbd "<C-drag-n-drop>") 'my-dnd-func)
      (define-key org-mode-map (kbd "<M-drag-n-drop>") 'my-dnd-func)

      (setq org-image-actual-width '(300))
      (setq org-export-show-temporary-export-buffer nil)
      ;; agenda
      (setq org-agenda-inhibit-startup t)   ;; ~50x speedup
      (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
      (load-library "find-lisp")
      (setq org-agenda-files (find-lisp-find-files "~/Geek/Wiki/notes" "\.org$"))

      ;; Disable underscore to subscript
      (setq org-export-with-sub-superscripts nil)

      ;; line wrap
      (setq org-startup-truncated nil))))

(defun my-writing/post-init-prodigy()
  (setq hexo-config-path "source/_data/next.yml")
   (prodigy-define-service
     :name "Hexo Generate"
     :command hexo-exec
     :args '("generate" "--config"  "source/_data/next.yml")
     :cwd blog-path
     :kill-signal 'sigkill
     :kill-process-buffer-on-stop t
     )
   (prodigy-define-service
     :name "Hexo Clean"
     :command hexo-exec
     :args '("clean")
     :cwd blog-path
     :kill-signal 'sigkill
     :kill-process-buffer-on-stop t
     )
   (prodigy-define-service
     :name "Hexo Server"
     :command hexo-exec
     :args '("server" "-o" "--config"  "source/_data/next.yml")
     :cwd blog-path
     :kill-signal 'sigkill
     :kill-process-buffer-on-stop t
     )
   (prodigy-define-service
     :name "Hexo Deploy"
     :command hexo-exec
     :args (list "deploy" "--generate" "--config"  "source/_data/next.yml")
     :cwd blog-path
     :kill-signal 'sigkill
     :kill-process-buffer-on-stop t
     )
   )
