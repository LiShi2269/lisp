;; (package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'init-better-defaults)
;; (require 'init-evil)
(require 'init-org)
(require 'init-general)
(require 'init-ein)
(require 'init-ibuffer)
(require 'init-magit)
(require 'init-ido)
(require 'init-iedit)
(require 'init-ivy)
(require 'init-projectile)
;; (require 'init-python)
(require 'init-python-lsp)
(require 'init-ranger)
(require 'init-shell)
(require 'init-smex)
(require 'init-keybindings)
(require 'init-winum)
(require 'init-yasnippet)
(require 'neotree_icons)
(require 'treemacs)
(require 'init-ui)

(set-font "等距更纱黑体 SC"  "等距更纱黑体 SC" 18 18)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(shell-pop-autocd-to-working-dir t)
;;  '(shell-pop-cleanup-buffer-at-process-exit t)
;;  '(shell-pop-default-directory "/Users/kyagi/git")
;;  '(shell-pop-full-span t)
;;  '(shell-pop-restore-window-configuration t)
;;  '(shell-pop-shell-type
;;    '("ansi-term" "*ansi-term*"
;;      (lambda nil
;;        (ansi-term shell-pop-term-shell))))
;;  '(shell-pop-term-shell "/bin/bash")
;;  '(shell-pop-universal-key "C-t")
;;  '(shell-pop-window-position "bottom")
;;  '(shell-pop-window-size 30)
;;  '(temp-buffer-resize-mode t)
;;  '(zoom-ignored-buffer-names '("*scratch*" " *nswbuff*"))
;;  '(zoom-ignored-major-modes '(dired-mode treemacs-mode ranger-mode python-mode))
;;  '(zoom-mode t nil (zoom))
;;  '(zoom-size '(0.618 . 0.618)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:background nil))))
;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "cyanic"))))
;;  '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
;;  '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
;;  '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
;;  '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
;;  '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
;;  '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
