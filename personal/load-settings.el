;;; load-settings.el -- Load required personal settings
;;; Commentary:

;; Load required personal settings from `~/.emacs.d/init' directory

;;; Code:

(defvar personal-init-dir (expand-file-name "init" prelude-dir)
  "This directory is for your personal per module configuration.")

(message "Load personal setting files from: %s" personal-init-dir)

;; add `init' directory to `load-path'
(add-to-list 'load-path personal-init-dir)

;; load needed modules
;; (require 'init-encoding)     ; windows encoding settings
(require 'init-ui)              ; gui, fonts
(require 'init-sdcv)            ; before the `init-cygwin'
(if (eq system-type 'windows-nt)
    (require 'init-cygwin))     ; bash, zsh

(require 'init-evil)            ; evil
(require 'init-org)
(require 'init-misc)            ; server-mode

;;; load-settings.el ends here
