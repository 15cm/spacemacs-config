(defun trim-string (string)
  "Remove white spaces in beginning and ending of STRING.
White space here is any of: space, tab, emacs newline (line feed, ASCII 10)."
  (replace-regexp-in-string "\\`[ \t\n]*" "" (replace-regexp-in-string "[ \t\n]*\\'" "" string)))

;; markdown to org mode utils
(defun my-replace-current-mdlink-to-orglink ()
  (interactive)
  (let* ((line-text (thing-at-point 'line))
         (tmp (string-match "\\(\\[.*\\]\\)\\((http[s]?[^(]*)\\)" line-text))
         (orglink (format "[[%s][%s]]"
                          (substring (match-string 2 line-text) 1 -1)
                          (substring (match-string 1 line-text) 1 -1))))
    (kill-whole-line)
    (insert (replace-regexp-in-string "\\[.*\\](http[s]?[^(]*)" orglink line-text nil t))))

;; add spaces at the beginning and ending of $...$
(defun my-add-spaces-around-inline-latex ()
  (interactive)
  (let* ((buf-content (buffer-string)))
    (progn
      (erase-buffer)
      (goto-char (point-min))
      (insert (replace-regexp-in-string "[:space:]*$[^$]*$[:space:]*"
                                        (lambda (x) (format " %s " (trim-string x)))
                                        buf-content nil t)))))

(defun my-org-mode-hook ()
  (when (string-prefix-p (file-truename org-roam-directory) default-directory)
        (my-org-mode 1)))

(defun my-markdown-mode-hook ()
  (auto-fill-mode 1))

(defun my-org-roam-tag-add ()
  "Add a tag to Org-roam file.

Return added tag."
  (interactive)
  (unless org-roam-mode (org-roam-mode))
  (save-excursion
    (org-back-to-heading)
    (let* ((all-tags (org-roam-db--get-tags))
           (tag (completing-read "Tag: " all-tags))
           (file (buffer-file-name (buffer-base-buffer)))
           (existing-tags (org-roam--extract-tags-vanilla file)))
      (when (string-empty-p tag)
        (user-error "Tag can't be empty"))
      (org-set-tags
       (format ":%s:" (combine-and-quote-strings (seq-uniq (append existing-tags (list tag))) ":")))
      (org-roam-db--insert-tags 'update)
      tag)
    ))

(defun my-org-roam-tag-delete ()
  "Delete a tag from Org-roam file."
  (interactive)
  (unless org-roam-mode (org-roam-mode))
  (save-excursion
    (org-back-to-heading)
    (if-let* ((file (buffer-file-name (buffer-base-buffer)))
              (tags (org-roam--extract-tags-vanilla file)))
        (let* ((tag (completing-read "Tag: " tags nil 'require-match))
               (new-tags (delete tag tags)))
          (org-set-tags
           (if (null new-tags) "" (format ":%s:" (combine-and-quote-strings new-tags ":"))))
          (org-roam-db--insert-tags 'update))
      (user-error "No tag to delete"))))
