(defun my/org-init-settings ()
  (org-superstar-mode t)
  ;; improve org mode looks
  (setq org-startup-indented t
        org-pretty-entities t
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-src-fontify-natively t
        org-image-actual-width '(300))
  )

(setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))
;; (setq org-ellipsis " ▾")
(defun my/org-font-settings ()
  ;; Increase the size of various headings
  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Iosevka Aile" :weight 'Medium :height (cdr face)))
  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-indent nil   :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-link nil     :inherit 'fixed-pitch :underline)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-superstar-header-bullet nil :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-superstar-leading-bullet nil :inherit 'fixed-pitch)
  ;; (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  ;; (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)
  )

(defun my/style-org ()
  (my/org-font-settings)
  (my/org-init-settings)
  (doom/reload-font)
  (variable-pitch-mode 1)
  (text-scale-set 3)
  ;; (setq line-spacing 0.2)
  ;; (global-blamer-mode nil)
  )

(provide 'mw/org-setting)
