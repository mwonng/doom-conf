;;; Package -- my emacs setting
;;; Commentary:
;;; Code:
;;; lisp/global.el -*- lexical-binding: t; -*-
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; ;; turn auto save off
(setq auto-save-default nil)

;; auto wrap the line over 80 column
(global-visual-line-mode t)

(setq fancy-splash-image (concat doom-user-dir "logo.png"))

(provide 'mw-global)
;;; mw-global.el ends here.
