;;; init-kbd.el --- Shortcut -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; When you forget
(use-package which-key
  :defer nil
  :config (which-key-mode))

(defalias 'yes-or-no-p 'y-or-n-p)

;;Define a function to open the init file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;;Attach <f6> to the above function
(global-set-key (kbd "<XF86Cut>") 'open-init-file)


(provide 'init-kbd)

;;; init-kbd.el ends here
