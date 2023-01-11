(load-file "~/.doom.d/lisp/org-setting.el")
(load-file "~/.doom.d/lisp/init-window.el")
(load-file "~/.doom.d/lisp/modeline.el")
(load-file "~/.doom.d/lisp/my-bindings.el")
(load-file "~/.doom.d/lisp/cursor.el")

(setq user-full-name "Michael Wang"
      user-mail-address "michael@wonng.com")

(setq my/mono-font-family "OperatorMonoSSmLig Nerd Font Mono")
(setq my/san-font-family "Iosevka Aile")

(set-face-attribute 'fixed-pitch nil
                    :font my/mono-font-family
                    :weight 'medium
                    :height 1.0
                    )

(setq doom-font (font-spec :family my/mono-font-family :size 18.0 :weight 'light)
      doom-variable-pitch-font (font-spec :family my/san-font-family :weight 'medium)
      doom-serif-font (font-spec :family my/mono-font-family :weight 'light)
      doom-theme 'ayu-light
      display-line-numbers-type t
      org-directory "~/orgs/"
      )

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(add-hook 'org-mode-hook 'my/style-org)

;; ;; turn auto save off
(setq auto-save-default nil)

;; auto wrap the line over 80 column
(global-visual-line-mode t)

(setq fancy-splash-image (concat doom-user-dir "logo.png"))

;; show git blame inline
(use-package blamer
  :bind (("s-i" . blamer-show-commit-info))
  :defer 20
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                   :background nil
                   :height 120
                   :italic t))))
(setq blamer-view 'overlay)
(setq blamer-author-formatter "  ✎ %s ")
(setq blamer-commit-formatter " ● %s")
(setq tree-sitter-hl-mode t)
