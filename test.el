
;; (global-set-key  (kbd "<f7>") nil)
(global-set-key  (kbd "<f7>") 'test)

(defun test()
  (interactive)
  (if (org-in-clocktable-p)(message "yes")(message "no")))



