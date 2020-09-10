
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
;; ---------lsp function ----------------
    ("lsd" my-toggle-sideline-show-diagnostics)
    ("lsh" my-toggle-sideline-show-hover)
    ("lsa" my-toggle-sideline-show-code-actions)
    ("lsu" my-toggle-sideline-update-mode)
    ("ldp"  my-toggle-doc-position)
    ("lm"  my-toggle-imenu)
    )

(setq lsp-ui-sideline-show-diagnostics nil)
;; (defun my-test()(interactive)
       ;; (setq lsp-ui-sideline-show-diagnostics t)
       ;; (message "did it"))

;; (global-set-key (kbd "<f8>") 'my-test)

(defun my-toggle-sideline-show-diagnostics()(interactive)
       (if (equal lsp-ui-sideline-show-diagnostics t)
	   (setq lsp-ui-sideline-show-diagnostics nil)
	   (setq lsp-ui-sideline-show-diagnostics t)
	 ))

(defun my-toggle-sideline-show-hover()(interactive)
       (if (equal lsp-ui-sideline-show-hover t)
	   (setq lsp-ui-sideline-show-hover nil)
	   (setq lsp-ui-sideline-show-hover t)
	 ))

(defun my-toggle-sideline-show-code-actions()(interactive)
       (if (equal lsp-ui-sideline-show-code-actions t)
	   (setq lsp-ui-sideline-show-code-actions nil)
	   (setq lsp-ui-sideline-show-code-actions t)
	 ))

(defun my-toggle-sideline-update-mode()(interactive)
       (if (equal lsp-ui-sideline-update-mode t)
	   (setq lsp-ui-sideline-update-mode nil)
	   (setq lsp-ui-sideline-update-mode t)
	 ))

(defun my-toggle-ui-doc-show()(interactive)
       (if (equal lsp-ui-doc-enable t)
	   (setq lsp-ui-doc-enable nil)
	   (setq lsp-ui-doc-enable t)
	 ))

(defun my-toggle-doc-position()(interactive)
       (cond ((equal lsp-ui-doc-position 'at-point) (setq lsp-ui-doc-position 'bottom))
       ((equal lsp-ui-doc-position 'bottom) (setq lsp-ui-doc-position 'top))
        ((equal lsp-ui-doc-position 'top) (setq lsp-ui-doc-position 'at-point))
	 ))

;; (defun my-toggle-imenu()(interactive)
;;        (if (get-buffer "*lsp-ui-imenu*")
;; 	   (lambda()())
;; 	   ;; (switch-to-buffer "*lsp-ui-imenu*")
;; 	   (lsp-ui-imenu)
;; 	 ))
;; ;; (defun my-test()(interactive)
;;        ;; (if (equal lsp-ui-doc-position 'at-point)(message "at point")(message "no")))

;; (global-set-key (kbd "<f9>") 'my-toggle-imenu)
;; (global-set-key (kbd "<f8>") 'my-test)



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
;; ------- lsp-ui-doc 设定 -------
(setq lsp-ui-doc-delay 3)
;; ------- lsp-ui-sideline 设定 -------
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-sideline-update-mode t)
;; ------- use ipython as interpretor -------
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; -------completion-------
(add-hook 'lsp-managed-mode-hook (lambda () (setq-local company-backends '(company-capf))))







;; ------- mode hooks -------
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(elpy-enable)
(provide 'init-python-lsp)
