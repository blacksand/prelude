;;; init-evernote.el --- Setting evernote-mode

(require 'evernote-mode)
(setq evernote-username "yuaf") ; optional: you can use this username as default.
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; option

(define-key prelude-mode-map (kbd "C-c e") nil)
(define-key prelude-mode-map "\C-cee" 'prelude-eval-and-replace)

(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)

(provide 'init-evernote)

;;; init-evernote.el ends here
