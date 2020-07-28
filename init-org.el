;; init file for org-mode

;;---------bullets------------
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; ======= provide =======
(provide 'init-org)
