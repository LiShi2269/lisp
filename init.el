;; (package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-general)

;; (require 'init-evil)
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
(require 'init-winum)
(require 'init-yasnippet)
(require 'neotree_icons)
(require 'init-treemacs)
(require 'org-protocol)
(require 'init-org)
(require 'init-ui)
;; (require 'init-latex)
(require 'init-keybindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9013233028d9798f901e5e8efb31841c24c12444d3b6e92580080505d56fd392" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "c517e98fa036a0c21af481aadd2bdd6f44495be3d4ac2ce9d69201fcb2578533" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" default))
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
 '(org-headline-todo ((t :weight normal :foreground "HotPink")))
 '(org-level-1 ((t :height 1.1 :weight bold :foreground "light sky blue")))
 '(org-level-2 ((t :height 1.1 :weight normal :foreground "pale turquoise")))
 '(org-level-3 ((t :height 1.1 :weight thin :foreground "salmon")))
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

(setq org-roam-v2-ack t)

