
;; ======= completionS=======
(global-company-mode 1)
(define-key company-active-map (kbd "C-j") 'company-select-next)
(define-key company-active-map (kbd "C-k") 'company-select-previous)

;;注释
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-'") 'comment-dwim)

;; ======= ido =======
(defun ido-my-keys ()
"Add my keybindings for Ido."
(define-key ido-completion-map (kbd "C-j") 'ido-next-match)
(define-key ido-completion-map (kbd "C-k") 'ido-prev-match)
)
(add-hook 'ido-setup-hook 'ido-my-keys)



;; ======= iBuffer =======
(define-key ibuffer-mode-map (kbd "j") 'next-line)
(define-key ibuffer-mode-map (kbd "k") 'previous-line)
(define-key ibuffer-mode-map (kbd "M-l") 'evil-window-right)
(define-key ibuffer-mode-map (kbd "M-h") 'evil-window-left)
(define-key ibuffer-mode-map (kbd "M-j") 'evil-window-down)
(define-key ibuffer-mode-map (kbd "M-k") 'evil-window-up)


;; ======= ivy =======
(define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)

;; ======= shell-mode =======
(define-key shell-mode-map (kbd "C-j") 'comint-next-input)
(define-key shell-mode-map (kbd "C-k") 'comint-previous-input)

;; ========== nswbuff 快速切换 ===============
(global-set-key (kbd "C-S-l") 'nswbuff-switch-to-next-buffer)
(global-set-key (kbd "C-S-h") 'nswbuff-switch-to-previous-buffer)
;; 是否循环切换buffer
(setq nswbuff-display-intermediate-buffers t)
;; 是否过滤一些内容
(setq nswbuff-exclude-buffer-regexps '("^ .*" "^\\*.*\\*" "Treemacs Update*"))
;; (setq nswbuff-include-buffer-regexps '("\*scratch\*" "\*Python\*" ))
;; (setq nswbuff-exclude-buffer-regexps '("^\*.*\*$" ))
;; test



;; (defun my-org-edit-buffer()
;;   (interactive)
;;   (cond ((org-in-src-block-p) (progn(org-edit-src-code)(evil-window-move-far-right))  )
;; 	((org-src-edit-buffer-p) (progn (my-save-buffer)(org-edit-src-exit)))
;; 	;; (t )
;;     )
;;   )

;; ;; ======= key-chord=======
;; (require 'key-chord)
;; (key-chord-define evil-visual-state-map ",," 'org-edit-special)
;; (key-chord-define evil-insert-state-map ",," 'org-edit-special)
;; (key-chord-define evil-replace-state-map ",," 'org-edit-special)
;; (key-chord-define ivy-mode-map ",," 'org-edit-special)
;; ;; (key-chord-define elpy-mode-map "KK" 'beginning-of-defun)
;; (key-chord-define elpy-mode-map "JJ" 'end-of-defun)
;; (key-chord-define evil-insert-state-map ".." 'myinsert)
(setq key-chord-one-key-delay 0.4)     
(key-chord-mode +1)


;; (defun myinsert()
;;   (interactive)
;;   ;; (evil-normal-state)
;;   (progn
;;     (evil-normal-state)
;;     (evil-append 1)
;;     (insert "()")
;;     (evil-normal-state)
;;     (evil-insert 1)
;;   )
;;   )




;; ------ lisp-mode key config -------
;; (evil-define-key 'normal  'lisp-interaction-mode-map (kbd "C-<return>") 'my-major-mode-c-return-fun)

;; (defun my-major-mode-c-return-fun()(interactive)
;;        "如果major mode 是org-mode但是minor-mode是lisp-interaction-mode那么c-ret就是org-babel-execute-src-block"
;;        "如果major mode 是lisp-interaction-mode那么c-ret就是eval-defun"
;;        (cond ((equal major-mode 'lisp-interaction-mode)(eval-defun)) 
;; 	     ;; ((equal major-mode 'org-mode) (org-babel-execute-src-block-maybe)) 
;; 	     ((equal major-mode 'org-mode) (org-babel-execute-src-block)) 
;;        ))




;; ======================== ivy-mode ======================
(global-set-key (kbd "<f9>") 'ivy-mode)
(global-set-key (kbd "<f8>") 'turn-on-evil-mode)







;; ======= provide =======
(provide 'init-keybindings)
