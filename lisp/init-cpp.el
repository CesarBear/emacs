;;; init-cpp.el --- Cpp Prog Configuration -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Make editing easier
(use-package cc-mode
  :ensure nil
  :mode ("\\.cxx\\'" . c++-mode)
  :hook
  (c-mode-common . (lambda ()
	      (c-set-style "stroustrup")))
  :init (setq-default c-basic-offset 4)
  :config
  (with-no-warnings
    (defconst ccls-args nil)
    (defconst clangd-args '("-j=2"
       			    "--malloc-trim"
			    "--background-index"
			    "--clang-tidy"
			    "--completion-style=bundled"
			    "--pch-storage=memory"
			    "--header-insertion=iwyu"
			    "--header-insertion-decorators"))
    (with-eval-after-load 'lsp-mode
      (cond ((executable-find "clangd") (setq lsp-clients-clangd-executable "clangd"
					      lsp-clangd-version "15.0.3"
					      lsp-clients-clangd-args clangd-args))
	    ((executable-find "ccls") (setq lsp-clients-clangd-executable "ccls"
					    lsp-clangd-version "15.0.3"
					    lsp-clients-clangd-args ccls-args)))))
  (use-package modern-cpp-font-lock
    :diminish
    :init (modern-c++-font-lock-global-mode t)))

;; Build projects with cmake
(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.t'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode))
  :bind (:map cmake-mode-map
	      ;; Compatible with lsp-mode
	      ("C-c d" . cmake-help)))

(provide 'init-cpp)

;;; init-cpp.el ends here
