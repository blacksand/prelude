;;; settings.el --- Prelude preload settings

;; Setting packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))

;; Setting language environment
(defun set-utf8-environment()
  "Set language environment for utf-8"
  (interactive)

  ;; (set-language-environment 'UTF-8)
  ;; (setenv "LANG" "zh_CN.UTF-8")

  (prefer-coding-system 'utf-8-unix)
  (setq file-name-coding-system 'chinese-gbk)
  (setq default-process-coding-system '(gbk-dos . gbk-unix)))

(if (eq system-type 'windows-nt)
    (set-utf8-environment))

;; 自动识别文件编码
(require 'unicad)

;; disable flyspell for windows
;; windows环境中, 拼写检查反应太慢且有问题
(if (eq system-type 'windows-nt)
    (setq prelude-flyspell nil))

;;; settings.el ends here
