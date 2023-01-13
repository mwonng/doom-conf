;;; package --- Summary: define my font config
;;;
;;

;;; Commentary:
;;; code:
(defvar mw/default-font "TEST")

(defvar my/mono-font-family "OperatorMonoSSmLig Nerd Font Mono")
(defvar my/san-font-family "Iosevka Aile")

(setq doom-font (font-spec :family my/mono-font-family :size 18.0 :weight 'light)
      doom-variable-pitch-font (font-spec :family my/san-font-family :weight 'light)
      doom-serif-font (font-spec :family my/mono-font-family :weight 'light)
      doom-theme 'timu-spacegrey
      display-line-numbers-type t
      org-directory "~/orgs/")

(provide 'mw-setting)
;;; mw-setting.el ends here
