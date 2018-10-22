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
    org-preview-html
    prodigy
    ox-pandoc
    org-brain
    ))

(defun my-writing/init-org-preview-html()
  (use-package org-preview-html
    :defer t))

(defun my-writing/post-init-org()
  (add-hook 'org-mode-hook 'after-org-mode-loaded)
  (with-eval-after-load 'org
    (progn
      (setq org-image-actual-width '(512))
      (setq org-export-show-temporary-export-buffer nil)
      ;; agenda
      (setq org-agenda-inhibit-startup t)   ;; ~50x speedup
      (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup

      ;; agenda files for tag search
      (let ((notes-dir "~/tech/wiki/notes"))
        (if (file-exists-p notes-dir)
            (progn
              (load-library "find-lisp")
              (setq org-agenda-files (find-lisp-find-files "~/tech/wiki/notes" "\.org$"))
                                        )))

      ;; Disable underscore to subscript
      (setq org-export-with-sub-superscripts nil)

      ;; line wrap
      (setq org-startup-truncated nil))))

(defun my-writing/post-init-prodigy()
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

(defun my-writing/init-ox-pandoc()
  (use-package ox-pandoc))

(defun my-writing/post-init-org-brain()
  (with-eval-after-load 'org-brain
    (setq org-brain-path "~/resilio-sync/personal/brain")
    (setq org-id-locations-file "~/resilio-sync/personal/brain/.org-id-locations")
    (with-eval-after-load 'evil
      (evil-set-initial-state 'org-brain-visualize-mode 'normal)
      (evil-make-overriding-map org-brain-visualize-mode-map 'normal)))
  )
