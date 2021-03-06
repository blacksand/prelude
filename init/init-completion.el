(require 'helm-config)

(defun bs/init-helm ()
  (setq helm-input-idle-delay 0.2)
  ;; (helm-mode t)
  (global-set-key (kbd "C-x c g") 'helm-do-grep)
  (global-set-key (kbd "C-x c o") 'helm-occur)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x f") 'helm-recentf)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))

;; (prelude-eval-after-init (bs/init-helm))
(bs/init-helm)

(prelude-require-packages '(auto-complete pos-tip fuzzy))
(require 'auto-complete-config)

(define-key ac-mode-map (kbd "M-/") 'ac-fuzzy-complete)

(dolist (ac-mode '(text-mode org-mode))
  (add-to-list 'ac-modes ac-mode))

(dolist (ac-mode-hook '(text-mode-hook org-mode-hook prog-mode-hook))
  (add-hook ac-mode-hook
            (lambda ()
              (setq ac-fuzzy-enable t)
              (add-to-list 'ac-sources 'ac-source-files-in-current-dir)
              (add-to-list 'ac-sources 'ac-source-filename))))

(ac-config-default)

(require 'pos-tip)

(defun ac-pcomplete ()
  ;; eshell uses `insert-and-inherit' to insert a \t if no completion
  ;; can be found, but this must not happen as auto-complete source
  (flet ((insert-and-inherit (&rest args)))
    ;; this code is stolen from `pcomplete' in pcomplete.el
    (let* (tramp-mode ;; do not automatically complete remote stuff
           (pcomplete-stub)
           (pcomplete-show-list t) ;; inhibit patterns like * being deleted
           pcomplete-seen pcomplete-norm-func
           pcomplete-args pcomplete-last pcomplete-index
           (pcomplete-autolist pcomplete-autolist)
           (pcomplete-suffix-list pcomplete-suffix-list)
           (candidates (pcomplete-completions))
           (beg (pcomplete-begin))
           ;; note, buffer text and completion argument may be
           ;; different because the buffer text may bet transformed
           ;; before being completed (e.g. variables like $HOME may be
           ;; expanded)
           (buftext (buffer-substring beg (point)))
           (arg (nth pcomplete-index pcomplete-args)))
      ;; we auto-complete only if the stub is non-empty and matches
      ;; the end of the buffer text
      (when (and (not (zerop (length pcomplete-stub)))
                 (or (string= pcomplete-stub ; Emacs 23
                              (substring buftext
                                         (max 0
                                              (- (length buftext)
                                                 (length pcomplete-stub)))))
                     (string= pcomplete-stub ; Emacs 24
                              (substring arg
                                         (max 0
                                              (- (length arg)
                                                 (length pcomplete-stub)))))))
        ;; Collect all possible completions for the stub. Note that
        ;; `candidates` may be a function, that's why we use
        ;; `all-completions`.
        (let* ((cnds (all-completions pcomplete-stub candidates))
               (bnds (completion-boundaries pcomplete-stub
                                            candidates
                                            nil
                                            ""))
               (skip (- (length pcomplete-stub) (car bnds))))
          ;; We replace the stub at the beginning of each candidate by
          ;; the real buffer content.
          (mapcar #'(lambda (cand) (concat buftext (substring cand skip)))
                  cnds))))))

(defvar ac-source-pcomplete
  '((candidates . ac-pcomplete)))

(provide 'init-completion)

;;; init-completion.el ends here
