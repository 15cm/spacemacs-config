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
      (message (format "insert %s" new-fname))
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


;; blog post

;; const
(setq blog-path (concat user-home-directory "Geek/Github/15cm-site/blog"))
(setq hexo-exec  "~/.nodenv/shims/hexo")
(setq post-path (concat blog-path "/source/_posts"))
(setq qiniu-domain "http://7xrgcf.com1.z0.glb.clouddn.com")


(defun my-text-imagelink-local-to-web (web-domain folder text)
  (replace-regexp-in-string "\\[\\[.*\\(png\\|jp[e]?g\\)\\]\\]"
                            (lambda (x) (format "[[%s/%s/%s]]"
                                                web-domain
                                                folder
                                                (file-name-nondirectory (substring x 2 -2))
                                                nil t
                                                ))
                            text)
  )

(defun my-add-read-more (text)
  (let ((cnt 0))
    (replace-regexp-in-string "\\*\\* .*"
                              (lambda (x) (if (eq cnt 0) (progn (setq cnt (+ cnt 1)) (concat "{{{READMORE}}}\n" x))
                                            x))
                              text nil t))
  )

(setq-default org-post-template-html (concat
                                      "#+OPTIONS: num:nil toc:nil\n"
                                      "#+OPTIONS: html-postamble:nil html-preamble:t\n"
                                      "#+MACRO: READMORE @@html:<!-- more -->@@\n"
                                      ))
(defun my-org-post-html ()
  (interactive)
  (let* ((buf-name (buffer-file-name))
         (buf-content (my-add-read-more (my-text-imagelink-local-to-web qiniu-domain (file-name-base buf-name) (buffer-string))))
         (text-line-list (split-string buf-content "\n"))
         (first-line-list (split-string (car text-line-list) ":"))
         (body-text (mapconcat 'identity (cdr text-line-list) "\n"))
         (post-file (format "%s/%s.html" post-path (file-name-base buf-name)))
         (post-created-date (shell-command-to-string (format "[ -f '%s' ] && head %s | grep '^date.*'" post-file post-file)))
         (date-now (format "%s\n" (format-time-string "%Y-%m-%d %H:%M")))
         )
    ;; modify org file for html exporting
    (with-temp-buffer (progn
                        (goto-char (point-min))
                        (insert org-post-template-html)
                        (insert body-text)
                        (org-html-export-as-html)
                        ))
    ;; add meta data to html for posting
    (with-current-buffer "*Org HTML Export*"
      (progn
        (goto-char (point-min))
        (insert (concat
                 "---\n"
                 "layout: post\n"
                 (format "title: %s\n" (trim-string (replace-regexp-in-string "\\*" "" (car first-line-list))))
                 (if (equal "" post-created-date) (concat "date: " date-now) post-created-date)
                 (if (equal "" post-created-date) "" (concat "updated: " date-now))
                 (if (> (length first-line-list) 1) (format "tags: [%s]\n" (substring (mapconcat 'identity (cdr first-line-list) ",") 0 -1)) nil)
                 (format "categories: %s\n" (read-string "Categories(Notes):" nil nil "Notes"))
                 "---\n"
                 "{% raw %}\n"
                 ))
        (goto-char (point-max))
        (insert "\n{% endraw %}\n")
        (write-file post-file)
        ))
    )
  )
