;; blog post
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-p" 'org-preview-html-mode)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-l" 'my-replace-current-mdlink-to-orglink)

;; latex
(spacemacs/set-leader-keys-for-major-mode 'latex-mode "ib" 'latex-insert-block)

;; org-mode
(spacemacs/set-leader-keys-for-major-mode 'org-mode "iL" 'org-cliplink)
;; (spacemacs/declare-prefix-for-mode 'org-mode "r" "remove")
;; (spacemacs/set-leader-keys-for-major-mode 'org-mode "rd" 'org-download-delete)

;; org-attach
(spacemacs/set-leader-keys-for-major-mode 'org-mode "a" 'org-agenda)
