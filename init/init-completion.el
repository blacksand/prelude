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

(provide 'init-completion)

;;; init-completion.el ends here
