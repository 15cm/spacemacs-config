;; Tex preview
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method-active 'synctex)
(setq TeX-source-correlate-start-server t)
(setq TeX-view-program-selection '((output-pdf "Skim")))
(setq TeX-view-program-list 
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o")))
