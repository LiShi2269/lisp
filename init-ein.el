

(require 'ein)
(require 'ein-notebook)
;; (require 'ein-subpackages)
;; (setq ein:worksheet-warn-obsolesced-keybinding nil)


(defun myeinkey()
(interactive)
(define-key ein:notebook-mode-map (kbd "C-<return>") 'ein:worksheet-execute-cell-and-goto-next)
  )

(defun myeinkey()
    (interactive)
    (define-key ein:notebook-mode-map (kbd "C-<return>") 'ein:worksheet-execute-cell-and-goto-next)
    (which-key-declare-prefixes-for-mode 'python-mode "SPC m " "major-mode")

    (evil-leader/set-key-for-mode 'python-mode
    "mfs" 'ein:notebook-save-notebook-command-km 
    "mj" 'ein:worksheet-goto-next-input-km
    "mk" 'ein:worksheet-goto-prev-input-km
    "mK" 'ein:worksheet-move-cell-up-km
    "mJ" 'ein:worksheet-move-cell-down-km
    "mR" 'ein:worksheet-rename-sheet-km
    "mO" 'ein:worksheet-insert-cell-above-km
    "mo" 'ein:worksheet-insert-cell-below-km
    "mc" 'ein:worksheet-execute-cell-km
    "mC" 'ein:worksheet-execute-all-cells
    "mt" 'ein:worksheet-toggle-output-km
    "mdd" 'ein:worksheet-kill-cell-km
    "ml" 'ein:worksheet-clear-output-km
    "mL" 'ein:worksheet-clear-all-output-km
    "mqq" 'ein:notebook-kill-kernel-then-close-command-km
    "m/" 'ein:worksheet-split-cell-at-point-km
    "mu" 'ein:worksheet-toggle-cell-type-km
    "mU" 'ein:worksheet-change-cell-type-km
    "mc" 'ein:worksheet-copy-cell-km
    "mp" 'ein:worksheet-yank-cell-km
    )

    (define-key ein:notebook-mode-map (kbd "C-<return>") 'ein:worksheet-execute-cell-and-goto-next)
    (define-key ein:notebook-mode-map (kbd "C-S-<return>") 'ein:worksheet-execute-cell-and-insert-below-km)
    (define-key ein:notebook-mode-map (kbd "C-j") 'ein:worksheet-goto-next-input-km)
    (define-key ein:notebook-mode-map (kbd "C-k") 'ein:worksheet-goto-prev-input-km)
    ;; (define-key ein:notebook-mode-map (kbd "M-J") 'ein:worksheet-not-move-cell-down-km)

)


;; (add-hook 'ein:notebooklist-mode-hook 'myeinkey)
(add-hook 'ein:notebook-mode-hook 'myeinkey)


;; ===============poly-mode?????=====================
;; (setq ein:poly-mode t)




(setq ein:use-auto-complete t)
;; Or, to enable "superpack" (a little bit hacky improvements):
(setq ein:use-auto-complete-superpack t)

(setq ein:use-smartrep t)






(evil-leader/set-key
    ;; ---- ipython notebook ----
    "ain" 'ein:notebooklist-open
)





;; ======= provide =======
(provide 'init-ein)


