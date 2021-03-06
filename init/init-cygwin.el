;;; init-cygwin.el --- Setting cygwin environment

;;; Code:

(defun set-shell-cygwin()
  "Set shell-command use `bash', shell-mode use `zsh'."
  (interactive)
  (setenv "LANG" "zh_CN.UTF-8")
  (setq null-device "/dev/null")
  (setq shell-file-name "bash")
  (setq explicit-shell-file-name "zsh")
  (setq explicit-zsh-args '("--login" "-i"))
  (setenv "PATH" (concat "e:/cygwin/bin;" (getenv "PATH")))
  ;; (setq w32-quote-process-args ?\") ;; should be "t" ?

  (setenv "SHELL" explicit-shell-file-name)
  (setq default-process-coding-system '(utf-8-dos . gbk-unix))
  (setq sdcv-execute-file "/e/cygwin32/bin/sdcv"))

(defun set-shell-cmdproxy()
  "Set shell to `cmdproxy'."
  (interactive)
  (setenv "LANG" "zh_CN.GBK")
  (setq null-device "NUL")
  (setq shell-file-name "cmdproxy.exe")
  (setq explicit-shell-file-name shell-file-name)

  (setenv "SHELL" shell-file-name)
  (setq default-process-coding-system '(gbk-dos . gbk-unix))
  (setq sdcv-execute-file "e:/cygwin32/bin/sdcv"))

(defun zsh()
  "Use cygwin zsh shell."
  (interactive)
  (set-shell-cygwin)
  (shell)
  ;; (set-shell-cmdproxy)
  )

(defun cygwin-environ-setup ()
  (prelude-require-package 'cygwin-mount)
  (require 'cygwin-mount)
  (cygwin-mount-activate)

  ;; (setq cygwin-root-directory "e:/cygwin")
  ;; (require 'setup-cygwin)
  (modify-coding-system-alist 'process "git" '(utf-8-dos . utf-8-unix))
  (modify-coding-system-alist 'process "[zZ]sh" '(utf-8-dos . utf-8-unix))
  (modify-coding-system-alist 'process "[bB]ash" '(undecided-dos . undecided-unix)))

(if (eq system-type 'windows-nt)
    (progn
      (cygwin-environ-setup)
      (set-shell-cygwin)))

(provide 'init-cygwin)

;;; init-cygwin.el ends here
