
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

;; ======= python ein =======


 (defun my-normal-mode-key()
   (define-key key-translation-map (kbd ",") (kbd "<SPC> m"))
   ;; (define-key key-translation-map (kbd ".") (kbd "<SPC> j"))
   )
 (defun my-insert-mode-key()
   (define-key key-translation-map (kbd ",") (kbd ","))
   ;; (define-key key-translation-map (kbd ".") (kbd "."))
   )
 (add-hook 'evil-normal-state-entry-hook 'my-normal-mode-key)
 (add-hook 'evil-insert-state-entry-hook 'my-insert-mode-key)

;; ;; ======= import!!!!=======
;;(define-key 'evil-normal-state-map (kbd ",")
 ;;           (lookup-key evil-leader--default-map
  ;;                      (kbd "<SPC> m")))




;; ;; ======= key-chord=======
(require 'key-chord)
;; (key-chord-define evil-normal-state-map ",," 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ",," 'evil-force-normal-state)
(key-chord-define evil-insert-state-map ",," 'evil-normal-state)
(key-chord-define evil-replace-state-map ",," 'evil-normal-state)
(key-chord-mode +1)


(defun myinsert()
  (interactive)
  (insert "()")
  (evil-backward-char)
  (evil-insert 1)
  )

(key-chord-define evil-normal-state-map ".." 'myinsert)
(key-chord-define evil-insert-state-map ".." 'myinsert)
;; ======= provide =======
(provide 'init-keybindings)
