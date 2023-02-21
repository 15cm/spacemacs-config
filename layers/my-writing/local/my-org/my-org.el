;;; my-org.el --- Provide simple functions to organize my org

;;; my-org.el --- Provide simple functions and configurations for my org notes -*- lexical-binding: t -*-

;; Author: Sinkerine
;; Maintainer: Sinkerine
;; Version: 0.1.0
;; Package-Requires: (nil)
;; Homepage: https://github.com/15cm/spacemacs-config
;; Keywords: org


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;;; Code:

(defgroup my-org nil
  "Configuration options for my-org.el"
  :group 'org)

(defcustom my-org/blog-post-project-root nil
  "The root of the blog post project"
  :type 'string
  :group 'my-org)

(defcustom my-org/blog-assets-dir "assets/posts"
  "The dir of the blog post assets, under <project-root>/source"
  :type 'string
  :group 'my-org)

;;;###autoload
(define-minor-mode my-org-mode
  "Org wiki mode with extra configs."
  :init-value nil
  :lighter "my-org"
  :interactive '('org-mode)
  (interactive (list (or current-prefix-arg 'toggle)))
  (if (not my-org/blog-post-project-root)
      (message "Error: please set the custom vars my-org/blog-post-project-dir and then restart my-org-mode")
    (let ((enable
            (if (eq arg 'toggle)
                (not my-org-mode) ; this is the mode’s mode variable
              (> (prefix-numeric-value arg) 0))))
       (if enable
           (progn (spacemacs/set-leader-keys-for-major-mode 'org-mode ">" 'my-org-post-buffer-to-blog)
                  (org-roam-db-autosync-enable))
         (progn (spacemacs/set-leader-keys-for-major-mode 'org-mode ">" nil))))))

(defun my-org--process-org-input (data-rel-dir keyword-list-to-delete)
  "The current buffer should be a copy of the org buffer."
  ;; Replace attachment links with blog post assets links.
  (when data-rel-dir
    (goto-char (point-min))
    (while (re-search-forward "\\[\\[attachment:\\([^\\[]*\\)\\]\\]" nil t)
      (replace-match (format "[[/%s/%s/%s]]" my-org/blog-assets-dir data-rel-dir "\\1"))))
  ;; Remove keywords to avoid outputting them to md.
  (--each keyword-list-to-delete (org-roam-erase-keyword it)))

(defun my-org--convert-to-md (buf)
  "Convert the current org buffer to md and replace the content of the <buf>."
  (shell-command-on-region (point-min) (point-max) "pandoc -f org -t markdown-fenced_code_attributes --markdown-headings=atx" buf))

(defun my-org--process-md-output (title published-at updated-at tags)
    "The current buffer should be the output md buffer"
    ;; Add front matters
    (goto-char (point-min))
    (insert (format "---
layout: post
title: %s
date: %s
updated: %s
" title published-at updated-at))
    (when tags (insert (format "tags:
%s" (string-join (--map (concat "- " it) tags) "\n"))))
    (insert "\n---\n\n")
    ;; Add read more.
    (re-search-forward "^#")
    (beginning-of-line)
    (insert "<!-- more -->\n")
    ;; Drop the file:// added by pandoc
    (replace-regexp-in-region "\\](file://" "](" (point-min)))

;; Candidate as a replacement for `kill-buffer', at least when used interactively.
;; For example: (define-key global-map [remap kill-buffer] 'kill-buffer-and-its-windows)
;;
;; We cannot just redefine `kill-buffer', because some programs count on a
;; specific other buffer taking the place of the killed buffer (in the window).
;;;###autoload
(defun kill-buffer-and-its-windows (buffer &optional msgp)
  "Kill BUFFER and delete its windows.  Default is `current-buffer'.
BUFFER may be either a buffer or its name (a string)."
  (interactive (list (read-buffer "Kill buffer: " (current-buffer) 'existing) 'MSGP))
  (setq buffer  (get-buffer buffer))
  (if (buffer-live-p buffer)            ; Kill live buffer only.
      (let ((wins  (get-buffer-window-list buffer nil t))) ; On all frames.
        (when (and (buffer-modified-p buffer)
                   (fboundp '1on1-flash-ding-minibuffer-frame))
          (1on1-flash-ding-minibuffer-frame t)) ; Defined in `oneonone.el'.
        (when (kill-buffer buffer)      ; Only delete windows if buffer killed.
          (dolist (win  wins)           ; (User might keep buffer if modified.)
            (when (window-live-p win)
              ;; Ignore error, in particular,
              ;; "Attempt to delete the sole visible or iconified frame".
              (condition-case nil (delete-window win) (error nil))))))
    (when msgp (error "Cannot kill buffer.  Not a live buffer: `%s'" buffer))))

;;;###autoload
(defun my-org-post-buffer-to-blog (&optional skip-modify-updated-at)
  "Export current org to markdown file located in my-org/blog-post-project-dir.
If untouch-updated-at is not nil, change the udpated_at keyword to now."
  (interactive)
  (let* (
         (keyword-list '("title" "published_at" "updated_at" "filetags"))
         (keywords (org-collect-keywords keyword-list))
         (tags (if-let ((val (car (alist-get "FILETAGS" keywords nil nil #'equal))))
                   (split-string val ":" t) nil))
         (now (format-time-string "%Y-%m-%d %H:%M:%S"))
         (title (car (alist-get "TITLE" keywords nil nil #'equal)))
         (published_at (if-let ((val (car (alist-get "PUBLISHED_AT" keywords nil nil #'equal))))
                           val now))
         (updated_at (if-let ((val (car (alist-get "UPDATED_AT" keywords nil nil #'equal)))
                               (skip skip-modify-updated-at))
                         val now))
         (attach-dir (org-attach-dir))
         (data-root (f-join (file-truename org-roam-directory) "data"))
         (data-rel-dir (when attach-dir (string-replace (concat data-root "/") "" attach-dir)))
         (md-output-file-path (f-join my-org/blog-post-project-root "source" "_posts" (concat (replace-regexp-in-string "[0-9]\\{14\\}-" "" (file-name-base buffer-file-name)) ".md"))))
    (org-roam-set-keyword "published_at" published_at)
    (org-roam-set-keyword "updated_at" updated_at)
    ;; Metadata is ready.
    ;; Copy attachment data.
    (when attach-dir
      (copy-directory attach-dir (f-join my-org/blog-post-project-root "source" my-org/blog-assets-dir data-rel-dir) t t t))
    ;; Process and convert org to md.
    (let ((original-buffer (current-buffer))
          (md-buffer (generate-new-buffer "*temp-md-output*" t)))
      (with-temp-buffer
        (insert-buffer-substring original-buffer)
        (my-org--process-org-input data-rel-dir keyword-list)
        (my-org--convert-to-md md-buffer))
      (with-current-buffer md-buffer
        (my-org--process-md-output title published_at updated_at tags)
        (write-file md-output-file-path))
      (kill-buffer-and-its-windows md-buffer))))

(provide 'my-org)
;;; my-org.el ends here
