;;; Package --- my personal org style
;;; Commentary:
;;; Code:
(require 'org-superstar)
(require 'writeroom-mode)
(require 'mw-ui-config)

(defun my/org-init-settings ()
  "Init my setting when 'org-mode'."
  (org-superstar-mode t)
  ;; (evil-org-mode 1)
  ;; improve org mode looks
  (setq org-startup-indented t
        org-pretty-entities t
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-src-fontify-natively t
        org-image-actual-width '(800)))

(setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))
(defun my/org-font-settings ()
  "Reload different font setting for 'org-mode'."
  ;; Increase the size of various headings
  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.5)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font my/san-font-family :weight 'light :height (cdr face)))
  ;; Ensure that anything that should be doom-font in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'doom-font)
  (set-face-attribute 'org-table nil    :inherit 'doom-font)
  (set-face-attribute 'org-indent nil   :inherit '(org-hide doom-font))
  (set-face-attribute 'org-table nil    :inherit 'doom-font)
  (set-face-attribute 'org-formula nil  :inherit 'doom-font)
  (set-face-attribute 'org-code nil     :inherit '(shadow doom-font))
  (set-face-attribute 'org-table nil    :inherit '(shadow doom-font))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow doom-font))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face doom-font))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face doom-font))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face doom-font))
  (set-face-attribute 'org-checkbox nil  :inherit 'doom-font))

(defun my/style-org ()
  "Loading my org style."
  (my/org-init-settings)
  (my/org-font-settings)
  (variable-pitch-mode 1)
  (writeroom-mode 1))

(provide 'mw-org-setting)
;;; mw-org-setting.el ends here.
