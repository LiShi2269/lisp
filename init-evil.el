
;; ===== Evil Mode =====
;;load evil
(require 'evil)
(evil-mode )

(require 'evil-leader)
(global-evil-leader-mode)





;; ======= hydra ============
(defhydra hydra-zoom ()
  "zoom"
  ("{" text-scale-increase "in")
  ("}" text-scale-decrease "out"))







(evil-leader/set-leader "<SPC>")
(evil-normalize-keymaps)
(evil-leader/set-key

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
    )

(define-key evil-normal-state-map (kbd "L") 'evil-end-of-line )
(define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)


    



;; ======= declare =======
;; (which-key-declare-prefixes-for-mode 'python-mode "SPC m" "Python")
;; (which-key-declare-prefixes-for-mode 'python-mode "SPC m" "Python")
;; ======= evil mode =======
(provide 'init-evil)
