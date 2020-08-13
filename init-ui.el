
;; ======= Font =======

(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

;; (set-font "Source Code Pro" "simsun"  22 22)
(set-font "Sarasa Mono HC Light" "Sarasa Mono HC Light"  22 22)


;; ======= Theme manage=======

(load-theme 'dracula 1)
;; (load-theme 'monokai 1)




;; ======= provide =======
(provide 'init-ui)
