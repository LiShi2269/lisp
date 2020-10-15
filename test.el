




(defun test()(interactive)
       ;; (buffer-list)
       ;; (message buffer-list)
       (message (buffer-name))
       )
(global-set-key (kbd "<f8>") 'test)
