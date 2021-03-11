;; ======= package manage =======
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     ;;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
	;;		      ("melpa" . "http://elpa.emacs-china.org/melpa/")
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")			
			      )))



;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)
 (require 'cl-lib)

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
	evil-magit
	;; --- Better Editing ---
	neotree
	proxy-mode
	shell-pop
	general
	nswbuff
	focus	
	smartparens
	popwin
	iedit
	linum-relative
	;; 不知道怎么退出
	popup-kill-ring
	;; browse-kill-ring
	;; 用鼠标才可以？
	;; golden-ratio
	zoom

	powerline
	powerline-evil
	;; spaceline-all-the-icons

	minimap
	beacon
	rainbow-delimiters
	;; --- jupyter ---
	;; jupyter
	;; simple-httpd
	;; markdown-mode	
	;; zmq
	;; --- treemacs ---
	treemacs
	treemacs-evil
	treemacs-projectile
	treemacs-magit
	treemacs-icons-dired
	treemacs-all-the-icons
	;; undo-tree

	posframe
	which-key-posframe
	
	

	evil-surround
	ivy-posframe

	mini-frame
	yasnippet-snippets

	dynamic-spaces
	py-autopep8
	youdao-dictionary


	yasnippet

	dashboard

	;; dracula-theme
	;; monokai-theme
	;; atom-one-dark-theme
	;; 不能用?
	;; doom-themes
	sublime-themes
	
	
	yasnippet-snippets

	highlight-symbol
	;; 不好用的mode-icons
	;; mode-icons
	all-the-icons
	all-the-icons-dired
	;; 不知道怎么用的powerline
	;; powerline

	perfect-margin
	hydra

	ibuffer
	
	smex
	pandoc
	openwith

	;; pdf-tools
	;; org-pdftools
	;; org-noter-pdftools
	;; org-noter

	ein

	use-package
	
	which-key
	ido
	ido-vertical-mode
	flx
	flx-ido
	ranger
	key-chord
	
	;; --- Python ---
	ein
	elpy
	;;jedi是专门给auto-company使用的，company-jedi才是company用的
	company-jedi
	;;default
	anaconda-mode
	python-mode
	flycheck	
	blacken
	lsp-jedi
	;; lsp-python-ms
	;; lsp-pyright
	

	py-autopep8
	lsp-mode
	lsp-ui
	lsp-treemacs
	lsp-ivy
	;; dap-mode
	;; company-lsp已经不用了，见github相关
	;; company-lsp
	;;virtualenvwrapper
	
      	;; --- evil mode---
	evil
	evil-leader
	;; --- window ---
	winum
	;; --- Themes ---
	;; monokai-theme
      	;; --- test package ---
	;; google-this
      	;; --- windows 不能用 ---
	;; auctex
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
