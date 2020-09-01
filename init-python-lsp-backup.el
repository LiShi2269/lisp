;; ====================elpy key map forbidden =================
;; 把elpy.el里面的这些禁用
    ;; (define-key map (kbd "<S-return>") 'elpy-open-and-indent-line-below)
    ;; (define-key map (kbd "<C-S-return>") 'elpy-open-and-indent-line-above)
    ;; (define-key map (kbd "<C-return>") 'elpy-shell-send-statement-and-step)

;; ====================elpy key map forbidden =================

;;default python mode state
(evil-set-initial-state 'python-mode 'normal) 
(evil-set-initial-state 'inferior-python-mode 'normal) 

(setq python-indent-offset 4)
(setq elpy-rpc-backend "jedi")
;; ------ lsp-mode ------
(setq lsp-keymap-prefix "s-l")
;; ------- lsp feature -------
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 2048 2048)) ;; 1mb
(setq lsp-prefer-capf t)
(setq lsp-idle-delay 0.500)
;; ;; ------- lsp ui feature -------
(setq lsp-auto-configure t)
;;(company-lsp t)
;; (lsp-ui-mode nil)
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
(setq lsp-ui-doc-delay 4)
;; ======= test =======
;; (lsp-ui-sideline-mode -1)
;; (lsp-ui-doc-mode -1)
(setq lsp-print-performance t)
;; (setq lsp-ui-doc-enablet -1)
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
;; lsp snippet 开的话会很慢
(setq lsp-enable-snippet nil)
;; ======= test =======
;; (company-lsp t)
(lsp-ui-mode nil)
(require 'lsp-mode)
;; (global-eldoc-mode nil)
(setq lsp-eldoc-render-all t)
(require 'python-mode)


(defun disable-python-minor-modes()
  (interactive)
    (lsp-managed-mode -1)
    (eldoc-mode -1))

;; ----- mypythonkey-----
(defun my-python-set()
    (display-line-numbers-mode 1)
)


(defun my-run-python()
"左边是原来的py右边是ipython，光标在左边"
  (interactive)(delete-other-windows)(split-window-right)(evil-window-right 1)(run-python)(evil-window-left 1))



(general-define-key
 :states '(normal motion insert)
 :keymaps 'inferior-python-mode-map
"C-k" 'comint-previous-input
"C-j" 'comint-next-input
)



(defhydra hydra-python()
 "
hydra-python
_Va_: pyenv   _sb_: send   _yn_: yas     _sb_: sendBUffer
_ll_: faster  _ls_: LSPui  _ld_: LSPDoc  _SB_: temp
_sr_: temp    _Vw_: workon _Vd_: deact   _=_: formation
_sf_: senFun  _sF_: temp   _sR_: temp
  
"
  
    ("Va" pyvenv-activate )
    ("Vd" pyvenv-deactivate)
    ("Vw" pyvenv-workon)
    ("sB" elpy-shell-send-buffer-and-go)
    ("sb" elpy-shell-send-buffer)
    ("sr" elpy-shell-send-region-or-buffer)
    ("sR" elpy-shell-send-region-or-buffer-and-go)
    ("sf" elpy-shell-send-defun)
    ("sF" elpy-shell-send-defun-and-go)
    ("yn" yas-new-snippet)
    ("ye" abbrev-expansion)
    ("=" elpy-autopep8-fix-code)
    ("ld" lsp-ui-doc-mode)
    ("ls" lsp-ui-sideline-mode)
    ("ll" disable-python-minor-modes))


;; ------- lsp hook -------
(add-hook 'python-mode-hook #'lsp)
(add-hook 'lsp-mode-hook 'my-python-set)
(add-hook 'python-mode-hook #'yas-minor-mode)
;; flycheck mode need pylint install in you python execute file
(add-hook 'python-mode-hook #'flycheck-mode)
(add-hook 'python-mode-hook (lambda()(eldoc-mode -1)))
(add-hook 'python-mode-hook (lambda()(lsp-managed-mode -1)))
(evil-define-minor-mode-key 'normal 'lsp-mode (kbd ",") 'hydra-python/body)
(evil-define-key 'normal 'python-mode-map (kbd "<SPC> m") 'hydra-python/body)
(evil-define-minor-mode-key 'normal 'lsp-mode (kbd "M-p") 'my-run-python)
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




;; ====== provide =======
(provide 'init-python-lsp-backup)
