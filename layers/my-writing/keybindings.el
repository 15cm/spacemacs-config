;; blog post
(spacemacs/set-leader-keys-for-major-mode 'org-mode ">" 'my-org-post)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-p" 'org-preview-html-mode)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-l" 'my-replace-current-mdlink-to-orglink)

;; latex
(spacemacs/set-leader-keys-for-major-mode 'latex-mode "ib" 'latex-insert-block)

;; org-mode
(spacemacs/set-leader-keys-for-major-mode 'org-mode "iL" 'org-cliplink)

;; org-brain
(spacemacs/declare-prefix "<SPC>b" "org-brain")
(evil-leader/set-key "<SPC>bb" 'org-brain-visualize)
(evil-leader/set-key "<SPC>ba" 'org-brain-agenda)
(evil-leader/set-key "<SPC>br" 'org-brain-rename-file)
(evil-define-key 'normal org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource)
