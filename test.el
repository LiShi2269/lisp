
;; (global-set-key  (kbd "<f7>") nil)
(global-set-key  (kbd "<f7>") 'test2)

(defun test()
  (interactive)
  ;; (if (org-in-clocktable-p)(message "yes")(message "no")))
  (if (org-in-src-block-p)(message "yes")(message "no")))


(defun test2()
  (interactive)
  (if (org-in-src-block-p)
      (org-babel-execute-src-block)
    (org-insert-heading-respect-content)))

