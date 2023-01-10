(setq user-full-name "Michael Wang"
      user-mail-address "michael@wonng.com")

(setq my/mono-font-family "OperatorMonoSSmLig Nerd Font Mono")
(setq my/san-font-family "Merriweather")

;; CHANGE LEADER KEY
(setq ;doom-leader-key ","
  doom-localleader-key ",")

(setq evil-emacs-state-cursor '("cyan" bar))
(setq evil-normal-state-cursor '("green1" box))
(setq evil-visual-state-cursor '("cyan" box))
(setq evil-insert-state-cursor '("green1" bar))
(setq evil-replace-state-cursor '("orange" hollow))
(setq evil-operator-state-cursor '("red" hbar))

;; set transparentcy
(defvar efs/frame-transparency '(95 . 95))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(setq doom-font (font-spec :family my/mono-font-family :size 18.0 :weight 'light)
      doom-variable-pitch-font (font-spec :family my/san-font-family :weight 'normal)
      doom-serif-font (font-spec :family my/mono-font-family :weight 'light)
      doom-theme 'doom-spacegrey
      display-line-numbers-type t
      org-directory "~/orgs/"
      )

;; center the frame
(defun my/frame-recenter (&optional frame)
  "Center FRAME on the screen.
FRAME can be a frame name, a terminal name, or a frame.
If FRAME is omitted or nil, use currently selected frame."
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0) (left . 0.5) (height . 65) (width . 150)))))
(add-hook 'after-init-hook #'my/frame-recenter)
(add-hook 'after-make-frame-functions #'my/frame-recenter)

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-window-width-limit 75)
  (doom-modeline-bar-width 1)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-enable-word-count nil)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-indent-info nil)
  (doom-modeline-checker-simple-format t)
  (doom-modeline-vcs-max-length 12)
  (doom-modeline-env-version t)
  (doom-modeline-irc-stylize 'identity)
  (doom-modeline-github-timer nil)
  (doom-modeline-gnus-timer nil))


;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq org-ellipsis " ▾")

(defun my/org-init-settings ()
  ;; (org-superstar-mode t)
  ;; improve org mode looks
  (setq org-startup-indented t
        org-pretty-entities t
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-src-fontify-natively t
        org-image-actual-width '(300))
  )

(setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))

(defun my/org-font-settings ()
  ;; Increase the size of various headings
  ;; Set faces for heading levels
  (set-face-attribute 'org-document-title nil :font "Merriweather" :weight 'bold :height 1.3)
  (set-face-attribute 'org-level-1 nil :font "Lato" :weight 'bold :height 1.8 :foreground "PaleVioletRed1")
  (set-face-attribute 'org-level-2 nil :font "Lato" :weight 'bold :height 1.3 :foreground "PaleVioletRed2")
  (set-face-attribute 'org-level-3 nil :font "Lato" :weight 'regular :height 1.05 :foreground "PaleVioletRed3")
  (set-face-attribute 'org-level-4 nil :font "Lato" :weight 'regular :height 1.0)
  (set-face-attribute 'org-level-5 nil :font "Lato" :weight 'regular :height 1.1)
  (set-face-attribute 'org-level-6 nil :font "Lato" :weight 'regular :height 1.1)
  (set-face-attribute 'org-level-7 nil :font "Lato" :weight 'regular :height 1.1)
  (set-face-attribute 'org-level-8 nil :font "Lato" :weight 'regular :height 1.1)

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-indent nil   :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-link nil     :inherit 'fixed-pitch :foreground "SkyBlue1" :underline t)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :foreground "PaleVioletRed1" :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-superstar-header-bullet nil :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-superstar-leading-bullet nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

(defun my/style-org ()
  (my/org-font-settings)
  (my/org-init-settings)
  (doom/reload-font)
  (setq line-spacing 0.1)
  ;; (global-blamer-mode nil)
  )

(add-hook 'org-mode-hook 'my/style-org)

;; ;; turn auto save off
(setq auto-save-default nil)

;; auto wrap the line over 80 column
(global-visual-line-mode t)

(setq doom-themes-treemacs-theme "doom-colors")
(setq doom-themes-treemacs-enable-variable-pitch nil)


;; set transparency
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))

;; my keybindings
(map! "M-o" '+treemacs/toggle
      "s-k" 'kill-this-buffer)

;; binding with leader key template
;; as below
;; (map! :leader
;;       :desc "Testing"
;;       "c z" #'org-html-export-to-html)

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
