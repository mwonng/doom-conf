;;; Configure Package Archives -----------------------------
;;; code
;;; Basic Appearance ---------------------------------------
(require 'mw-setting)
;; More minimal UI
(setq inhibit-startup-screen t)

;; Let the desktop background show through
(set-frame-parameter (selected-frame) 'alpha '(97 . 100))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

;;; Theme and Fonts ----------------------------------------

;; Install doom-themes
;; (unless (package-installed-p 'doom-themes)
;;   (package-install 'doom-themes))

;; Load up doom-palenight for the System Crafters look
;; (load-theme 'doom-palenight t)

;; NOTE: These settings might not be ideal for your machine, tweak them as needed!
(set-face-attribute 'default nil :font doom-font :weight 'light :height 180)
(set-face-attribute 'fixed-pitch nil :font doom-font :weight 'light :height 180)
(set-face-attribute 'variable-pitch nil :font doom-variable-pitch-font  :weight 'light :height 1.3)

;;; Org Mode Appearance ------------------------------------

;; Load org-faces to make sure we can set appropriate faces
(require 'org-faces)

;; Resize Org headings
(dolist (face '((org-level-1 . 1.5)
                (org-level-2 . 1.2)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font doom-variable-pitch-font :weight 'light :height (cdr face)))

;; Make the document title a bit bigger
(set-face-attribute 'org-document-title nil :font doom-variable-pitch-font :weight 'bold :height 1.3)

;; Make sure certain org faces use the fixed-pitch face when variable-pitch-mode is on
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

;;; Centering Org Documents --------------------------------

;;; Org Present --------------------------------------------

;; Install org-present if needed
;; (unless (package-installed-p 'org-present)
;;   (package-install 'org-present))

(defun my/org-present-prepare-slide (buffer-name heading)
  ;; Show only top-level headlines
  (org-overview)

  ;; Unfold the current entry
  (org-show-entry)

  ;; Show only direct subheadings of the slide but don't expand them
  (org-show-children))

(defun my/org-present-start ()
  ;; Tweak font sizes
  (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
                                     (header-line (:height 4.0) variable-pitch)
                                     (org-document-title (:height 1.75) org-document-title)
                                     (org-code (:height 1.55) org-code)
                                     (org-verbatim (:height 1.55) org-verbatim)
                                     (org-block (:height 1.25) org-block)
                                     (org-block-begin-line (:height 0.7) org-block)))

  ;; Set a blank header line string to create blank space at the top
  (setq header-line-format " ")

  ;; Display inline images automatically
  (org-display-inline-images)

  (org-present-read-only)
  ;; Center the presentation and wrap lines
  ;; (visual-fill-column-mode 1)
  ;; (visual-line-mode 1)
  )

(defun my/org-present-end ()
  ;; Reset font customizations
  (setq-local face-remapping-alist '((default variable-pitch default)))

  ;; Clear the header line string so that it isn't displayed
  (setq header-line-format nil)
  ;; Stop displaying inline images
  (org-remove-inline-images)

  (org-present-read-write)
  ;; Stop centering the document
  ;; (visual-fill-column-mode 0)
  ;; (visual-line-mode 0)
)

;; Turn on variable pitch fonts in Org Mode buffers
(add-hook 'org-mode-hook 'variable-pitch-mode)

;; Register hooks with org-present
(add-hook 'org-present-mode-hook 'my/org-present-start)
(add-hook 'org-present-mode-quit-hook 'my/org-present-end)
(add-hook 'org-present-after-navigate-functions 'my/org-present-prepare-slide)

(provide 'mw-org-present-config)
;;; mw-org-present-config.el ends here
