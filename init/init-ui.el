;;; init-ui.el --- setting ui options

;; Setting scroll bar
(prelude-require-packages '(yascroll))
(require 'yascroll)
(setq yascroll:delay-to-hide nil)
(global-yascroll-bar-mode 1)

(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; theme: 终端模式下的 solarized 有些问题
(if (display-graphic-p)
    (progn
      (prelude-require-packages '(solarized-theme))
      (require 'solarized)

      ;; 标题内容不使用可变宽度字体
      (setq solarized-use-variable-pitch nil)

      ;; 让 org 标题行排列更整齐
      (setq solarized-height-plus-1 1.1)
      (setq solarized-height-plus-2 1.1)
      (setq solarized-height-plus-3 1.1)
      (setq solarized-height-plus-4 1.1)

      (load-theme 'solarized-dark t)))

(prelude-require-package 'powerline)
(require 'powerline)
(powerline-default-theme)

;; Setting font
(let ((english-font "Consolas")
      (chinese-font "YaHeiConsola"))
  (if (member english-font (font-family-list))
      (set-face-attribute 'default nil
                          :family english-font :height 128))

  (if (member chinese-font (font-family-list))
      (dolist (charset '(cp936 big5))
        (set-fontset-font (frame-parameter nil 'font)
                          charset
                          (font-spec :family chinese-font :height 128)))))

(provide 'init-ui)

;;; init-ui.el ends here
