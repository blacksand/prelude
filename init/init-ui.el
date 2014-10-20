;;; init-ui.el --- setting ui options

;; Setting scroll bar
(setq scroll-margin 5)
(prelude-require-packages '(yascroll))
(require 'yascroll)
(setq yascroll:delay-to-hide nil)
(global-yascroll-bar-mode 1)

(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; (prelude-require-packages '(switch-window))
;; (require 'switch-window)
;; (global-set-key (kbd "C-x o") 'switch-window)
(prelude-require-packages '(window-number))
(require 'window-number)
(window-number-mode 1)

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
      (setq solarized-height-plus-4 1.05)

      (load-theme 'solarized-dark t)))

(prelude-require-package 'powerline)
(require 'powerline)
(setq powerline-default-separator 'slant)
(powerline-center-evil-theme)

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

;; Emacs does not beep or flash anymore,
;; on hit C-g in the minibuffer or during
;; an isearch.
(setq ring-bell-function
      (lambda ()
        (unless (memq this-command
                      '(isearch-abort
                        abort-recursive-edit
                        exit-minibuffer
                        keyboard-quit))
          ;; (ding))))
          (message "*BEEP* : %s" this-command))))

(provide 'init-ui)

;;; init-ui.el ends here
