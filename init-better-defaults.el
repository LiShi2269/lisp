;; (require 'cl-lib)
;; ======= dashboard =======
(server-start)
(use-package dashboard
  ;; :config ((dashboard-setup-startup-hook t)
  :ensure
  :init
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "~/.emacs.d/lisp/dashboardLogo/myDashboardLogo.png")
    (setq dashboard-banner-logo-title "！！每天都要努力写论文！！")
	;; ( dashboard-startup-banner "e:/logo.png")
    (setq make-backup-files nil)
    ;; dashboard 在中间
    (setq dashboard-center-content t)
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
 (setq dashboard-items '((recents  . 10)
                        (bookmarks . 5)
                        ;; (projects . 5)
                        ;; (agenda . 5)
                        ;; (registers . 5)
			))
 ;; 在dashboard使用openwith外部打开
 :bind(:map dashboard-mode-map
	    ("C-<return>" . (lambda()(interactive)(progn(openwith-mode 1)(evil-ret)))))
  )
 
;; (visual-line-mode 1)

(use-package which-key
  :init
  (which-key-mode 1)
  )

;;shut-down-alarm
(setq visible-bell 0)


;; 显示行号
;; (global-linum-mode 1)
;; 比linum-mode 好用，快速
;; (global-display-line-numbers-mode nil)

;; ------ star with full screen -------
(add-hook 'emacs-startup-hook 'toggle-frame-fullscreen)

;; ------ smartparens -------
(use-package smartparens
    :init
    (smartparens-global-mode)		;enable
    (show-smartparens-global-mode)
    :config
    ;; (add-hook 'emacs-lisp-mode-hook  (sp-pair "'" nil :actions :rem))
    ;; (add-hook 'lisp-interaction-mode-hook  (sp-pair "'" nil :actions :rem))
    ;; (sp-local-pair 'lisp-interaction-mode "'" nil :actions :rem)
    (sp-local-pair 'emacs-lisp-mode "'" nil :unless nil)
    (sp-local-pair 'lisp-interaction-mode "'" nil :unless nil)
  )


;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)
;; 之前做python的修改，现在不知道有没有用
;; (global-eldoc-mode -1)

;; ;; 使用emacs内建的eww浏览器来进行url的执行
;; (setq browse-url-browser-function 'eww-browse-url)

;; (setq url-gateway-method 'socks)
;; (setq socks-server '("Default server" "127.0.0.1" 443 5))



;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; 关闭工具栏
(tool-bar-mode 0)
;; 关闭菜单栏
(menu-bar-mode 0)


(use-package evil-surround
  :init
  (global-evil-surround-mode 1)
  )
;; (global-evil-surround-mode 1)




;; (setq default-buffer-file-coding-system 'utf-8)
;; Default coding system (for new files) 默认buffer编码是utf-8,(写文件)

(prefer-coding-system 'utf-8)
;; 指定文件编码,此时buffer新建和读取都默认是utf-8,也可以M-x prefer-coding-system 只执行一次
;; (set-language-environment "Chinese-GB18030")
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; ======= iswitch =======
;; (iswitchb-mode 1)
;; (setq iswitchb-buffer-ignore '("^ " "*Buffer" "*Help*"))



;; package must download manully
(use-package centered-window
  :init
  :commands centered-window-mode
  )
;; (require 'centered-window)

;; ====== mini-frame =============
;; (require 'mini-frame)
;; (mini-frame-mode t)
;; (custom-set-variables
 ;; '(mini-frame-show-parameters
   ;; '((top . 20)
     ;; (width . 0.7)
     ;; (left . 0.5))))
;; ====== focus =============
;; 不好用 除了focus的字体外，其他字体会改变颜色，不利于编程


;; ====== beacon =============
;; 能够在光标移动后产生光晕的效果
;; (require 'beacon)
;; (beacon-mode 1)
;; (setq beacon-color "#FF69B4")
;; (setq beacon-size 30)
;; (setq beacon-blink-duration 1.5)
;; (setq beacon-blink-delay 0)
;; ;; (setq beacon-blink-when-point-moves-horizontally -5)
;; ;; (setq beacon-blink-when-point-moves-vertically 5)
;; (setq beacon-push-mark 1)
;; (add-to-list 'beacon-dont-blink-major-modes 'dashboard-mode)
;; (add-to-list 'beacon-dont-blink-major-modes 'bookmark-bmenu-mode)
;; (add-to-list 'beacon-dont-blink-major-modes 'Buffer-menu-mode)
;; (add-to-list 'beacon-dont-blink-major-modes 'dired-mode)

;; (use-package beacon
;;   :ensure
;;   :init
;;   (beacon-mode 1)
;;     (setq beacon-color "#FF69B4")
;;     (setq beacon-size 30)
;;     (setq beacon-blink-duration 1.5)
;;     (setq beacon-blink-delay 0)
;;     (setq beacon-blink-when-point-moves-horizontally 0)
;;     ;; (setq beacon-blink-when-point-moves-vertically 5)
;;     (setq beacon-push-mark 1)
;;     (add-to-list 'beacon-dont-blink-major-modes 'dashboard-mode)
;;     (add-to-list 'beacon-dont-blink-major-modes 'bookmark-bmenu-mode)
;;     (add-to-list 'beacon-dont-blink-major-modes 'Buffer-menu-mode)
;;     (add-to-list 'beacon-dont-blink-major-modes 'dired-mode)
;;   )

;; ====== popup-kill-ring =============
;; (require 'popup-kill-ring)
;; (global-set-key (kbd "M-p") 'popup-kill-ring)
;; (global-set-key (kbd "<f9>") 'popup-kill-ring-hide)
;; (define-key popup-kill-ring-keymap (kbd "C-j") 'popup-kill-ring-next)
;; (define-key popup-kill-ring-keymap (kbd "C-k") 'popup-kill-ring-previous)

 

;;====== minimap =============
;; (require 'minimap)
(setq diary-file "f:/task/diary")

;; ====== neotree =============
(use-package neotree
  :ensure t
  :bind(:map neotree-mode-map
	     ("C-<return>" . (lambda()(interactive)(progn (openwith-mode 1)(neotree-enter)))))
  )
;; ====== undo-tree =============
(require 'undo-tree)
(global-undo-tree-mode t)
(use-package undo-tree
  :init
  (global-undo-tree-mode 1)
  )

;; ====== sace-place =============
(add-to-list 'load-path "~/.emacs.d/lisp/save-place.el")
(require 'saveplace)
(save-place-mode 1)


;; ====== openwith =============
(use-package openwith
  :ensure t
  :init
  (openwith-mode 0)

 '(openwith-associations
   '(("\\.pdf\\'" "PDF-XChange Editer"
      (file))
     ;; ("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer"
      ;; ("-idx" file))
     ;; ("\\.\\(?:jp?g\\|png\\)\\'" "display"
      ;; (file))
     ))
  )




;; ====== for folding mode in lisp =============
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)


;; ====== company 补全 org-roam =============
;;(add-to-list 'company-backends '(company-capf))

;; ====== pdf configuration =============
;; (use-package org-pdftools
;;   :hook (org-mode . org-pdftools-setup-link))

;; (use-package org-noter-pdftools
;;   :after org-noter
;;   :config
;;   (with-eval-after-load 'pdf-annot
;;     (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))


(winner-mode +1)
(define-key winner-mode-map (kbd "<C-left>") #'winner-undo)
(define-key winner-mode-map (kbd "<C-right>") #'winner-redo)

;; ======= provide =======
(provide 'init-better-defaults)
