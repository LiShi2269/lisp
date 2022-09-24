
;; (global-set-key  (kbd "<f7>") nil)
(global-set-key  (kbd "<f7>") 'test4)


(defun test4()
  (interactive)
  (cond ( (org-in-src-block-p) (message "src"))
	( (org-at-table-p)(message "table"))
	( (org-in-archived-heading-p)(message "archived"))
	( (org-in-commented-heading-p)(message "heading"))
	( (org-in-subtree-not-table-p)(message "subtree"))
	(t (message "othedr"))
	))

(defun test()
  (interactive)
  ;; (if (org-in-clocktable-p)(message "yes")(message "no")))
  (if (org-in-src-block-p)(message "yes")(message "no")))


(defun test2()
  (interactive)
  (if (org-in-src-block-p)
      (org-babel-execute-src-block)
    (org-insert-heading-respect-content)))

(defun test3()
  (interactive)
  (cond ( (org-in-src-block-p) (message "src"))
	( (org-at-table-p)(message "table"))
	(t (message "othedr"))
	))
;; (defun my-major-mode-fun()(interactive)
;;    " 如果major-mode是python
;; 	查看minor-mode当中有无ein
;; 	    如果有
;; 	    如果没有
;;     如果major-mode是org的话"
;;        (cond ((equal major-mode 'python-mode)
;; 		    (if (bound-and-true-p ein:notebook-mode)  (hydra-ein/body) (hydra-python/body))) 
;; 	     ((equal major-mode 'emacs-lisp-mode) (print " emacs-lisp-mode do not have mode key")) 
;;              ((equal major-mode 'org-mode) (hydra-org/body))
;; 	     )
;;        )
