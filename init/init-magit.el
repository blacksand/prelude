;;; init-magit.el --- magit settings

;;; Code:

(require 'magit-wip)

(setq magit-repo-dirs '("e:\\home" "e:\\projects"))

(setq magit-wip-commit-message "\"WIP %r\"")
(global-magit-wip-save-mode)

;; 因为使用了自编译的 git 而非 cygwin 自带的, 所以需要调整这个参数
;; (if (eq system-type 'windows-nt)
;;  (setq magit-process-quote-curly-braces nil))

(provide 'init-magit)

;;; init-magit.el ends here
