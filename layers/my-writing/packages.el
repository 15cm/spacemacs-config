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
    prodigy
    ox-pandoc
    org-preview-html
    markdown
    org-download
    org-roam
    (my-org :location local)
    ))

(defun my-writing/post-init-org()
  ;; (add-hook 'org-mode-hook 'my-org-mode-hook)
  (with-eval-after-load 'org
    ;; Multiple agenda files root support for "wiki" and "todo"
    ;; Ensure that org-agenda respect directory-local settings
    ;; https://emacs.stackexchange.com/questions/10012/a-search-interface-for-org-mode-files
    (add-hook 'org-agenda-mode-hook #'hack-dir-local-variables-non-file-buffer)
    (add-hook 'org-mode-hook #'my-org-mode-hook)

    (setq org-image-actual-width '(512))
    (setq org-export-show-temporary-export-buffer nil)

    ;; agenda
    (setq org-agenda-inhibit-startup t)   ;; ~50x speedup
    (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup

    ;; Default agenda files
    ;; Library for searching org files under a certain directory
    (unless (boundp 'find-lisp-find-files) (load-library "find-lisp"))
    (let ((todo-dir "~/sync/my-data/todo"))
      (if (file-exists-p todo-dir)
          (progn (setq org-agenda-files (find-lisp-find-files todo-dir "\.org$")))))

    ;; Disable underscore to subscript
    (setq org-export-with-sub-superscripts nil)

    ;; line wrap
    (setq org-startup-truncated nil)))

(defun my-writing/post-init-prodigy()
  ;; Blog
  (with-eval-after-load 'prodigy
    (setq blog-path (concat user-home-directory "tech/15cm-site/blog")
          hexo-exec "hexo"
          hexo-config-path "source/_data/next.yml"
          post-path (concat blog-path "/source/_posts"))
    (prodigy-define-service
      :name "Hexo Generate"
      :command hexo-exec
      :args '("generate" "--config"  "source/_data/next.yml")
      :cwd blog-path
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)
    (prodigy-define-service
      :name "Hexo Clean"
      :command hexo-exec
      :args '("clean")
      :cwd blog-path
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)
    (prodigy-define-service
      :name "Hexo Server"
      :command hexo-exec
      :args '("server" "-o" "--config"  "source/_data/next.yml")
      :cwd blog-path
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)
    (prodigy-define-service
      :name "Hexo Deploy"
      :command hexo-exec
      :args (list "deploy" "--generate" "--config"  "source/_data/next.yml")
      :cwd blog-path
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)))

(defun my-writing/init-ox-pandoc()
  (use-package ox-pandoc
    :disabled
    :defer t))

(defun my-writing/init-org-preview-html()
  (use-package org-preview-html
    :defer t
    :commands (org-preview-html/preview org-preview-html-mode)
    ))

(defun my-writing/post-init-org-download ()
  (with-eval-after-load 'org-download
    (setq-default org-download-image-dir "./img")
    (setq-default org-download-heading-lvl nil)
    ))

(defun my-writing/init-my-org ()
  (use-package my-org
    :defer t
    :commands (my-org-mode)))

(defun my-writing/post-init-org-roam ()
  (with-eval-after-load 'org-roam
    (setq org-roam-capture-templates '(("d" "default" plain "%?"
     :target (file+head "${slug}.org"
                        "#+title: ${title}\n#+OPTIONS: ^:nil\n")
     :unnarrowed t)))))

(defun my-writing/post-init-markdown()
  (add-hook 'markdown-mode-hook 'my-markdown-mode-hook))
