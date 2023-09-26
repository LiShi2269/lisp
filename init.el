;; (package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'init-better-defaults)
;; (require 'init-evil)
(require 'init-general)
(require 'init-ein)
(require 'init-ibuffer)
(require 'init-magit)
(require 'init-ido)
(require 'init-iedit)
(require 'init-ivy)
(require 'init-projectile)
;; (require 'init-python)     ;现在不用了
(require 'init-python-lsp)
(require 'init-ranger)
(require 'init-shell)
(require 'init-smex)
(require 'init-keybindings)
(require 'init-winum)
(require 'init-yasnippet)
(require 'neotree_icons)
(require 'treemacs)
(require 'org-protocol)
(require 'init-org)
(require 'init-ui)
;; (require 'init-latex)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ein:output-area-inlined-images t)
 '(elpy-rpc-virtualenv-path 'current)
 '(nil nil t)
 '(org-agenda-files
   '("f:/org-roam/20220318211156-graduate_log.org" "f:/org-roam/20210625205735-contribution2.org" "f:/task/task.org" "f:/org-roam/20210712203527-外交与引力模型.org" "f:/org-roam/20210702162518-混合回归.org"))
 '(package-selected-packages
   '(gnu-elpa-keyring-update org-sql org-roam magit projectile company ivy neotree proxy-mode shell-pop general nswbuff focus smartparens popwin iedit linum-relative popup-kill-ring zoom powerline powerline-evil ace-jump-mode minimap beacon rainbow-delimiters treemacs treemacs-evil treemacs-projectile treemacs-magit treemacs-icons-dired treemacs-all-the-icons posframe which-key-posframe evil-surround ivy-posframe mini-frame yasnippet-snippets dynamic-spaces py-autopep8 youdao-dictionary yasnippet dashboard sublime-themes yasnippet-snippets highlight-symbol all-the-icons all-the-icons-dired perfect-margin hydra ibuffer smex pandoc openwith ein use-package which-key ido ido-vertical-mode flx flx-ido ranger key-chord ein elpy company-jedi anaconda-mode python-mode flycheck blacken lsp-jedi py-autopep8 lsp-mode lsp-ui lsp-treemacs lsp-ivy evil evil-leader winum))
 '(shell-pop-autocd-to-working-dir t)
 '(shell-pop-cleanup-buffer-at-process-exit t)
 '(shell-pop-default-directory "/Users/kyagi/git")
 '(shell-pop-full-span t)
 '(shell-pop-restore-window-configuration t)
 '(shell-pop-shell-type
   '("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30)
 '(temp-buffer-resize-mode t)
 '(treemacs-python-executable "c:\\HOME\\.pyenv\\pyenv-win\\shims\\python")
 '(zoom-ignored-major-modes
   '(dired-mode treemacs-mode ranger-mode neotree-mode evil-leader-mode))
 '(zoom-mode t nil (zoom))
 '(zoom-size '(0.618 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(header-line ((default :background "#161a1f")))
 '(org-level-1 ((t :height 1.3 :weight normal :foreground "light sky blue")))
 '(org-level-2 ((t :height 1.2 :weight normal :foreground "pale turquoise")))
 '(org-level-3 ((t :height 1.1 :weight bold :foreground "salmon")))
 '(org-level-4 ((t :height 1.1 :foreground "DarkTurquoise")))
 '(org-level-5 ((t :height 1.1 :foreground "medium aquamarine")))
 '(org-level-6 ((t :height 1.1 :foreground "indian red")))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

(setq treemacs-python-executable "c:/HOME/.pyenv/pyenv-win/versions/3.9.2/python.exe")
(setq org-roam-v2-ack t)
;;just mark
