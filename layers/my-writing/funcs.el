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

(defun my-org-mode-hook ())

(defun my-markdown-mode-hook ()
  (auto-fill-mode 1))
