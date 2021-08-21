;;; my-org-wiki.el --- Provide simple functions to organize my wiki

;;; my-org-wiki.el --- Provide simple functions and configurations for my org wiki notes -*- lexical-binding: t -*-

;; Author: Sinkerine
;; Maintainer: Sinkerine
;; Version: 0.1.0
;; Package-Requires: (nil)
;; Homepage: https://github.com/15cm/spacemacs-config
;; Keywords: org wiki


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

(defgroup my-org-wiki nil
  "Configuration options for my-org-wiki.el"
  :group 'org)

(defcustom my-org-wiki/blog-post-project-root nil
  "The root of the blog post project"
  :type 'string
  :group 'my-org-wiki)

;;;###autoload
(define-minor-mode my-org-wiki-mode
  "Org wiki mode with extra configs."
  :init-value nil
  :lighter "my-org-wiki"
  (if (not my-org-wiki/blog-post-project-root)
      (message "Error: please set the custom vars my-org-wiki/blog-post-project-dir and then restart my-org-wiki-mode")
    (progn (spacemacs/set-leader-keys-for-major-mode 'org-mode ">" 'my-org-wiki-post-to-blog)
           (org-roam-setup))))

;;;###autoload
(defun my-org-wiki-post-to-blog ()
  "Export current org to markdown file located in my-org-wiki/blog-post-project-dir"
  (interactive)
  (let* ((wiki-path (f-dirname (buffer-file-name)))
         (asset-path (org-attach-dir)))
    (message (shell-command-to-string (format "org-post-md.py post -i %s --assets-dir %s -o %s" (buffer-file-name) asset-path my-org-wiki/blog-post-project-root)))))

(provide 'my-org-wiki)
;;; my-org-wiki.el ends here
