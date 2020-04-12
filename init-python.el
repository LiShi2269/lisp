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
;; ======= test =======
(setq lsp-print-performance t)
(setq lsp-ui-doc-enablet t)
(setq lsp-ui-peek-enable t)
(setq lsp-enable-xref t)
(setq lsp-treemacs-sync-mode t)
(setq lsp-enable-imenu t)
(setq lsp-ui-imenu-enable t)
(setq lsp-ui-sideline-ignore-duplicate t)
(setq lsp-ui-peek--list t)





(setq lsp-diagnostic-package 'flycheck)
;; lsp-enable-indentation
(setq lsp-enable-indentation t)
;; lsp-enable-on-type-formatting
(setq lsp-enable-on-type-formatting t)
;; lsp-imenu-show-container-name
(setq lsp-imenu-show-container-name t)
;; lsp-imenu-container-name-separator
(setq lsp-imenu-container-name-separator t)


;; ======= test =======
(require 'lsp-mode)





(require 'python-mode)



(defhydra hydra-python ()
   "

   hydra-python

   _Va_: Activate
   _Vd_: Deactivate
   _Vw_: Workon
"
   ("Va" pyvenv-activate)
   ("Vd" pyvenv-deactivate)
   ("Vw" pyvenv-workon)
   )

;; ----- mypythonkey-----
(defun my-python-set()
    ;; ------ evil ------
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
    ;; ------ hydra-python ------
    ;; (define-key evil-normal-state-map (kbd ",") 'hydra-python/body)
    (lsp-managed-mode -1)
    (display-line-numbers-mode 1)
    ;; ======= which-key =======
    (which-key-declare-prefixes-for-mode 'python-mode "SPC m V" "pyvenv")
    (which-key-declare-prefixes-for-mode 'python-mode "SPC m s" "send")
    (which-key-declare-prefixes-for-mode 'python-mode "SPC m " "major-mode")
)

(evil-define-key 'normal python-mode-map "," 'hydra-python/body)


;; ------- lsp hook -------
(add-hook 'python-mode-hook #'lsp)
(add-hook 'lsp-mode-hook 'my-python-set)
(add-hook 'lsp-mode-hook (lambda()
			      (lsp-managed-mode -1)))






;; ------- lsp company -------
(setq company-minimum-prefix-length 1
      company-idle-delay 0.1) ;; default is 0.2
;; ------- lsp which key set -------
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))



;;------- 自动加载 -------
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))


;; ======= Enable =======
(elpy-enable)









;; ------- use ipython-------
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")




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
