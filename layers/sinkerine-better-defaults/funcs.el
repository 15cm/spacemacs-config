(defun my-fzf-notes ()
  (interactive)
  (fzf-directory "~/Geek/Wiki/notes/")
  )

(defun my-fzf-codes ()
  (interactive)
  (fzf-directory "~/Geek/Wiki/static/code/")
  )

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
    " do shell script \"open -a iTerm\"\n"
    ))
  )
