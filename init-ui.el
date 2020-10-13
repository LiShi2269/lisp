
;; ======= theme manage=======

;; (load-theme 'deeper-blue 1)
;; (load-theme 'dracula 1)
;; (load-theme 'monokai 1)
(load-theme 'spolsky 1)
;; (load-theme 'atom-one-dark 1)







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

;; (set-face-attribute 'spaceline-evil-normal nil :foreground "#2f4f4f")
;; (set-face-attribute 'spaceline-evil-insert nil :foreground "#7D8BAC")
(set-face-attribute 'spaceline-evil-normal nil :foreground "#ffffff" :background "#2f4f4f")
;; (set-face-attribute 'spaceline-evil-insert nil :foreground "#3E3D31" :background "7D8BAC" :inherit 'mode-line)
(set-face-attribute 'spaceline-evil-insert nil :inherit 'mode-line :foreground "#3E3D31" :background "#7D8BAC" )
(setq spaceline-workspace-numbers-unicode t)
(setq spaceline-window-numbers-unicode t)
;; spaceline-workspace-numbers-unicode and spaceline-window-numbers-unicode to t







;; 和beacon-mode在一起效果不好
;; =============== hl-line-mode ========================
(global-hl-line-mode t)
;; 被选择的区域的样子
;; (set-face-attribute 'region nil :weight 'normal :box "#FFFFFF" :underline nil)
;; (set-face-attribute 'region nil :weight 'normal :box nil :underline "#FFFFFF")
(set-face-attribute 'hl-line nil :weight 'normal :box nil :underline nil :background "dark slate gray")


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
 '(zoom-ignored-major-modes '(dired-mode treemacs-mode ranger-mode python-mode))
 '(zoom-ignored-buffer-names '("*scratch*"    " *nswbuff*"))
 '(temp-buffer-resize-mode t)
 ;; '(zoom-ignored-buffer-name-regexps '("^\b"))
 )


;; =============== line-spacing ========================
;; (setq line-spacing 0.2)
(setq-default line-spacing 0.1)





;; (defun test()(interactive)
;;        (buffer-list)
;;        ;; (message buffer-list)
;;        )
;; (global-set-key (kbd "<f8>") 'buffer-list)
;; (buffer-list)









;; just dashboard transparency
(add-hook 'buffer-list-update-hook (lambda()
					  (if (equal (buffer-name) "*dashboard*")
					      (set-frame-parameter (selected-frame) 'alpha 90)
					    (set-frame-parameter (selected-frame) 'alpha 100)
					      ;; (message "dashboard")
					      ;; (message "other")
					    )))









;; ======= Font =======
(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

;; (set-font "Source Code Pro" "simsun"  22 22)
;; (set-font "Sarasa Mono HC Light" "Sarasa Mono HC Light"  22 22)
(set-font "等距更纱黑体 SC"  "等距更纱黑体 SC" 18 18)





;; ;; ======= provide =======
(provide 'init-ui)
