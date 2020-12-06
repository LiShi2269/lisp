

(require 'perfect-margin)
(perfect-margin-mode 1)


(use-package rainbow-delimiters
;; :ensure t
  :config

(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'python-mode-hook #'rainbow-delimiters-mode)
(add-hook 'org-mode-hook #'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook #'rainbow-delimiters-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
  )



;; ====== power-line =============
;; (require 'powerline)
;; (powerline-default-theme)
;; (powerline-center-theme)
;; (powerline-center-evil-theme)
;; (powerline-vim-theme)
;; (powerline-nano-theme)


;; ====== powerline-evil =============
;; (require 'powerline-evil)
;; (powerline-evil-vim-color-theme)



(add-to-list 'load-path "~/.emacs.d/lisp/spaceline-master/")
(require 'spaceline-config)
(spaceline-spacemacs-theme)
;; 会跟随着evil状态改变颜色
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(set-face-attribute 'spaceline-evil-normal nil :foreground "#f3f3f3" :background "#2f4f4f")
(set-face-attribute 'spaceline-evil-insert nil :inherit 'mode-line :foreground "#f3f3f3" :background "cornflower blue")
(set-face-attribute 'powerline-active0 nil :inherit 'mode-line :foreground "#f3f3f3" :background "#2f4f4f" )
(set-face-attribute 'powerline-active1 nil :inherit 'mode-line :foreground "#f3f3f3" :background "#2f4f4f" )
(setq spaceline-workspace-numbers-unicode t)
(setq spaceline-window-numbers-unicode t)

;; modeline use all the icons but doesn't work
;; (propertize (all-the-icons-octicon "package")
            ;; 'face `(:family ,(all-the-icons-octicon-family) :height 1.2)
            ;; 'display '(raise -0.1))




;; =============== all-the-icons ========================
;; 安装方法：从github下载all-the-icons的zip，解压后直接安装字体
(use-package all-the-icons)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


;; =============== golden-ratio ========================
;; 用鼠标才可以，差评
;; (require 'golden-ratio)
;; (golden-ratio-mode 1)
;; (setq golden-ratio-auto-scale t)
;; =============== zoom ========================
(require 'zoom)
(custom-set-variables
 '(zoom-mode t)
 '(zoom-size '(0.618 . 0.618))
 ;; 忽略的模式
 '(zoom-ignored-major-modes '(dired-mode treemacs-mode ranger-mode neotree-mode evil-leader-mode))
 '(zoom-ignored-buffer-names '("*nswbuff*" ))
 '(temp-buffer-resize-mode t)
 ;; '(zoom-ignored-buffer-name-regexps '("^ .*nswbuff.*" "^\b.*Minibuf.*"))
 )


;; =============== line-spacing ========================
;; (setq line-spacing 0.2)
(setq-default line-spacing 0.2)



;; =============== just dashboard transparency ========================
(add-hook 'window-configuration-change-hook (lambda()(openwith-mode 0)
(cond
((equal 'dashboard-mode major-mode) (progn (set-frame-parameter (selected-frame) 'alpha 85) (evil-goto-first-line) (next-line 8) (evil-forward-WORD-begin)))
;; ((equal 'dashboard-mode major-mode) (set-frame-parameter (selected-frame) 'alpha 85))
((equal 'treemacs-mode major-mode) (set-frame-parameter (selected-frame) 'alpha 90))
((equal 'ranger-mode major-mode) (set-frame-parameter (selected-frame) 'alpha 90))
((equal 'neotree-mode major-mode) (set-frame-parameter (selected-frame) 'alpha 90))
((equal 'ivy-mode major-mode) (set-frame-parameter (selected-frame) 'alpha 90))
(t (set-frame-parameter (selected-frame) 'alpha 100) )
)))
;; ===============  dashboard color ========================
(custom-set-variables
 (set-face-attribute 'page-break-lines nil :foreground "dark slate grey"   )
 (set-face-attribute 'dashboard-footer nil :foreground "Deep Sky Blue1"   )
 )



;; =============== which-key-config ========================
;; (setq which-key-popup-type 'side-window)
;; (which-key-setup-side-window-bottom)
;; (setq which-key-side-window-location 'bottom)
;; (setq which-key-popup-type 'frame)
;; max width of which-key frame: number of columns (an integer)
;; (setq which-key-frame-max-width 60)

;; max height of which-key frame: number of lines (an integer)
;; (setq which-key-frame-max-height 20)





;; ;; ======= Font old function =======
;; (defun set-font (english chinese english-size chinese-size)
;;   (set-face-attribute 'default nil :font
;;                       (format   "%s:pixelsize=%d"  english english-size))
;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font) charset
;;                       (font-spec :family chinese :size chinese-size))))

;; ;; (set-font "Source Code Pro" "simsun"  22 22)
;; (set-font "Sarasa Mono HC Light" "Sarasa Mono HC Light"  22 22)
;; (set-font "等距更纱黑体 SC"  "等距更纱黑体 SC" 18 18)








;; =============== company tool ========================
;; (custom-set-variables
;;  (set-face-attribute 'company-scrollbar-bg nil :background "#2f4f4f")
;;  (set-face-attribute 'company-scrollbar-fg nil :background "#293b3b")
;;  (set-face-attribute 'company-tooltip nil :background "#2f4f4f" :foreground "ivory")
;;  (set-face-attribute 'company-tooltip-selection nil :background "dim gray" )
;;  (set-face-attribute 'company-tooltip-common nil :foreground "#c19696" )
;;  (set-face-attribute 'cursor nil :background "#82a7a7" )

;;  )


;; =============== company tool ========================
(custom-set-variables
 (set-face-attribute 'company-scrollbar-bg nil :background "#2f4f4f")
 (set-face-attribute 'company-scrollbar-fg nil :background "#293b3b")
 (set-face-attribute 'company-tooltip nil :background "#2f4f4f" :foreground "ivory")
 (set-face-attribute 'company-tooltip-selection nil :background "dim gray" )
 (set-face-attribute 'company-tooltip-common nil :foreground "#c19696" )
 ;; (set-face-attribute 'cursor nil :background "#c1a187" )
 (set-face-attribute 'cursor nil :background "#82a7a7" )
 

;; =============== which key face========================
 ;; (set-face-attribute 'which-key-posframe nil :background "#2f4f4f" )
 )





;; ======= theme manage=======
;; (load-theme 'deeper-blue 1)
;; (load-theme 'dracula 1)
;; (load-theme 'monokai 1)
;; (load-theme 'spolsky 1)
;; (load-theme 'atom-one-dark 1)


;; 和beacon-mode在一起效果不好
;; =============== hl-line-mode ========================
(global-hl-line-mode t)
;; 被选择的区域的样子
;; (set-face-attribute 'region nil :weight 'normal :box "#FFFFFF" :underline nil)
;; (set-face-attribute 'region nil :weight 'normal :box nil :underline "#FFFFFF")

(set-face-attribute 'hl-line nil :weight 'normal :box nil :underline nil :background "dark slate gray")
(set-face-attribute 'region nil  :background "royal blue")


;; =============== which-key-posframe ========================
(use-package which-key-posframe
  ;; :load-path "path/to/which-key-posframe.el"
  :init
  (which-key-posframe-mode 1)
;; position
(setq which-key-posframe-poshandler 'posframe-poshandler-frame-center)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-frame-top-center)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-frame-top-left-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-frame-top-right-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-left-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-right-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-window-center)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-window-top-left-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-window-top-right-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-window-bottom-left-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-window-bottom-right-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-point-top-left-corner)
;; (setq which-key-posframe-poshandler 'posframe-poshandler-point-bottom-left-corner)
  )


;; ===============  font  ========================
(defun set-font(f h fcolor bgcolor)
  "set font"
 (set-face-attribute 'default nil :family f :height h :foreground fcolor :background bgcolor)
 (set-fontset-font t 'han (font-spec :family f :height h :foreground fcolor :background bgcolor) )
  )

(set-font "等距更纱黑体 SC" 170 "#E9E7EF" "#161823")


;  ===============  other color  ========================

(custom-set-variables
 (set-face-attribute 'font-lock-comment-face nil :foreground "dark sea green"   )
 (set-face-attribute 'font-lock-builtin-face nil :foreground "#1bd1a5"   )
 (set-face-attribute 'font-lock-string-face nil :foreground "deep sky blue"   )
 (set-face-attribute 'highlight-indentation-face nil :background "dark cyan"   )
 )





;; ======= provide =======
(provide 'init-ui)
