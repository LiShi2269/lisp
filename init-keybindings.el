
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


;; ======= ivy =======
(define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)



;; ;; ======= key-chord=======
(require 'key-chord)
;; (key-chord-define evil-normal-state-map ",," 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ",," 'evil-force-normal-state)
(key-chord-define evil-insert-state-map ",," 'evil-normal-state)
(key-chord-define evil-replace-state-map ",," 'evil-normal-state)
(key-chord-define ivy-mode-map ",," 'keyboard-escape-quit)
(key-chord-mode +1)


(defun myinsert()
  (interactive)
  ;; (evil-normal-state)
  (evil-append 1)
  (insert "()")
  (evil-insert 1)
  (evil-backward-char)
  (evil-forward-char)
  )
(key-chord-define evil-normal-state-map ".." 'myinsert)
(key-chord-define evil-insert-state-map ".." 'myinsert)



;; ======= provide =======
(provide 'init-keybindings)
