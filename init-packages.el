;; ======= package manage =======
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     ;;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
	;;		      ("melpa" . "http://elpa.emacs-china.org/melpa/")
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")			
			      )))

;; https://github.com/nobiot/Zero-to-Emacs-and-Org-roam/blob/main/30.setup-org-roam.md
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (package-initialize)
;; (setq package-check-signature nil)

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
	ace-jump-mode
	ace-mc

	minimap
	beacon
	rainbow-delimiters
	;; --- jupyter ---
	jupyter
	;;emacs-websocket	;似乎不要也可以？
	simple-httpd
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

	dracula-theme
	monokai-theme
	atom-one-dark-theme
	alect-themes
	badger-theme
      	
	;; 不能用?
	doom-themes
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
	ob-ipython

	org-roam

	calfw
	calfw-org

	emacsql-sqlite
	;; org-download              ;windows好像不可以
	;; org-roam-server
	org-roam-bibtex
	org-ref

	ivy-bibtex
	;; ebib 文献管理 不知道为什么不能用
	
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
	auctex
	)
 "Default packages")



 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (cl-loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

;; 能下载图片直接放到org里面去
;; (use-package org-download
;;   :after org
;;   :bind
;;   ;; (:map org-mode-map
;;         ;; (("s-Y" . org-download-screenshot)
;;          ;; ("s-y" . org-download-yank)))
;;   )


;; ======= probide =======
(provide 'init-packages)



;; (setq perfect-margin-ignore-filters "posframe")
;; (setq perfect-margin-ignore-regexps "nil")
