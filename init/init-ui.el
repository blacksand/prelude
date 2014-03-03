;;; init-ui.el --- setting ui options

;; Setting scroll bar
(prelude-require-packages '(yascroll))
(require 'yascroll)

(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(if (display-graphic-p)
    (progn
      (prelude-require-packages '(solarized-theme))
      (require 'solarized)
      (load-theme 'solarized-dark t)))

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
                          (font-spec :family chinese-font)))))

(provide 'init-ui)

;;; init-ui.el ends here
