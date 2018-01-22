;; blog post
(spacemacs/set-leader-keys-for-major-mode 'org-mode ">" 'my-org-post)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-p" 'org-preview-html-mode)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-l" 'my-replace-current-mdlink-to-orglink)
(spacemacs/set-leader-keys-for-major-mode 'latex-mode "ib" 'latex-insert-block)
