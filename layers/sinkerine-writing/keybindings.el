;; blog post
(spacemacs/set-leader-keys-for-major-mode 'org-mode ">" 'my-org-post-html)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-p" 'org-preview-html-mode)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "C-l" 'my-replace-current-mdlink-to-orglink)
