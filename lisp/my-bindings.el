(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; CHANGE LEADER KEY
(setq ;doom-leader-key ","
  doom-localleader-key ",")

;; my keybindings
(map! "M-o" '+treemacs/toggle
      "s-k" 'kill-this-buffer)

;; binding with leader key template
;; as below
;; (map! :leader
;;       :desc "Testing"
;;       "c z" #'org-html-export-to-html)

(provide 'mw/my-bidings)
