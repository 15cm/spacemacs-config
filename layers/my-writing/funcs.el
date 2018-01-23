(defun trim-string (string)
  "Remove white spaces in beginning and ending of STRING.
White space here is any of: space, tab, emacs newline (line feed, ASCII 10)."
  (replace-regexp-in-string "\\`[ \t\n]*" "" (replace-regexp-in-string "[ \t\n]*\\'" "" string))
  )

;; impatient mode for org-mode
(defun my-imp-org-to-html-filter (buffer)
  (let ((output-buffer (current-buffer))
        (log-message-max nil))
    (with-current-buffer buffer
      (let ((output (org-export-as 'html)))
        (with-current-buffer output-buffer (insert output))))))

(defun my-impatient-mode-hook()
  (progn (imp-set-user-filter 'my-imp-org-to-html-filter)
         (message "My org-imp-mode hook trigger")
         ))

;; drag and drop then copy image file to specified folder with default width
(setq org-img-base-folder "~/Geek/Wiki/static/img")
(defun my-dnd-func (event)
  (interactive "e")
  (goto-char (nth 1 (event-start event)))
  (x-focus-frame nil)
  (let* ((payload (car (last event)))
         (type (car payload))
         (fname (cadr payload))
         (img-regexp "\\(png\\|jp[e]?g\\)\\>")
         (img-folder (format "%s/%s" org-img-base-folder (file-name-base buffer-file-name)))
         (new-fname (format "%s/%s" img-folder (file-name-nondirectory fname)))
         )
    (cond
     ;; insert image link with caption
     ((and  (eq 'drag-n-drop (car event))
            (eq 'file type)
            (string-match img-regexp fname))
      (insert "#+ATTR_HTML: :width 480 :align center")
      (org-indent-line)
      (insert (concat  "\n#+CAPTION: " (read-input "Caption: ")))
      (org-indent-line)
      (if (not (f-exists? img-folder)) (mkdir img-folder) ())
      (copy-file fname new-fname t)
      (insert (format "\n[[%s]]" new-fname))
      (org-indent-line)
      (message (format "%s inserted" new-fname))
      )
     ;; (org-display-inline-images t t))
     ;; insert image link
     ((and  (eq 'S-drag-n-drop (car event))
            (eq 'file type)
            (string-match img-regexp fname))
      (insert (format "[[%s]]" fname))
      (message (format "insert %s" fname))
      )
     ;; (org-display-inline-images t t))
     ;; C-drag-n-drop to open a file
     ((and  (eq 'C-drag-n-drop (car event))
            (eq 'file type))
      (find-file fname))
     ((and (eq 'M-drag-n-drop (car event))
           (eq 'file type))
      (insert (format "[[attachfile:%s]]" fname)))
     ;; regular drag and drop on file
     ((eq 'file type)
      (insert (format "[[%s]]\n" fname)))
     (t
      (error "I am not equipped for dnd on %s" payload)))))

;; markdown to org mode utils
(defun my-replace-current-mdlink-to-orglink ()
  (interactive)
  (let* ((line-text (thing-at-point 'line))
         (tmp (string-match "\\(\\[.*\\]\\)\\((http[s]?[^(]*)\\)" line-text))
         (orglink (format "[[%s][%s]]"
                          (substring (match-string 2 line-text) 1 -1)
                          (substring (match-string 1 line-text) 1 -1)
                          ))
         )
    (progn
      (kill-whole-line)
      (insert (replace-regexp-in-string "\\[.*\\](http[s]?[^(]*)" orglink line-text nil t)
      )
    )
  ))

;; add spaces at the beginning and ending of $...$
(defun my-add-spaces-around-inline-latex ()
  (interactive)
  (let* ((buf-content (buffer-string)))
    (progn
      (erase-buffer)
      (goto-char (point-min))
      (insert (replace-regexp-in-string "[:space:]*$[^$]*$[:space:]*"
                                (lambda (x) (format " %s " (trim-string x)))
                                buf-content nil t
                                ))
      )
    )
  )

(defun my-org-post ()
  (interactive)
  (message (shell-command-to-string (format "org-post-md.py post %s -u" (buffer-file-name)))))
