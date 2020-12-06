

(require 'hydra)
(require 'ein)
(require 'ein-notebook)
;; (require 'ein-subpackages)
;; (setq ein:worksheet-warn-obsolesced-keybinding nil)
;; ==========hydra================
(defun ein:worksheet-merge-cell-down-km()
  (interactive)
  (ein:worksheet-goto-next-input-km)
  (ein:worksheet-merge-cell-km)
  )


(setq ein:use-auto-complete t)
(setq ein:use-smartrep t)

(defhydra hydra-ein()
 "


hydra-ein

_j_: next    _S_: Save   _t_: show      _u_: toggle
_k_: pre     _R_: Rename _E_: ExAll     _U_: Toggle
_J_: move    _m_: merge  _l_: Clean     _C_: Exe 
_K_: Move    _M_: Merge  _L_: CleanAll  _D_: Del
_o_: InsBl   _c_: Copy   _Q_: Quit      _O_: InsAbo
_O_: InsAbo  _p_: Paste  _/_: Split

"

    ("j" ein:worksheet-goto-next-input-km )
    ("k" ein:worksheet-goto-prev-input-km)
    ("J" ein:worksheet-move-cell-down-km)
    ("K" ein:worksheet-move-cell-up-km)
    ("S" ein:notebook-save-notebook-command-km)
    ("R" ein:notebook-rename-command-km)
    ("O" ein:worksheet-insert-cell-above-km )
    ("o" ein:worksheet-insert-cell-below-km )
    ("C" ein:worksheet-execute-cell-km)
    ("m" ein:worksheet-merge-cell-down-km)
    ("M" ein:worksheet-merge-cell-km)
    ("c" ein:worksheet-copy-cell-km )
    ("E" ein:worksheet-execute-all-cells )
    ("p" ein:worksheet-yank-cell-km )
    ("t" ein:worksheet-toggle-output-km )
    ("D" ein:worksheet-kill-cell-km  )
    ("l" ein:worksheet-clear-output-km )
    ("L" ein:worksheet-clear-all-output-km )
    ("Q" ein:notebook-kill-kernel-then-close-command-km)
    ("/" ein:worksheet-split-cell-at-point-km )
    ("u" ein:worksheet-toggle-cell-type-km )
    ("U" ein:worksheet-change-cell-type-km ))
;; ==========hydra================

(general-define-key
 :states '(normal motion)
 :keymaps 'override
 :prefix "SPC"
    "ain" 'ein:notebooklist-open
 )

;; -------------test---------------


(setq ein:use-auto-complete t)
;; Or, to enable "superpack" (a little bit hacky improvements):
(setq ein:use-auto-complete-superpack t)

(setq ein:use-smartrep t)


;; (add-hook 'ein:notebook-mode-hook (lambda()(eldoc-mode -1)))

;; (evil-define-minor-mode-key 'normal 'ein:notebook-mode (kbd ",") 'hydra-ein/body)
;; (evil-define-minor-mode-key 'normal 'ein:notebook-mode (kbd "<SPC> m") 'hydra-ein/body)
(define-key ein:notebook-mode-map (kbd "C-<return>") 'ein:worksheet-execute-cell-and-goto-next-km)
(define-key ein:notebook-mode-map (kbd "C-S-<return>") 'ein:worksheet-execute-cell-and-insert-below-km)
(define-key ein:notebook-mode-map (kbd "C-j") 'ein:worksheet-goto-next-input-km)
(define-key ein:notebook-mode-map (kbd "C-k") 'ein:worksheet-goto-prev-input-km)







;; ======= provide =======
(provide 'init-ein)


