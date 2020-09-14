
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
(set-font "Sarasa Mono HC Light" "Sarasa Mono HC Light"  22 22)


;; 和beacon-mode在一起效果不好
;; =============== hl-line-mode ========================
(global-hl-line-mode t)
(set-face-attribute 'region nil :weight 'normal :box "#FFFFFF" :underline nil)














;; ======= provide =======
(provide 'init-ui)
