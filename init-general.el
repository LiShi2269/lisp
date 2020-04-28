
;; ===== Evil Mode =====
(require 'evil)
(require 'general)
(evil-mode )

(require 'evil-leader)
;; (global-evil-leader-mode)






;; ======= hydra ============
(defhydra hydra-zoom ()
  "zoom"
  ("{" text-scale-increase "in")
  ("}" text-scale-decrease "out"))





;;(define-key bookmark-bmenu-mode-map (kbd "j") 'next-line)
;;(define-key bookmark-bmenu-mode-map (kbd "k") 'previous-line)
;;(define-key bookmark-bmenu-mode-map (kbd "<SPC>") 'smex)



 


(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 :prefix "SPC"
    ;; ---- dir ----
    "ad" 'deer
    "ar" 'ranger
    "an" 'neotree-toggle
;;    "an" 'neotree
    "ff" 'find-file
    ;; ---- buffer ----
    "<spc>" 'smex
    "fs" 'save-buffer
    "bb" 'buffer-menu
    "bd" 'kill-this-buffer
    "<tab>" 'mode-line-other-buffer
    "bi" 'ido-switch-buffer

    ;; ---- window ----
    "w-" 'split-window-below
    "w/" 'split-window-horizontally
    "wd" 'delete-window
    "wD" 'delete-other-windows 
    "wl" 'evil-window-right
    "wL" 'evil-window-move-far-right
    "wh" 'evil-window-left
    "wH" 'evil-window-move-far-left
    "wk" 'evil-window-up
    "wK" 'evil-window-move-very-top
    "wj" 'evil-window-down
    "wJ" 'evil-window-move-very-bottom
    "w=" 'balance-windows
    "wF" 'make-frame-command  
    "wc" 'centered-window-mode

    ;; ---- book mark----
    "Mm" 'bookmark-set
    "Mj" 'bookmark-jump
    "Ml" 'list-bookmarks
    "Ms" 'bookmark-save
    ;; ---- zoom ----
    "z" 'hydra-zoom/body
    ;; ---- toggle ----
    "TF" 'toggle-frame-fullscreen
    ;; ---- quit ----
    "qq" 'kill-emacs
    "qR" 'eval-buffer
    "qs" 'save-buffers-kill-emacs
    ;; ---- quit ----
    "se" 'iedit-mode
    "`"  'shell)


(evil-normalize-keymaps)

(define-key evil-normal-state-map (kbd "L") 'evil-end-of-line )
(define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)

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

(winum-mode)


;; ======= evil mode =======
(provide 'init-general)
