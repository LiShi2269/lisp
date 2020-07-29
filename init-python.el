(elpy-enable)
(require 'python-mode)
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;;default python mode state
(evil-set-initial-state 'python-mode 'normal) 
(evil-set-initial-state 'inferior-python-mode 'normal) 



(defun my-run-python()
"左边是原来的py右边是ipython，光标在左边"
  (interactive)(delete-other-windows)(split-window-right)(evil-window-right 1)(run-python)(evil-window-left 1))



;; ------- key-configuring-------
(general-define-key
 :states '(normal motion insert)
 :keymaps 'inferior-python-mode-map
"C-k" 'comint-previous-input
"C-j" 'comint-next-input
)
;;my-python-run
;;hydra-python



;; ------- hydra-python-------
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


(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; ------- use ipython-------
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")



;;------- 自动加载 -------
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))



;; ====== provide =======
(provide 'init-python)
