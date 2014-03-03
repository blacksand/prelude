;;; init-evil.el --- Setting evil mode
;;; Code:

(prelude-require-packages '(evil evil-leader surround))

(require 'evil)
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)

(add-hook 'text-mode-hook 'turn-on-evil-mode)
(add-hook 'prog-mode-hook 'turn-on-evil-mode)
(add-hook 'comint-mode-hook 'turn-on-evil-mode)
(add-hook 'Info-mode-hook 'turn-off-evil-mode)

(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(if (featurep 'helm)
    (evil-leader/set-key
      "e" 'helm-find-files
      "b" 'helm-buffers-list)
  (evil-leader/set-key
    "e" 'find-file
    "b" 'switch-to-buffer))

(if (featurep 'expand-region)
    (progn
      ;; (setq expand-region-contract-fast-key "z")
      (evil-leader/set-key "=" 'er/expand-region)))

(evil-leader/set-key
  "k" 'kill-buffer)

(global-evil-leader-mode)

(provide 'init-evil)

;;; init-evil.el ends here
