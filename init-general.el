
;; ===== Evil Mode =====
(require 'evil)
(require 'general)
(evil-mode )


;; ===== beacon mode =====
;; 为了使用beacon把evil-next-line 换成 next-line
;; (evil-define-key 'normal 'global "j" (lambda()(interactive)(next-line 1)))
;; (evil-define-key 'normal 'global "k" (lambda()(interactive)(previous-line 1)))


;; ===== undo tree mode =====
(evil-define-key 'normal 'global "u" 'undo-tree-undo)
(evil-define-key 'normal 'global (kbd "C-r") 'undo-tree-redo)

(require 'evil-leader)
;; (global-evil-leader-mode)





;; ======= hydra ============
(defhydra hydra-zoom ()
  "zoom"
  ("}" text-scale-increase "bigger")
  ("{" text-scale-decrease "smaller"))

(defhydra hydra-highlight-symbol ()
  "hightlight-symbol"
  ("h" highlight-symbol)
  (">" highlight-symbol-next "next")
  ("<" highlight-symbol-prev "pre")
  ("]" highlight-symbol-next-in-defun "nextFun")
  ("[" highlight-symbol-prev-in-defun "preFun")
  )



(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 :prefix  "m"
 (kbd "m") 'bookmark-set
 (kbd "l") 'list-bookmarks
 )


;;major-mode-hydra
(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 (kbd ",") 'my-major-mode-fun
 )

;; ============如果是有用ein模式则要换成这个方法=========
(defun my-save-buffer()(interactive)
       (if (bound-and-true-p ein:notebook)(progn (ein:notebook-save-notebook-command-km)(turn-on-evil-mode))(save-buffer)))

;; (defun my-save-buffer()(interactive)
;;        (if (bound-and-true-p ein:notebook)(ein:notebook-save-notebook-command-km)(save-buffer)))


(defun my-major-mode-fun()(interactive)
   " 如果major-mode是python
	查看minor-mode当中有无ein
	    如果有
	    如果没有
    如果major-mode是org的话"
       (cond ((equal major-mode 'python-mode)
		    (if (bound-and-true-p ein:notebook-mode)  (hydra-ein/body) (hydra-python/body))) 
	     ((equal major-mode 'emacs-lisp-mode) (print " emacs-lisp-mode do not have mode key")) 
             ((equal major-mode 'org-mode) (my-org-major))
	     )
       )




(defun my-org-major()
  (interactive)
  (cond ( (org-in-src-block-p) (org-src/body))
	( (org-at-table-p)(org-table/body))
	( (org-at-heading-p)(org-subtree/body))
	(t (hydra-org/body))
	))



(add-hook 'bookmark-bmenu-mode-hook 'myset-bookmark-menu-function)
(defun myset-bookmark-menu-function()
    (define-key bookmark-bmenu-mode-map (kbd "j") 'next-line)
    (define-key bookmark-bmenu-mode-map (kbd "k") 'previous-line)
    ;; (define-key bookmark-bmenu-mode-map (kbd "ESC") 'quit-window)
  )

;; 在进入ipython的时候evil应该要采用normal-state
(evil-set-initial-state 'inferior-python-mode 'normal)

 
(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 (kbd "M-l") 'evil-window-right
 (kbd "M-h") 'evil-window-left
 (kbd "M-j") 'evil-window-down
 (kbd "M-k") 'evil-window-up
 )
(require 'treemacs)
(defun delete-other-window-and-quite-treemacs()(interactive)
       "删除出了当前窗口外的所有窗口并且关掉treemacs窗口"
       (progn (if (treemacs-get-local-window) (treemacs)())
	      (neotree-hide)
	      (delete-other-windows))
       )


(defun xah-copy-file-path (&optional DirPathOnlyQ)
  "Copy current buffer file path or dired path. Result is full path.
If `universal-argument' is called first, copy only the dir path.
If in dired, copy the current or marked files.
If a buffer is not file and not dired, copy value of `default-directory'.
URL `http://xahlee.info/emacs/emacs/emacs_copy_file_path.html'
Version 2018-06-18 2021-09-30"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if DirPathOnlyQ
         (progn
           (message "Directory copied: %s" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: %s" $fpath)
         $fpath )))))






(general-define-key
 :states  '(normal motion )
 :keymaps 'override 
 :prefix "SPC"

    "c" 'org-capture 
    ;; ---- dir ----
    "<SPC>" 'smex
    "a" '(:ignore t :which-key "mode")
    "ad" 'deer
    "ar" 'ranger
    "an" 'neotree-toggle
    "at" 'treemacs
    ;; ---- treemacs ----
    "aT" '(:ignore t  :which-key "treemacs")
    "aTe" 'treemacs-edit-workspaces
    "aTf" 'treemacs-finish-edit
    "aTB" 'treemacs-set-fallback-workspace
    "aTa" 'treemacs-add-and-display-current-project
    "aTr" 'treemacs-remove-project-from-workspace
    "aTs" 'treemacs-switch-workspace

    ;; ---- treemacs ----

    ;; ---- agenda ----
    "A" '(:ignore t  :which-key "agenda")
    "Al" 'org-store-link
    "Aa" 'org-agenda
    "Ac" 'org-capture
    "As" 'org-switchb
    "AL" 'org-agenda-list
    "At" 'org-todo-list
    ;; Add current file to the list of agenda files. The file is added to the front of the list. If it was already in the list, it is moved to the front. With a prefix argument, file is added/moved to the end.
    "Af" 'org-agenda-file-to-front
    "Ar" 'org-remove-file
    "AC" 'org-cycle-agenda-files
    "A>" 'org-agenda-set-restriction-lock
    "A<" 'org-agenda/org-agenda-remove-restriction-lock-and-exit

    ;; ---- file ----
    "f" '(:ignore t :which-key "file")
    "ff" 'find-file
    ;; ---- buffer ----
    "fs" 'my-save-buffer
    ;; "fs" 'save-buffer
    "<tab>" 'mode-line-other-buffer
    "b" '(:ignore t :which-key "buffer")
    ;; "bb" 'buffer-menu
    "bb" 'ibuffer
    "bc" 'xah-copy-file-path
    ;; 返回dashboard
    "bh" (lambda()(interactive)(progn(switch-to-buffer "*dashboard*")))
    "bd" 'kill-this-buffer
    "bi" 'ido-switch-buffer
    "bs" '(lambda()(interactive)(switch-to-buffer "*scratch*"))

    ;; ---- undo-tree ----
    "u" '(:ignore u :which-key "undotree")
    "uu" 'undo-tree-visualize
    "us" 'undo-tree-save-history
    "ul" 'undo-tree-load-history
    "U" 'undo
    ;; ---- window ----
    "w" '(:ignore t :which-key "window")
    "w-" 'split-window-below
    "w/" 'split-window-horizontally
    "wd" 'delete-window
    ;; "wD" 'delete-other-windows 
    "wD" 'delete-other-window-and-quite-treemacs
    "wl" 'evil-window-right
    "wL" 'evil-window-move-far-right
    "wh" 'evil-window-left
    "wH" 'evil-window-move-far-left
    "wk" 'evil-window-up
    "wK" 'evil-window-move-very-top
    "wj" 'evil-window-down
    "wJ" 'evil-window-move-very-bottom
    "w=" 'balance-windows
    "wf" 'make-frame
    "w;" 'toggle-truncate-lines
    "wc" 'centered-window-mode
    "wF" 'toggle-frame-fullscreen
    "w#s" 'desktop-save
    "w#r" 'desktop-read
    ;; ---- zoom ----
    "z" '(:ignore t :which-key "zoom")
    "z" 'hydra-zoom/body
    ;; ---- quit ----
    "q" '(:ignore t :which-key "quit")
    "qq" 'kill-emacs
    "qR" 'eval-buffer
    "qs" 'save-buffers-kill-emacs

    "s" '(:ignore t :which-key "special")
    ;; ---- iedit ----
    "se" 'iedit-mode
    ;; ---- Hight-symbol ----
    "sh" 'hydra-highlight-symbol/body
    "sD" 'dynamic-spaces-mode
    "sm" 'minimap-mode
    "sl" 'linum-relative-toggle
    "sy" '(:ignore t :which-key "yas")
    "syn" 'yas-new-snippet
    "syv" 'yas-visit-snippet-file
    "sm" 'ace-mc-add-multiple-cursors
    "ss" 'ace-mc-add-single-cursor

    "r" '(:ignore t :which-key "orgRoam")
    "rt" 'org-roam-buffer-toggle-display
    "rs" 'org-roam-db-sync
    "ri" 'org-roam-node-insert
    "r/" 'org-roam-node-find
    "rc" 'org-roam-capture
    "rt" 'org-roam-buffer-toggle
    "rA" 'org-roam-alias-add
    "rR" 'org-roam-alias-remove
    "rr" '(:ignore t :which-key "Roam-ref")
    "rra" 'org-roam-ref-add
    "rrr" 'org-roam-ref-remove

    ;; ---- ace-jump ----
    "j" '(:ignore t :which-key "AceJump")
    "j" 'ace-jump-mode

    ;; ---- ace-jump ----
    "m" 'imenu
    ;; ---- iedit ----
    "`"  'shell)

(add-hook 'after-make-frame-functions 'toggle-frame-fullscreen)
;; (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line )
;; (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)

;; One can also set org-roam-db-node-include-function. For example, to exclude all headlines with the ATTACH tag from the Org-roam database, one can set:
;; (setq org-roam-db-node-include-function
;;       (lambda ()
;;         (not (member "ATTACH" (org-get-tags)))))

;; 不自动保存
;; However, depending on how large your Org files are, database updating can be a slow operation. You can disable the automatic updating of the database by setting org-roam-db-update-on-save to nil.



(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-`") 'winum-select-window-by-number)
      (define-key map (kbd "C-²") 'winum-select-window-by-number)
      (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))

(require 'winum)

(winum-mode)


;; (defun kill-treemacs-buffer()
;;     (condition-case nil
;; 	(kill-buffer "Treemacs Update Single File Process")
;; 	(error nil))
;;     (setq a 2)
;;     (while (< a 10)
;;       (condition-case nil
;; 	  (kill-buffer
;; 	   (concatenate 'string "Treemacs Update Single File Process<" (number-to-string a) ">")
;; 	   )
;; 	(error nil)
;; 	  )
;;       ;; (print (concatenate 'string "asdf" (number-to-string a) "asdcf"))
;;       (setq a (+ a 1))
;;       )
;;   )

;; ==== undefine-key =====




;; ======= evil mode =======
(provide 'init-general)
