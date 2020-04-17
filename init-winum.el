

;; ---winum---
(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-`") 'winum-select-window-by-number)
      (define-key map (kbd "C-²") 'winum-select-window-by-number)
      (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))
(require 'winum)
(winum-mode 1)

(general-define-key
 :states  '(normal motion)
 :keymaps 'override
 :prefix "SPC"
  "w0" 'winum-select-window-0
  "w1" 'winum-select-window-1
  "w2" 'winum-select-window-2
  "w3" 'winum-select-window-3
  "w4" 'winum-select-window-4
  "w5" 'winum-select-window-5
  "w6" 'winum-select-window-6
  "w7" 'winum-select-window-7
  "w8" 'winum-select-window-8
  "w9" 'winum-select-window-9
 )


;; ======= provide =======
(provide 'init-winum)


