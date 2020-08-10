
(require 'cl-lib)
;; ======= dashboard =======
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "~/.emacs.d/logo/logo4.png")
(setq dashboard-banner-logo-title "！！每天都要努力写论文！！")
;; (setq dashboard-startup-banner "e:/logo.png")

(setq make-backup-files nil)

;; (visual-line-mode 1)

;;which-key
(which-key-mode 1)

;;shut-down-alarm
(setq visible-bell 0)

(global-hl-line-mode 1)

;; ------ star with full screen -------
(add-hook 'emacs-startup-hook 'toggle-frame-fullscreen)

;; ------ smartparens -------
(smartparens-global-mode)		;enable

(show-smartparens-global-mode)

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


;; 显示行号
;; (global-linum-mode 1)

(global-evil-surround-mode 1)
;; (require 'use-package)

;; ======= ranger =======
(setq ranger-show-hidden t)
(setq ranger-show-literal t)
(setq ranger-parent-depth 2)
(setq ranger-width-parents 0.12)
(setq ranger-max-parent-width 0.12)
(setq ranger-max-preview-size 10)
(setq ranger-dont-show-binary t)
;; ------- delay -------
(setq ranger-footer-delay 0.2)
(setq ranger-preview-delay 0.040)


;; (setq default-buffer-file-coding-system 'utf-8)
;; Default coding system (for new files) 默认buffer编码是utf-8,(写文件)

;; (prefer-coding-system 'utf-8)
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
;; ====== snails =============



;; ======= provide =======
(provide 'init-better-defaults)
