;;; init-misc.el --- misc settings
;;; Commentary:

;; open server-mode

;;; Code:

;; 不用 guru 模式
(setq prelude-guru nil)

;; windows 下不使用 flyspell
(unless (eq system-type 'windows-nt)
  (flyspell-prog-mode))

;; 备份目录
(let ((backup-directory "~/.emacs.d/backup"))
  (unless (file-directory-p backup-directory)
    (make-directory backup-directory))

  (setq backup-directory-alist
        `((".*" . ,backup-directory)))

  (setq auto-save-file-name-transforms
        `((".*" ,backup-directory t))))

;; ack: only in cygwin shell
(if (eq system-type 'windows-nt)
    (progn
      (setenv "PERL5LIB" "/e/home/perl5/lib/perl5")
      (setq ack-and-a-half-executable "/usr/local/bin/ack")
      ))

;; 默认 text 模式打开所有文件
(set-default major-mode 'text-mode)

;; 鼠标避让
(if (functionp 'mouse-avoidance-mode)
    (mouse-avoidance-mode 'banish))

;; 使用 cal-china-x 中文日历
(require 'cal-china-x)
;; (setq calendar-mark-holidays-flag t)
(setq calendar-holidays
      '((holiday-fixed 1 1    "元旦")
        (holiday-fixed 2 14   "情人节")
        (holiday-fixed 3 14   "白色情人节")
        (holiday-fixed 3 8    "妇女节")
        (holiday-fixed 4 1    "愚人节")
        (holiday-fixed 5 1    "劳动节")
        (holiday-fixed 6 1    "儿童节")
        (holiday-fixed 9 10   "教师节")
        (holiday-fixed 10 1   "国庆节")
        (holiday-fixed 10 2   "国庆节")
        (holiday-fixed 10 3   "国庆节")
        (holiday-fixed 10 31  "万圣节")
        (holiday-fixed 12 25  "圣诞节")

        (holiday-float 5 0 2  "母亲节")
        (holiday-float 6 0 3  "父亲节")
        (holiday-float 11 4 4 "感恩节")

        (holiday-lunar 1 1    "春节" 0)
        (holiday-lunar 1 2    "初二" 0)
        (holiday-lunar 1 3    "初三" 0)
        (holiday-lunar 1 15   "元宵节" 0)
        (holiday-lunar 5 5    "端午节" 0)
        (holiday-lunar 8 15   "中秋节" 0)
        (holiday-lunar 9 9    "重阳节")
        (holiday-lunar 12 30  "除夕" 0)

        (holiday-solar-term   "立春" "立春")
        (holiday-solar-term   "清明" "清明节")
        (holiday-solar-term   "立夏" "立夏")
        (holiday-solar-term   "夏至" "夏至")
        (holiday-solar-term   "立秋" "立秋")
        (holiday-solar-term   "立冬" "立冬")
        (holiday-solar-term   "冬至" "冬至")))

;; server mode
(server-mode)

(provide 'init-misc)

;;; init-misc.el ends here
