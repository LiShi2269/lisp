
(require 'pdf-tools)


(add-hook 'pdf-view-mode-hook (lambda()
				(my-pdf-tool-key-set)))
(evil-make-overriding-map pdf-view-mode-map 'normal)

;; (cond (eq evil-state 'normal)(message "normal"))





;;------- 自动加载 -------
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))


;; ======= provide =======
(provide 'init-pdftools)


