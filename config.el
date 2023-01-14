(add-to-list 'load-path "~/.doom.d/lisp")
(require 'mw-setting)
(require 'mw-global)
(require 'init-window)
(require 'mw-modeline)
(require 'mw-bindings)
(require 'mw-cursor)
(require 'mw-coding)

(setq user-full-name "Michael Wang"
      user-mail-address "michael@wonng.com")

(require 'mw-org-setting)
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
(require 'mw-org-present-config)
;; (add-to-list 'load-path "~/.doom.d/lisp/org-present")
;; (autoload 'org-present "org-present" nil t)
;; (eval-after-load "org-present"
;;   '(progn
;;      (add-hook 'org-present-mode-hook
;;                (lambda ()
;;                  (org-present-big)
;;                  (org-display-inline-images)
;;                  (org-present-hide-cursor)
;;                  (org-present-read-only)
;;                  (message mw/default-font)
;;                  ))
;;      (add-hook 'org-present-mode-quit-hook
;;                (lambda ()
;;                  (org-present-small)
;;                  (org-remove-inline-images)
;;                  (org-present-show-cursor)
;;                  (org-present-read-write)))))
