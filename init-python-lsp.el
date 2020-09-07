
;; ------- my functions -------
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

(evil-define-key '(normal visual move) python-mode-map (kbd "M-p") 'my-run-python)
;; (evil-define-key '(normal visual move) python-mode-map (kbd "C-<RET>") 'my-run-python)

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
    ;; ("sB" elpy-shell-send-buffer-and-go)
    ("sb" elpy-shell-send-buffer)
    ("sr" elpy-shell-send-region-or-buffer)
    ("sR" elpy-shell-send-region-or-buffer-and-go)
    ("sf" elpy-shell-send-defun)
    ("sF" elpy-shell-send-defun-and-go)
    ;; ("yn" yas-new-snippet)
    ("ye" abbrev-expansion)
    ("=" elpy-autopep8-fix-code)
    ("ld" lsp-ui-doc-mode)
    ("ls" lsp-ui-sideline-mode)
    ("ll" disable-python-minor-modes))


;; ------- lsp-microsoft -------
;; (require 'lsp-python-ms)
;; (setq lsp-python-ms-auto-install-server t)
;; (add-hook 'python-mode-hook #'lsp) ; or lsp-deferred

;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;;                           (lsp))))  ; or lsp-deferred
;; 很慢不好用
;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;; (setq lsp-keymap-prefix "s-l")

;; ------- lsp-jedi -------
;; (use-package lsp-jedi
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;     (add-to-list 'lsp-disabled-clients 'pyls)
;;     (add-to-list 'lsp-enabled-clients 'jedi)))

;; ------- lsp-pyright -------
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

;; ------- lsp-mode 设定 -------
(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (python-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; ------- lsp-ui 设定 -------

;; ------- use ipython as interpretor -------
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; -------completion-------
(add-hook 'lsp-managed-mode-hook (lambda () (setq-local company-backends '(company-capf))))







;; ------- mode hooks -------
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(elpy-enable)
(provide 'init-python-lsp)
