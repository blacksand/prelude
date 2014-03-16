;;; init-sdcv.el --- setting sdcv

(prelude-require-package 'popup)

(if (eq system-type 'windows-nt)
    (setq sdcv-execute-file "e:/cygwin32/bin/sdcv"))

(setq sdcv-dictionary-simple-list '("CEDICT汉英辞典"
                                    "牛津简明英汉袖珍辞典"
                                    "朗道汉英词典5.0"
                                    "朗道英汉词典5.0"
                                    "现代汉语词典"))

(setq sdcv-dictionary-complete-list '("CEDICT汉英辞典"
                                      "牛津简明英汉袖珍辞典"
                                      "朗道汉英词典5.0"
                                      "朗道英汉词典5.0"
                                      "牛津现代英汉双解词典"
                                      "现代汉语词典"))

(autoload 'sdcv-search-input "sdcv")
(autoload 'sdcv-search-pointer+ "sdcv")

(defun call-sdcv+ ()
  (interactive)
  (save-excursion
    (if (eq system-type 'windows-nt)
        (let ((coding-system-for-read 'utf-8-unix)
              (coding-system-for-write 'gbk-unix))
          (sdcv-search-pointer+))
      (sdcv-search-pointer+)))
  )

(defun call-sdcv ()
  (interactive)
  (save-excursion
    (if (eq system-type 'windows-nt)
        (let ((coding-system-for-read 'utf-8-unix)
              (coding-system-for-write 'gbk-unix))
          (sdcv-search-input))
      (sdcv-search-input)))
  )

;; 需要先去除 prelude 中的冲突快捷键
(define-key prelude-mode-map (kbd "C-c s") nil)
(define-key prelude-mode-map (kbd "C-c S") nil)

;; (global-set-key (kbd "C-c t") 'call-sdcv)
;; (global-set-key (kbd "C-c d") 'call-sdcv+)
(global-set-key (kbd "C-c S") 'sdcv-search-input)
(global-set-key (kbd "C-c s") 'sdcv-search-pointer+)

(provide 'init-sdcv)

;;; init-sdcv.el ends here
