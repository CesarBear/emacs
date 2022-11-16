;;; init-completion.el --- The completion engine -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind (:map company-mode-map
	      ([remap completion-at-point] . company-complete)
	      :map company-active-map
	      ("C-s" . company-filter-candidates)
	      ([tab] . company-complete-common-or-cycle)
	      ([backtab] . company-select-previous-or-abort))
  :config
  (define-advice company-capf--candidates (:around (func &rest args))
    "Try default completion styles."
    (let ((completion-styles '(basic partial-completion)))
      (apply func args)))
  :custom
  (company-idle-delay 0)
  ;; Easy navigation to candidates with M-<n>
  (company-show-quick-access t)
  (company-require-match nil)
  (company-minimum-prefix-length 3)
  (company-tooltip-width-grow-only t)
  (company-tooltip-align-annotations t)
  ;; complete `abbrev' only in current buffer and make dabbrev case-sensitive
  (company-dabbrev-other-buffers nil)
  (company-dabbrev-ignore-case nil)
  (company-dabbrev-downcase nil)
  ;; make dabbrev-code case-sensitive
  (company-dabbrev-code-ignore-case nil)
  (company-dabbrev-code-everywhere t)
  ;; call `tempo-expand-if-complete' after completion
  (company-tempo-expand t)
  ;; No icons
  (company-format-margin-function nil)
  (company-backends '((company-capf :with company-tempo)
		      company-files
		      (company-dabbrev-code company-keywords)
		      company-dabbrev
		      company-capf)))

(provide 'init-completion)

;;; init-completion.el ends here
	 
