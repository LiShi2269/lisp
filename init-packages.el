;; ======= package manage =======
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
	;; --- magit ---
	magit
	;; --- projectile ---
	projectile
	;; --- Auto-completion ---
	company
	;; --- Mini Buffer completion ---
	ivy
	;; --- Better Editing ---
	smartparens

	py-autopep8

	yasnippet

	yasnippet-snippets

	;; highlight-symbol
	;; mode-icons
	hydra

	ibuffer
	
	smex

	ein

	use-package
	
	which-key
	
	;; --- Python ---
	ein
	elpy
	jedi
	anaconda-mode
	python-mode
	flycheck	
	blacken
	py-autopep8
	lsp-mode
	lsp-ui
	lsp-treemacs
	lsp-ivy
	dap-mode
	company-lsp
	;; virtualenvwrapper
	
      	;; --- evil mode---
	evil
	evil-leader
	;; --- window ---
	winum
	;; --- Themes ---
	monokai-theme
      	;; --- test package ---
	ido
	flx
	flx-ido
	ranger
	)
 "Default packages")



 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))




;; ======= probide =======
(provide 'init-packages)
