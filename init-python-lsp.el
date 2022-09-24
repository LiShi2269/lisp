;; 和python有关的环境变量
;; path
;; C:\HOME\.pyenv\pyenv-win\bin
;; C:\HOME\.pyenv\pyenv-win\shims
;; C:\HOME\.pyenv\pyenv-win\versions\3.6.8\Scripts
;; C:\HOME\.pyenv\pyenv-win\versions\3.6.8\python.exe

;; PYENV
;; PYENV_HOME
;; pyenv-win

;; WORKON_HOME


(elpy-enable)
;; (elpy-nav-backward-indent)
;; ctrl + 左右的快捷键在elpy mode 中取消
(define-key elpy-mode-map (kbd "C-<left>") nil)
(define-key elpy-mode-map (kbd "C-<right>") nil)

;; ------- my functions -------
(defun my-run-python()
"左边是原来的py右边是ipython，光标在左边"
(interactive)
;; (run-python)
    (progn
	(delete-other-windows)
	(split-window-right)
	(run-python)
	(switch-to-buffer "*Python*")
	(evil-window-move-far-right)
	(evil-window-left 1)
	(if (treemacs-get-local-window) (treemacs)(print ""))
	)
)


;; ------- key-configuring-------
(general-define-key
 :states '(normal motion insert)
 :keymaps 'inferior-python-mode-map
"C-k" 'comint-previous-input
"C-j" 'comint-next-input
)


;; ------- hydra-python-------
(defhydra hydra-python(:exit t)
;;  "
;; hydra-python
;; _Va_: pyenv   _sb_: send   _yn_: yas     _sb_: sendBUffer
;; _ll_: faster  _ls_: LSPui  _ld_: LSPDoc  _SB_: temp
;; _sr_: temp    _Vw_: workon _Vd_: deact   _=_: formation
;; _sf_: senFun  _sF_: temp   _sR_: temp
  
;; "
  
    ("Va" pyvenv-activate "pyvenvActivate")
    ("Vd" pyvenv-deactivate "pyvenvDeactivate")
    ("Vw" pyvenv-workon "workon")
    ;; ("sB" elpy-shell-send-buffer-and-go)
    ("sb" elpy-shell-send-buffer "sendBuffer")
    ("sr" elpy-shell-send-region-or-buffer "sendRegion")
    ("sR" elpy-shell-send-region-or-buffer-and-go "sendRegion_go")
    ("sf" elpy-shell-send-defun "sendFunc")
    ("sF" elpy-shell-send-defun-and-go "sendFunc_go")
    ;; ("yn" yas-new-snippet)
    ("ye" abbrev-expansion "abbrevExpansion")
    ("=" elpy-format-code "fixCode")
;; ---------lsp function ----------------
    ("lsd" my-toggle-sideline-show-diagnostics "")
    ("lsh" my-toggle-sideline-show-hover)
    ("lsa" my-toggle-sideline-show-code-actions)
    ("lsu" my-toggle-sideline-update-mode)
    ("ldp"  my-toggle-doc-position)
    ("lm"  my-toggle-imenu)
    ("run"  my-run-python "runPython")
    ("'" org-edit-src-abort "org special edit") ;
    )


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

(defun my-toggle-imenu()(interactive)
       (if (get-buffer-window "*lsp-ui-imenu*")
	   ;; (message "being")
	   (progn
	    (switch-to-buffer-other-window "*lsp-ui-imenu*") (kill-buffer-and-window)
	     )
	   (lsp-ui-imenu)
	   )
       )

;; ipython补全很慢
(add-hook 'inferior-python-mode-hook (lambda()(company-mode -1)))

;; ------- lsp-microsoft -------

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
        (setq lsp-log-io t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred
;; 如果是linux需要安装依赖，archlinux中在yay有相关内容


;; ------- lsp-jedi -------
;; (use-package lsp-jedi
  ;; :ensure t
  ;; :config
  ;; (with-eval-after-load "lsp-mode"
    ;; (add-to-list 'lsp-disabled-clients 'pyls)
    ;; (add-to-list 'lsp-enabled-clients 'jedi)))

;; ------- lsp-pyright -------
;; (use-package lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred


;; ------- lsp-mode 设定 -------
(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (python-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp
    :bind(
	  :map lsp-mode-map
	  ("C-<RET>" . elpy-shell-send-statement-and-step)
	  )
    )
(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp)))
  )  ; or lsp-deferred

;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)


;; ------- lsp-ui 设定 -------
;; (setq lsp-ui-doc-delay 5)
;; (setq lsp-ui-sideline-show-hover t)
;; (setq lsp-ui-sideline-show-diagnostics nil)
;; (setq lsp-ui-sideline-show-code-actions nil)
;; (setq lsp-ui-sideline-update-mode nil)



;; ------- use ipython as interpretor -------
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;; -------completion-------
;; (add-hook 'lsp-managed-mode-hook (lambda () (setq-local company-backends '(company-capf))
;; 				   (flycheck-mode)))

;; lsp-completion-mode会导致不能在lspmode中补全路径
(add-hook 'lsp-mode-hook (lambda () (flycheck-mode 1)(hs-minor-mode 1)(lsp-completion-mode 0)))
(setq lsp-python-ms-python-executable  "C:/HOME/.pyenv/pyenv-win/versions/3.9.2/python.exe")
(setq lsp-python-ms-extra-paths  '("C:/HOME/.pyenv/pyenv-win/versions/3.9.2/python.exe" ))

(add-hook 'hack-local-variables-hook
      (lambda ()
    (when (derived-mode-p 'python-mode)
      (require 'lsp-python-ms)
      (lsp)))) ; or lsp-deferred

;; (setq elpy-rpc-virtualenv-path 'current)

(setq lsp-enable-snippet nil)		;如果开启的话 yas-snippet 的补全久无法使用了
(setq lsp-completion-enable nil)

(key-chord-define python-mode-map ".." 'myinsert)
(key-chord-define python-mode-map "zz" 'elpy-folding-toggle-at-point)
(key-chord-define python-mode-map "z;" 'elpy-folding-toggle-comments)
(key-chord-define python-mode-map "zs" 'hs-hide-all)
(key-chord-define python-mode-map "zS" 'hs-show-all)
(key-chord-define inferior-python-mode-map ".." 'myinsert)

;; ------- mode hooks -------
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))



(use-package flycheck
  :ensure t
  )




(provide 'init-python-lsp)
