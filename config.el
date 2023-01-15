(add-to-list 'load-path "~/.doom.d/lisp")
(require 'mw-setting)

(setq user-full-name "Michael Wang"
      user-mail-address "michael@wonng.com")

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
