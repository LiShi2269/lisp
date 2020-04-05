

(require 'hydra)
(require 'ein)
(require 'ein-notebook)
;; (require 'ein-subpackages)
;; (setq ein:worksheet-warn-obsolesced-keybinding nil)



(defun myeinkey()
    (interactive)

    (evil-leader/set-key
	"m." 'hydra-ein/body
	"mo" 'ein:notebook-open-km
    )

	(which-key-declare-prefixes-for-mode 'python-mode "SPC m " "major-mode")
	(define-key ein:notebook-mode-map (kbd "C-<return>") 'ein:worksheet-execute-cell-and-goto-next)
	(define-key ein:notebook-mode-map (kbd "C-S-<return>") 'ein:worksheet-execute-cell-and-insert-below-km)
	(define-key ein:notebook-mode-map (kbd "C-j") 'ein:worksheet-goto-next-input-km)
	(define-key ein:notebook-mode-map (kbd "C-k") 'ein:worksheet-goto-prev-input-km)

)


(add-hook 'ein:notebook-mode-hook 'myeinkey)


(evil-leader/set-key
    ;; ---- ipython notebook ----
    "ain" 'ein:notebooklist-open
)

;; -------------test---------------
(defhydra hydra-ein() "ein-hydra"

    ("j" ein:worksheet-goto-next-input-km "next")
    ("k" ein:worksheet-goto-prev-input-km "pre")
    ("J" ein:worksheet-move-cell-down-km "MoveDown")
    ("K" ein:worksheet-move-cell-up-km "MoveUp")
    ("C-s" ein:notebook-save-notebook-command-km "Save")
    ("R" ein:notebook-rename-command-km "Rename")
    ("O" ein:worksheet-insert-cell-above-km "InsAbo")
    ("o" ein:worksheet-insert-cell-below-km "InsBel")
    ("<return>" ein:worksheet-execute-cell-km "Execut")
    ("m" ein:worksheet-merge-cell-km "Merge")
    ("c" ein:worksheet-copy-cell-km "Copy")
    ("C" ein:worksheet-execute-all-cells "ExAll")
    ("p" ein:worksheet-yank-cell-km "Paste")
    ("t" ein:worksheet-toggle-output-km "TogOutput")
    ("dd" ein:worksheet-kill-cell-km "DelCell" )
    ("l" ein:worksheet-clear-output-km "clean" )
    ("L" ein:worksheet-clear-all-output-km "cleanAll" )
    ("qq" ein:notebook-kill-kernel-then-close-command-km "Quit")
    ("/" ein:worksheet-split-cell-at-point-km "Split")
    ("u" ein:worksheet-toggle-cell-type-km "Type")
    ("U" ein:worksheet-change-cell-type-km "Type")
)




(setq ein:use-auto-complete t)
;; Or, to enable "superpack" (a little bit hacky improvements):
(setq ein:use-auto-complete-superpack t)

(setq ein:use-smartrep t)










;; ======= provide =======
(provide 'init-ein)


