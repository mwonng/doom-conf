(add-to-list 'load-path "~/.doom.d/lisp")
(require 'mw-ui-config)

(setq user-full-name "Michael Wang"
      user-mail-address "michael@wonng.com")

(setq doom-font (font-spec :family my/mono-font-family :size 18.0 :weight 'light)
      doom-variable-pitch-font (font-spec :family my/san-font-family :weight 'light)
      doom-serif-font (font-spec :family my/mono-font-family :weight 'light)
      doom-theme 'timu-spacegrey)

(setq org-directory "~/orgs/")

(require 'mw-global)
(require 'init-window)
(require 'mw-modeline)
(require 'mw-bindings)
(require 'mw-cursor)
(require 'mw-coding)
(require 'mw-org-setting)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                writeroom-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0)
                        (turn-off-flyspell))))
(add-hook 'org-mode-hook 'my/style-org)
(require 'mw-org-present-config)
