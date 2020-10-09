
;; ======= theme manage=======

;; (load-theme 'deeper-blue 1)
;; (load-theme 'dracula 1)
(load-theme 'monokai 1)

;; ======= Font =======

(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

;; (set-font "Source Code Pro" "simsun"  22 22)
;; (set-font "Sarasa Mono HC Light" "Sarasa Mono HC Light"  22 22)
(set-font "等距更纱黑体 SC"  "等距更纱黑体 SC" 24 24)


;; 和beacon-mode在一起效果不好
;; =============== hl-line-mode ========================
(global-hl-line-mode t)
;; 被选择的区域的样子
;; (set-face-attribute 'region nil :weight 'normal :box "#FFFFFF" :underline nil)
(set-face-attribute 'region nil :weight 'normal :box nil :underline "#FFFFFF")


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
 '(zoom-mode t))
(custom-set-variables
 '(zoom-size '(0.618 . 0.618)))



;; ======= provide =======
(provide 'init-ui)
