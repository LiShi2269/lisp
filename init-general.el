
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

(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 :prefix  "m"
 (kbd "m") 'bookmark-set
 (kbd "l") 'list-bookmarks
 )


;;major-mode-hydra
(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 (kbd ",") 'my-major-mode-fun
 ;; (kbd "<f6>") 'my-test-fun
 )

(defun my-save-buffer()(interactive)
       (if (bound-and-true-p ein:notebook)(ein:notebook-save-notebook-command-km)(save-buffer))
       )

(defun my-major-mode-fun()(interactive)
    ;; 如果major-mode是python
    ;; 	查看minor-mode当中有无ein
    ;; 	    如果有
    ;; 	    如果没有
    ;; 如果major-mode是org的话
       (cond ((equal major-mode 'python-mode)
		    (if (bound-and-true-p ein:notebook-mode)  (hydra-ein/body) (hydra-python/body))) 
	     ((equal major-mode 'emacs-lisp-mode) (print " emacs-lisp-mode do not have mode key")) 
             ((equal major-mode 'org-mode) (hydra-org/body))
	     )
       )






(add-hook 'bookmark-bmenu-mode-hook 'myset-bookmark-menu-function)
(defun myset-bookmark-menu-function()
    (define-key bookmark-bmenu-mode-map (kbd "j") 'next-line)
    (define-key bookmark-bmenu-mode-map (kbd "k") 'previous-line)
  )




 
(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 (kbd "M-l") 'evil-window-right
 (kbd "M-h") 'evil-window-left
 (kbd "M-j") 'evil-window-down
 (kbd "M-k") 'evil-window-up
 )






(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 :prefix "SPC"
    ;; ---- dir ----
    "ad" 'deer
    "ar" 'ranger
    "an" 'neotree-toggle
    "al" 'org-store-link
    "aa" 'org-agenda
    "ac" 'org-capture
    "as" 'org-switchb
    "aw" 'org-agenda-list
    "at" 'org-todo-list

    "ff" 'find-file
    ;; ---- buffer ----
    "<spc>" 'smex
    "fs" 'my-save-buffer
    ;; "fs" 'save-buffer
    "bb" 'buffer-menu
    ;; 返回dashboard
    "bh" (lambda()(interactive)(switch-to-buffer "*dashboard*"))
    "bd" 'kill-this-buffer
    "<tab>" 'mode-line-other-buffer
    "bi" 'ido-switch-buffer

    ;; ---- Hight-symbol ----
    "sh" 'highlight-symbol
    "s>" 'highlight-symbol-next
    "s<" 'highlight-symbol-prev
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
    "`"  'shell)


;; (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line )
;; (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)

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
