;;; init.el --- Emacs Configuration of cesar_peng. -*- lexical-binding: t no-byte-compile: t -*-
;;
;;; Commentary:
;;
;; The first trial
;;
;;; Code:

;; Speed up startup
(setq auto-mode-case-fold nil)

(unless (or (daemonp) noninteractive init-file-debug)
  (let ((old-file-name-handler-alist file-name-handler-alist))
    (setq file-name-handler-alist nil)
    (add-hook 'emacs-startup-hook
	      (lambda ()
		"Recover file name handlers."
		(setq file-name-handler-alist
		      (delete-dups (append file-name-handler-alist
					   old-file-name-handler-alist)))))))

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
	  (lambda ()
	    "Recover GC values after startup."
	    (setq gc-cons-threshold 800000)))

;; Suppress flashing at startup
(setq-default inhibit-redisplay t
	      inhibit-message t)
(add-hook 'window-setup-hook
	  (lambda ()
	    (setq-default inhibit-redisplay nil
			  inhibit-message nil)
	    (redisplay)))

;; Load path
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

;; Packages
(require 'init-package)

;; Preferences
(require 'init-const)
(require 'init-custom)
(require 'init-kbd)
(require 'init-ui)
(require 'init-minibuffer)
(require 'init-completion)
(require 'init-git)


;; Programming
(require 'init-dev)

