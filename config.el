(load-file "~/.doom.d/lisp/global.el")
(load-file "~/.doom.d/lisp/init-window.el")
(load-file "~/.doom.d/lisp/modeline.el")
(load-file "~/.doom.d/lisp/my-bindings.el")
(load-file "~/.doom.d/lisp/cursor.el")
(load-file "~/.doom.d/lisp/coding.el")

(setq user-full-name "Michael Wang"
      user-mail-address "michael@wonng.com")

(load-file "~/.doom.d/lisp/org-setting.el")
(add-hook 'org-mode-hook 'my/style-org)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                writeroom-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0)
                        (turn-off-flyspell))))

(add-to-list 'load-path "~/.doom.d/lisp/org-present")
(autoload 'org-present "org-present" nil t)
