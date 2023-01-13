;;; lisp/global.el -*- lexical-binding: t; -*-

;; (setq my/mono-font-family "OperatorMonoSSmLig Nerd Font Mono")
;; (setq my/san-font-family "Iosevka Aile")

;; (setq doom-font (font-spec :family my/mono-font-family :size 18.0 :weight 'light)
;;       doom-variable-pitch-font (font-spec :family my/san-font-family :weight 'light)
;;       doom-serif-font (font-spec :family my/mono-font-family :weight 'light)
;;       doom-theme 'timu-spacegrey
;;       display-line-numbers-type t
;;       org-directory "~/orgs/")

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

(setq display-fill-column-indicator t)

(setq fancy-splash-image (concat doom-user-dir "logo.png"))

(provide 'mw-global)
