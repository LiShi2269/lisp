




(require 'neotree)
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq neo-window-width 40)
(setq neo-window-fixed-size 20)




(defhydra hydra-neotree()
 "
hydra-neotree
TAB:Enter       SPC:quick-Look     q:hide            RET:Enter
r: refresh      j:next-Line        k:pre-Line        A:stretch-Toggle
H:hidden-File   R:rename           C:create-Node     D:delete-Node
c:copy-Node     h:up-Node          U:change-Root 

"

)





(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-rename-node)
(evil-define-key 'normal neotree-mode-map (kbd "C") 'neotree-create-node)
(evil-define-key 'normal neotree-mode-map (kbd "D") 'neotree-delete-node)
(evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-copy-node)
(evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-select-up-node)
(evil-define-key 'normal neotree-mode-map (kbd "U") 'neotree-change-root)
(evil-define-key 'normal neotree-mode-map (kbd "?") 'hydra-neotree/body)


;; ======= provide =======
(provide 'neotree_icons)
