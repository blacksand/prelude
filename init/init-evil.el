;;; init-evil.el --- Setting evil mode
;;; Code:

(prelude-require-packages '(evil
                            evil-leader
                            evil-matchit
                            evil-numbers
                            evil-visualstar
                            surround))

(require 'evil)
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)
;; 便于区分 emacs 模式和 evil 模式
(setq evil-emacs-state-cursor "medium sea green")
(setq evil-normal-state-cursor "grey")

;; 会导致 "C-[" 不能被 evil 识别, 用 evil-mode 代替
;; (add-hook 'text-mode-hook 'turn-on-evil-mode)
;; (add-hook 'prog-mode-hook 'turn-on-evil-mode)
;; (add-hook 'comint-mode-hook 'turn-on-evil-mode)
;; (add-hook 'Info-mode-hook 'turn-off-evil-mode)
(evil-mode 1)
(loop for (mode . state) in
      '((minibuffer-inactive-mode . emacs)
        (Info-mode . emacs)
        (compilation-mode . emacs)
        (dired-mode . emacs)
        (direx:direx-mode . emacs)
        (erc-mode . emacs)
        (eshell-mode . emacs)
        (fundamental-mode . emacs)
        (gtags-select-mode . emacs)
        (gud-mode . emacs)
        (help-mode . emacs)
        (inf-ruby-mode . emacs)
        (js2-error-buffer-mode . emacs)
        (log-edit-mode . emacs)
        (magit-commit-mode . emacs)
        (magit-log-edit-mode . emacs)
        (message-mode . emacs)
        (sdcv-mode . emacs)
        (shell-mode . emacs)
        (speedbar-mode . emacs)
        (sr-mode . emacs)
        (term-mode . emacs)
        (yari-mode . emacs))
      do (evil-set-initial-state mode state))

(require 'surround)
(global-surround-mode 1)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(require 'evil-visualstar)

;; evil key bind
(define-key evil-ex-completion-map (kbd "M-p") 'previous-complete-history-element)
(define-key evil-ex-completion-map (kbd "M-n") 'next-complete-history-element)

(define-key evil-normal-state-map "Y" (kbd "y$"))
(define-key evil-normal-state-map "+" 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map "-" 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map "go" 'goto-char)

(define-key evil-insert-state-map (kbd "M-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "M-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)

;; evil-leader
(require 'evil-leader)
(evil-leader/set-leader ",")
(if (featurep 'helm)
    (evil-leader/set-key
      "hr" 'helm-recentf
      "hf" 'helm-find-files
      "hb" 'helm-buffers-list)
  (evil-leader/set-key
    "hr" 'recentf-open-files
    "hf" 'find-file
    "hb" 'switch-to-buffer))

(if (featurep 'expand-region)
    (progn
      ;; (setq expand-region-contract-fast-key "z")
      (evil-leader/set-key
        "=" 'er/expand-region)))

(if (or (featurep 'ack-and-a-half) (featurep 'ack-and-a-half-autoloads))
    (evil-leader/set-key
      "ac" 'ack
      "as" 'ack-same
      "af" 'ack-find-file
      "aa" 'ack-find-file-same
      ))

(defun toggle-org-or-message-mode ()
  (interactive)
  (if (eq major-mode 'message-mode)
      (org-mode)
    (if (eq major-mode 'org-mode) (message-mode))
    ))

(evil-leader/set-key
  "bd" 'kill-buffer ;; same as vim
  "cs" 'prelude-ido-goto-symbol
  "ct" 'ctags-create-or-update-tags-table
  "dj" 'dired-jump ;; open the dired from current file
  "eb" 'eval-buffer
  "ee" 'eval-expression
  "ef" 'eval-defun
  "er" 'eval-region
  "es" 'eval-last-sexp
  "fb" 'beginning-of-defun
  "fe" 'end-of-defun
  "fr" 'revert-buffer ;; file read
  "fw" 'save-buffer   ;; file write
  "lp" 'package-list-packages
  "man" '(lambda () (interactive) (man (concat "-k " (thing-at-point 'symbol))))
  "mf" 'mark-defun
  "oc" 'occur
  "om" 'toggle-org-or-message-mode
  "oo" 'switch-window
  "sb" 'flyspell-buffer
  "sc" 'flyspell-auto-correct-word
  "sd" 'call-sdcv+
  "se" 'flyspell-goto-next-error
  "sl" 'sort-lines
  "st" 'call-sdcv
  "sw" 'ispell-word
  "ut" 'undo-tree-visualize
  "vb" '(lambda () (interactive) (scroll-other-window '-))
  "vf" 'scroll-other-window
  "wh" 'winner-undo
  "wl" 'winner-redo
  "x0" 'delete-window
  "x1" 'delete-other-windows
  "x2" '(lambda () (interactive) (if *emacs23* (split-window-vertically) (split-window-right)))
  "x3" '(lambda () (interactive) (if *emacs23* (split-window-horizontally) (split-window-below)))
  "xb" 'ido-switch-buffer
  "xf" 'ido-find-file
  "xh" 'mark-whole-buffer
  "xk" 'ido-kill-buffer
  "xm" 'smex
  "xnd" 'narrow-to-defun
  "xnr" 'narrow-to-region
  "xnw" 'widen
  "xvg" 'vc-annotate
  "xvl" 'vc-print-log
  "xvv" 'vc-next-action
  ;; "gf" 'gtags-find-tag-from-here
  ;; "gp" 'gtags-pop-stack
  ;; "gr" 'gtags-find-rtag
  ;; "gy" 'gtags-find-symbol
  ;; "hb" 'helm-back-to-last-point
  ;; "hd" 'describe-function
  ;; "hf" 'find-function
  ;; "hs" 'helm-swoop
  ;; "hv" 'describe-variable
  ;; "im" 'helm-imenu
  ;; "je" 'js2-display-error-list
  ;; "js" 'w3mext-search-js-api-mdn
  ;; "lj" 'moz-load-js-file-and-send-it
  ;; "lo" 'moz-console-log-var
  ;; "ma" 'mc/mark-all-like-this-in-defun
  ;; "md" 'mc/mark-all-like-this-dwim
  ;; "ms" 'mc/mark-all-symbols-like-this-in-defun
  ;; "mw" 'mc/mark-all-words-like-this-in-defun
  ;; "nn" 'my-goto-next-hunk
  ;; "ns" 'my-goto-next-section
  ;; "ops" 'my-org2blog-post-subtree
  ;; "or" 'open-readme-in-git-root-directory
  ;; "ov" '(lambda () (interactive) (set-selective-display (if selective-display nil 1)))
  ;; "pp" 'my-goto-previous-hunk
  ;; "ps" 'my-goto-previous-section
  ;; "qq" '(lambda () (interactive) (w3m-search "q" (thing-at-point 'symbol)))
  ;; "rw" 'rotate-windows
  ;; "s0" 'delete-window
  ;; "s1" 'delete-other-windows
  ;; "s2" '(lambda () (interactive) (if *emacs23* (split-window-vertically) (split-window-right)))
  ;; "s3" '(lambda () (interactive) (if *emacs23* (split-window-horizontally) (split-window-below)))
  ;; "se" 'string-edit-at-point
  ;; "te" 'js2-mode-toggle-element
  ;; "tf" 'js2-mode-toggle-hide-functions
  ;; "ub" 'uniquify-all-lines-buffer
  ;; "ur" 'uniquify-all-lines-region
  ;; "ws" 'w3mext-hacker-search
  ;; "xc" 'save-buffers-kill-terminal
  ;; "xrf" 'git-reset-current-file
  ;; "xv=" 'git-gutter:popup-hunk
  ;; "xva" 'git-add-current-file
  ;; "xvp" 'git-messenger:popup-message
  ;; "xvr" 'git-gutter:revert-hunk
  ;; "xvs" 'git-gutter:stage-hunk
  ;; "xvu" 'git-add-option-update
  ;; "xx" 'er/expand-region
  ;; "xz" 'suspend-frame
  )

(global-evil-leader-mode)

(provide 'init-evil)

;;; init-evil.el ends here
