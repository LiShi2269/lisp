;; (require 'cl-lib)
;; ======= dashboard =======
;; (require 'dashboard)
;; (dashboard-setup-startup-hook)
;; (setq dashboard-startup-banner "~/.emacs.d/logo/logo4.png")
;; (setq dashboard-banner-logo-title "！！每天都要努力写论文！！")
;; ;; (setq dashboard-startup-banner "e:/logo.png")
;; (setq make-backup-files nil)
(use-package dashboard
  ;; :config ((dashboard-setup-startup-hook t)
  :ensure
  :init
    (dashboard-setup-startup-hook)
    ;; (setq dashboard-startup-banner "~/.emacs.d/logo/logo4.png")
    (setq dashboard-banner-logo-title "！！每天都要努力写论文！！")
	;; ( dashboard-startup-banner "e:/logo.png")
    (setq make-backup-files nil)

  )

 
;; (visual-line-mode 1)

(use-package which-key
  :init
  (which-key-mode 1)
  )
;;which-key
;; (which-key-mode 1)

;;shut-down-alarm
(setq visible-bell 0)


;; 显示行号
;; (global-linum-mode 1)
;; 比linum-mode 好用，快速
;; (global-display-line-numbers-mode nil)

;; ------ star with full screen -------
(add-hook 'emacs-startup-hook 'toggle-frame-fullscreen)

;; ------ smartparens -------
(smartparens-global-mode)		;enable
(show-smartparens-global-mode)
(add-hook 'emacs-lisp-mode  (sp-pair "'" nil :actions :rem))

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)
(global-eldoc-mode -1)

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



(global-evil-surround-mode 1)
;; (require 'use-package)





(setq default-buffer-file-coding-system 'utf-8)
;; Default coding system (for new files) 默认buffer编码是utf-8,(写文件)

(prefer-coding-system 'utf-8)
;; 指定文件编码,此时buffer新建和读取都默认是utf-8,也可以M-x prefer-coding-system 只执行一次

;; ======= iswitch =======
;; (iswitchb-mode 1)
;; (setq iswitchb-buffer-ignore '("^ " "*Buffer" "*Help*"))



;; package must download manully
(require 'centered-window)

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

 

;; ====== rainbow =============
;; (require 'rainbow-delimiters)
;; (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
;; (add-hook 'python-mode-hook #'rainbow-delimiters-mode)
;; (add-hook 'org-mode-hook #'rainbow-delimiters-mode)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "#FF69B4"))))
;;  '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
;;  '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
;;  '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
;;  '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
;;  '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
;;  '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

(use-package rainbow-delimiters
;; :ensure t
  :config

(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'python-mode-hook #'rainbow-delimiters-mode)
(add-hook 'org-mode-hook #'rainbow-delimiters-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FF69B4"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
  )


;;====== minimap =============
;; (require 'minimap)


;; ====== undo-tree =============
(require 'undo-tree)
(global-undo-tree-mode t)


;; ====== neotree =============



;; ======= provide =======
(provide 'init-better-defaults)
