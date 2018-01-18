(defun my-fzf-notes ()
  (interactive)
  (fzf/start "~/Geek/Wiki/notes/"))

(defun my-fzf-codes ()
  (interactive)
  (fzf/start "~/Geek/Wiki/static/code/"))

(defun my-find-wiki ()
  (interactive)
  (helm-find-files-1 (concat user-home-directory "Geek/Wiki/")))

(defun my-iterm-goto-filedir-or-home ()
  "Go to present working dir and focus iterm"
  (interactive)
  (do-applescript
   (concat
    " tell application \"iTerm2\"\n"
    "   tell the current session of current window\n"
    (format "     write text \"cd %s\" \n"
            ;; string escaping madness for applescript
            (replace-regexp-in-string "\\\\" "\\\\\\\\"
                                      (shell-quote-argument (or default-directory "~"))))
    "   end tell\n"
    " end tell\n"
    " do shell script \"open -a iTerm\"\n")))

;; clipboard
(defun copy-to-clipboard ()
  "Copies selection to x-clipboard."
  (interactive)
  (if (region-active-p)
      (progn
        (shell-command-on-region (region-beginning) (region-end) "nc localhost 8377")
        (message "Yanked region to clipboard!")
        (deactivate-mark))
    (message "No region active; can't yank to clipboard!"))
  )

(defun paste-from-clipboard ()
  "Pastes from x-clipboard."
  (interactive)
  (if (display-graphic-p)
      (insert (shell-command-to-string "pbpaste"))
    )
  )
