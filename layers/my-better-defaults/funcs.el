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

;; https://github.com/syl20bnr/spacemacs/issues/5186#issuecomment-251950135
;; redefine lock grasping function https://github.com/syl20bnr/spacemacs/issues/5186#issuecomment-251950135
(defun ask-user-about-lock (file opponent)
  "Ask user what to do when he wants to edit FILE but it is locked by OPPONENT.
This function has a choice of three things to do:
  do (signal \\='file-locked (list FILE OPPONENT))
    to refrain from editing the file
  return t (grab the lock on the file)
  return nil (edit the file even though it is locked).
You can redefine this function to choose among those three alternatives
in any way you like."
  (discard-input)
  (if (string-match-p "~/\.emacs.d/\.cache/.*" file) t
    (save-window-excursion
      (let (answer short-opponent short-file)
        (setq short-file
	          (if (> (length file) 22)
		          (concat "..." (substring file (- (length file) 22)))
	            file))
        (setq short-opponent
	          (if (> (length opponent) 25)
		          (save-match-data
		            (string-match " (pid [0-9]+)" opponent)
		            (concat (substring opponent 0 13) "..."
			                (match-string 0 opponent)))
	            opponent))
        (while (null answer)
	      (message "%s locked by %s: (s, q, p, ?)? "
		           short-file short-opponent)
	      (if noninteractive (error "Cannot resolve lock conflict in batch mode"))
	      (let ((tem (let ((inhibit-quit t)
			               (cursor-in-echo-area t))
		               (prog1 (downcase (read-char))
		                 (setq quit-flag nil)))))
	        (if (= tem help-char)
	            (ask-user-about-lock-help)
	          (setq answer (assoc tem '((?s . t)
				                        (?q . yield)
				                        (?\C-g . yield)
				                        (?p . nil)
				                        (?? . help))))
	          (cond ((null answer)
		             (beep)
		             (message "Please type q, s, or p; or ? for help")
		             (sit-for 3))
		            ((eq (cdr answer) 'help)
		             (ask-user-about-lock-help)
		             (setq answer nil))
		            ((eq (cdr answer) 'yield)
		             (signal 'file-locked (list file opponent)))))))
        (cdr answer)))
    )
  )
