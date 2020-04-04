;;default python mode state
(evil-set-initial-state 'python-mode 'normal) 
(evil-set-initial-state 'inferior-python-mode 'normal) 

(setq python-indent-offset 4)



;; ------ lsp-mode ------
(setq lsp-keymap-prefix "s-l")
;; ------- lsp feature -------
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 2048 2048)) ;; 1mb
(setq lsp-prefer-capf t)
(setq lsp-idle-delay 0.500)
;; ;; ------- lsp ui feature -------
(setq lsp-auto-configure t)
(setq lsp-signature-auto-activate t)
(setq lsp-ui-sideline-enable t)
;; ----- delay-----
(setq lsp-ui-sideline-delay 0.1)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-code-actions t)
(setq lsp-ui-sideline-update-mode t) 
(setq lsp-ui-doc-position 'bottom)
;; ----- delay-----
(setq lsp-ui-doc-delay 2)

(require 'lsp-mode)





(require 'python-mode)


;; -----test my-py-transient-map -----

;; (defvar my-py-transient-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map (kbd "b") 'elpy-shell-send-buffer-and-step)
;;     ;; (define-key map (kbd "n") 'my-forward-word)
;;     map))
;; (defun mytest()
;;   (interactive)
;;   (set-transient-map my-py-transient-map t)
;;   )


;; ----- mypythonkey-----
(defun mypythonkey()
    (evil-leader/set-key-for-mode 'python-mode
    ;; ------ pyenv ------
    "mVa" 'pyvenv-activate
    "mVd" 'pyvenv-deactivate
    "mVw" 'pyvenv-workon
    "msB" 'elpy-shell-send-buffer-and-step
    "msb" 'elpy-shell-send-buffer
    "msr" 'elpy-shell-send-region-or-buffer
    "msR" 'elpy-shell-send-region-or-buffer-and-step
    "msf" 'elpy-shell-send-defun
    "msF" 'elpy-shell-send-defun-and-step
    "myn" 'yas-new-snippet
    "mye" 'abbrev-expansion
    "m=" 'elpy-autopep8-fix-code
    
    )
;; ======= which-key =======
    (which-key-declare-prefixes-for-mode 'python-mode "SPC m V" "pyvenv")
    (which-key-declare-prefixes-for-mode 'python-mode "SPC m s" "send")
    (which-key-declare-prefixes-for-mode 'python-mode "SPC m " "major-mode")
)




;; ------- lsp hook -------
(add-hook 'python-mode-hook #'lsp)
(add-hook 'python-mode-hook 'mypythonkey)






;; ------- lsp company -------
(setq company-minimum-prefix-length 1
      company-idle-delay 0.1) ;; default is 0.2
;; ------- lsp which key set -------
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))


;;------- anaconda-mode -------
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)


;;------- 自动加载 -------
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))


;; ======= Enable =======
(elpy-enable)









;; ------- use ipython-------
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;; ------- enable Flycheck -------
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  )
;; ------- enable autopep8 -------
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; (require 'py-autopep8)





;; ------- run-python -------
(defun my-run-python()
"左边是原来的py右边是ipython，光标在左边"
  (interactive)(delete-other-windows)(split-window-right)(evil-window-right 1)(run-python)(evil-window-left 1))
(add-hook 'python-mode-hook (lambda() (local-set-key (kbd "M-p") 'my-run-python)))

;; ------- run-python -------

(global-set-key (kbd "C-k") (lambda ()(interactive)(comint-previous-input 1)))
(global-set-key (kbd "C-j") (lambda ()(interactive)(comint-next-input 1)))





;; ====== provide =======
(provide 'init-python)
