
 	
(add-to-list 'auto-mode-alist '("\\.aux\\'" . tex-mode))

(setq bibtex-dialect 'biblatex)
(use-package tex
  :ensure auctex)


(setq TeX-auto-save t)
(setq TeX-parse-self t)

(add-to-list 'auto-mode-alist '("\\.aux\\'" . tex-mode))
;; ======= provide =======
(provide 'init-latex)
