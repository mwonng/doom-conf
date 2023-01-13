;;; lisp/coding.el -*- lexical-binding: t; -*-

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

(provide 'mw-coding)
