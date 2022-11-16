;;; init-custom.el --- Define customizations.      -*- lexical-binding: t -*-

;;; Commentary:

;; Customizaton.

;;; Code:

;; Load 'custom-file'
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'no-error 'no-message)


(when (file-exists-p custom-file)
  (load-file custom-file))

(show-paren-mode t)

(global-hl-line-mode 1)

(setq make-backup-files nil)

(provide 'init-custom)

;;; init-custom.el ends here
