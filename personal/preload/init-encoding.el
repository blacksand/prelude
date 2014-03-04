;;; init-encoding.el --- Setting system encoding
;;; Code:

;; Setting language environment

(defun set-utf8-environment()
  "Set language environment for utf-8"
  (interactive)

  (set-language-environment 'UTF-8)
  (setenv "LANG" "zh_CN.UTF-8")

  (if (eq system-type 'windows-nt)
      (progn
        (prefer-coding-system 'utf-8-unix)
        (setq file-name-coding-system 'chinese-gbk)
        (setq default-process-coding-system '(gbk-dos . gbk-unix)))
    )
  )

(set-utf8-environment)

;; 自动识别文件编码
(require 'unicad)

(provide 'init-encoding)

;;; init-encoding.el ends here
