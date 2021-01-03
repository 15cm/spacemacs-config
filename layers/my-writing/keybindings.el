;; blog post
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-p" 'org-preview-html-mode)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-l" 'my-replace-current-mdlink-to-orglink)

;; latex
(spacemacs/set-leader-keys-for-major-mode 'latex-mode "ib" 'latex-insert-block)

;; org-mode
(spacemacs/set-leader-keys-for-major-mode 'org-mode "iL" 'org-cliplink)
;; (spacemacs/declare-prefix-for-mode 'org-mode "r" "remove")
;; (spacemacs/set-leader-keys-for-major-mode 'org-mode "rd" 'org-download-delete)

; org-roam
(spacemacs/set-leader-keys-for-major-mode 'org-mode "rta" 'my-org-roam-tag-add)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "rtd" 'my-org-roam-tag-delete)

;; org-attach
(spacemacs/set-leader-keys-for-major-mode 'org-mode "a" 'org-attach)
