(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq evil-disable-insert-state-bindings t)

;; CHANGE LEADER KEY
(setq ;doom-leader-key ","
  doom-localleader-key ",")

;; my keybindings
(map! "M-o" '+treemacs/toggle
      "s-k" 'kill-this-buffer)

(with-eval-after-load 'evil-maps
  (define-key evil-insert-state-map (kbd "C-n") 'next-line)
  (define-key evil-insert-state-map (kbd "C-d") 'delete-char)
  (define-key evil-insert-state-map (kbd "C-k") 'kill-line)
  (define-key evil-insert-state-map (kbd "C-y") 'yank)
  (define-key evil-insert-state-map (kbd "C-v") 'scroll-up-command)
  (define-key evil-insert-state-map (kbd "M-v") 'scroll-down-command)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-insert-state-map (kbd "C-p") 'previous-line))
(setq evil-escape-key-sequence "kj")

(global-set-key (kbd "s-j") 'ace-window)
(global-set-key (kbd "s-.") '+evil/window-vsplit-and-follow)
;; as below
;; (map! :leader
;;       :desc "Testing"
;;       "c z" #'org-html-export-to-html)

(provide 'mw-bindings)
