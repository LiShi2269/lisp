
;; ===== Evil Mode =====
;;load evil
(require 'evil)
(evil-mode )

(require 'evil-leader)
(global-evil-leader-mode)

;; ======= yasnippet ============
(yas-reload-all)
(add-hook 'python-mode-hook #'yas-minor-mode)

(evil-leader/set-leader "<SPC>")
(evil-normalize-keymaps)
(evil-leader/set-key

    ;; ---- dir ----
    "ad" 'deer
    "ar" 'ranger
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

    ;; ---- toggle ----
    "TF" 'toggle-frame-fullscreen
    ;; ---- quit ----
    "qq" 'kill-emacs
    "qs" 'save-buffers-kill-emacs
    
)

;; ======= declare =======
;; (which-key-declare-prefixes-for-mode 'python-mode "SPC m" "Python")

;; ======= evil mode =======
(provide 'init-evil)
