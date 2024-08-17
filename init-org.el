


;; init file for org-mode
(require 'org)
;;---------bullets------------
(require 'org-bullets)
(add-hook 'org-mode-hook 'rainbow-delimiters-mode-enable)





(add-hook 'org-mode-hook
	  (lambda ()
	    (org-bullets-mode 1)
	    (openwith-mode 1)
	    ;; (setq openwith-associations '(("\\.pdf\\'" "okular" (file)))) ;想要用特定的程序打开特定的文件
	    (setq line-spacing 0.2)
	    (toggle-truncate-lines t)
			   ))

(add-hook 'org-mode-hook
	  (lambda ()
	    (custom-set-faces
		'(header-line ((default :background "#161a1f")))
	    )
			   ))




;; (setq org-image-actual-width nil)
;; 关于org src 模式导出是不是前面要有空格
(setq org-src-preserve-indentation t 
      org-edit-src-content-indentation t)

;; 关于org-special-mode
(setq org-src-window-setup 'split-window-right)
(setq org-edit-src-turn-on-auto-save t)

;; ------key-map-set-----
;; (setq org-log-done nil)


;; After that, everything will happen automatically. All diary entries including holidays, anniversaries, etc., will be included in the agenda buffer created by Org mode. <SPC>, <TAB>, and <RET> can be used from the agenda buffer to jump to the diary file in order to edit existing diary entries. The i command to insert new entries for the current date works in the agenda buffer, as well as the commands S, M, and C to display Sunrise/Sunset times, show lunar phases and to convert to other calendars, respectively. c can be used to switch back and forth between calendar and agenda.
;; (setq org-agenda-include-diary t)



;; ------ lisp-mode key config -------
;; (defun my-major-mode-c-return-fun()(interactive)
;;        "但是！lisp-interaction 不是major mode！"
;;        "如果major mode 是org-mode但是minor-mode是lisp-interaction-mode那么c-ret就是org-babel-execute-src-block"
;;        "如果major mode 是lisp-interaction-mode那么c-ret就是eval-defun"
;;        (cond ((equal major-mode 'emacs-lisp-mode)(elisp--eval-defun)) 
;; 	    ;; ((equal major-mode 'elisp-mode)(eval-last-sexp)) 
;; 	     ((equal major-mode 'org-mode) (org-babel-execute-src-block)) 
;; 	     ((equal major-mode 'python-mode (elpy-shell-send-satement-and-step)) 
;;        ))



;; v2 是否使用
;; (setq org-roam-v2-ack t)

;; 来源 https://github.com/nobiot/Zero-to-Emacs-and-Org-roam/blob/v1/90.org-protocol.md
(setq org-roam-graph-executable "c:/HOME/Graphviz/dot.exe")



;; (use-package org-ref
;;   :ensure t
;;   :config
;;   (setq reftex-default-bibliography '("f:/zoterofiles/我的文库.bib"))
;;   ;; (setq org-ref-bibliography-notes "path/to/your/notes.org")
;;   (setq org-ref-default-citation-link "cite:"))


(require 'org-ref)
(require 'org-ref-ivy)
(require 'ivy-bibtex)
(setq bibtex-completion-bibliography '(
				       "f:/zoterofiles/我的文库.bib"
				       )
      )
					;可以直接添加到后面不需要逗号

(setq bibtex-completion-library-path '("f:/zotero/"))
(setq bibtex-completion-pdf-field "file")



 

;;  (with-eval-after-load 'pdf-annot
;;    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))


;; test
;; (defun my/org-ref-open-pdf-at-point ()
;;   "Open the pdf for bibtex key under point if it exists."
;;   (interactive)
;;   (let* ((results (org-ref-get-bibtex-key-and-file))
;;          (key (car results))
;;          (pdf-file (funcall org-ref-get-pdf-filename-function key))
;;      (pdf-other (bibtex-completion-find-pdf key)))
;;     (cond ((file-exists-p pdf-file)
;;        (org-open-file pdf-file))
;;       (pdf-other
;;        (org-open-file pdf-other))
;;       (message "No PDF found for %s" key))))
;; (global-set-key (kbd "<f6>") 'my/org-ref-open-pdf-at-point)
;; (setq org-ref-pdf-directory "f:/zotero/")
;; (setq bibtex-completion-library-path "f:/zotero/")
;; test


;; (setq org-roam-graph-viewer "C:/Program Files/Google/Chrome/Application/chrome.exe")
;; (setq org-roam-graph-viewer nil)

;; (require 'org-protocol)
;; (require 'org-roam-protocol)
;; (load-file "~/.emacs.d/lisp/+org-protocol-check-filename-for-protocol.el")
;; (advice-add 'org-protocol-check-filename-for-protocol :override '+org-protocol-check-filename-for-protocol)

;; (require 'org-roam-server)
;; (setq org-roam-server-host "127.0.0.1"
;;       org-roam-server-port 8181
;;       org-roam-server-export-inline-images t
;;       org-roam-server-authenticate nil
;;       org-roam-server-network-poll t
;;       org-roam-server-network-arrows nil
;;       org-roam-server-network-label-truncate t
;;       org-roam-server-network-label-truncate-length 60
;;       org-roam-server-network-label-wrap-length 20)



(defun insert-now-timestamp()
  "Insert org mode timestamp at point with current date and time."
  (interactive)
  (org-insert-time-stamp (current-time) t))


(general-define-key
 :keymaps 'org-mode-map
 "C-S-j" 'org-babel-next-src-block
 "C-S-k" 'org-babel-previous-src-block
 "C-k" 'org-previous-visible-heading
 "C-j" 'org-next-visible-heading
 "<tab>" 'org-cycle 
 "C-'" nil
 "<tab>" 'org-cycle
 "C-<return>" 'my-C-turn
 )



(defun my-C-turn()
  (interactive)
  (cond ( (org-in-src-block-p) (progn (org-babel-execute-src-block-maybe)(org-babel-next-src-block)))
	(t (org-insert-heading-respect-content))
	))
  

(defun wrap-line-with-print ()
  "Wrap the current line with print()."
  (interactive)
  (let ((line-text (buffer-substring-no-properties
                    (line-beginning-position)
                    (line-end-position))))
    ;; 删除当前行的内容
    (delete-region (line-beginning-position) (line-end-position))
    ;; 插入新的内容
    (insert (format "print(%s)" line-text))
    ;; 保留行末的换行符
    (newline)))

;; (evil-define-key '('normal 'visual) org-mode-map (kbd ",") 'hydra-org/body)



(defhydra hydra-org(:exit t :columns 5)
  "org"
  ("o" org-open-at-point "openwith")
;; s sub
  ("s" org-subtree/body "subtree")
;; * heading
  ("*" org-toggle-heading "heading")
;; U up heading
  ("U" outline-up-heading "up")
;; n narrow
  ("n" org-narrow/body "narrow")
;; . time
  ("." org-time/body "time")
;; \\ ToDo
  ("\\" org-todo/body "todo")
;; l link
  ("l" org-link/body "link")
;; a agenda
  ("a" org-agenda/body "agenda")
;; S SparseTree
  ("S" org-Sparsetree/body "Sparse")
;; i image
  ("i" org-image/body "image")
;; | table
  ("|" org-table/body "table")
;; D deadline
  ("D" org-deadline-date/body "DeadTime")
;; d draw
  ("d" org-draw/body "draw")
;; T tag
  ("T" org-tag/body "tag")
;; p property
  ("P" org-property/body "property")
;; v show
  ("v" org-show/body "vision")
;; e envirenment
  ("E" org-env/body "environments")
;;sort
    ("`" org-sort "sort")
;;src-code
    ("e" org-src/body "Execute")
;;edit-special
    ("'" org-edit-special "org special edit")
;;mark ring
    ("<left>" org-mark-ring-push "org mode config")
    ("<right>" org-mark-ring-goto "org mode config")
;;org-open
    ("o" org-open-at-point "org open at point")
;;org-ui
    ("U" org-roam-ui-open "org-ui")
;;ID
    ("I" org-id-get-create "orgID")

    ("b" my-org-bold-line "bold")
    ("_" my-org-_-line "__")
    ("/" my-org-/-line "//")
    ("+" my-org-+-line "++")
    ("R" org-mode-restart "Restart")
  )






(defun my-org-bold-line()(interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'word))
           (begin (car bounds))
           (end (cdr bounds)))
      (when bounds
        (goto-char end)
        (insert "*")
        (goto-char begin)
        (insert "*"))))
  )

(defun my-org-/-line()(interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'word))
           (begin (car bounds))
           (end (cdr bounds)))
      (when bounds
        (goto-char end)
        (insert "/")
        (goto-char begin)
        (insert "/"))))
       )

(defun my-org-+-line()(interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'word))
           (begin (car bounds))
           (end (cdr bounds)))
      (when bounds
        (goto-char end)
        (insert "+")
        (goto-char begin)
        (insert "+"))))
       )

(defun my-org-_-line()(interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'word))
           (begin (car bounds))
           (end (cdr bounds)))
      (when bounds
        (goto-char end)
        (insert "_")
        (goto-char begin)
        (insert "_"))))
       )

(defun my-org-add-print()(interactive)
       (progn   (evil-normal-state)
		(evil-next-line-1-first-non-blank)
		(insert "(")
		(evil-end-of-line)
		(evil-append 1)
		(insert ")")
		(evil-normal-state)
		(evil-next-line-1-first-non-blank)
		(insert "print")
	      ) )



(defhydra org-mode-config(:exit t)
("n" org-num-face "orgNum")
  )


(defhydra org-citarr()
("c" citar-insert-citation "citaion")
("b" citar-insert-bibtex "bibtex")
("r" citar-insert-reference "reference")
  )


(defhydra org-subtree(:exit t :columns 6)
  "subtree"
("x" org-cut-subtree "cut")
("C" org-copy-subtree "copy")
("c" org-citarr/body "citar")
("p" org-paste-subtree "paste")
("$" org-archive-subtree "Archive")
("P" org-property/body "property")
("D" org-deadline-date/body "deadline")
("s" org-schedule "Schedule")
("S" org-Sparsetree/body "Sparse")
("." org-time/body "TimeMenu")
("e" org-babel-execute-subtree "Execute")
;; ("s" org-subtree/body "self")
("n" org-narrow/body "narrow")
("T" org-tag/body "tag")
("l" org-link/body "link")
("o" org-open-at-point "link")
("I" org-id-get-create "orgID")
  )

(defhydra org-env(:exit t)
("w" pyvenv-workon "pyvenv-workon")
("R" (lambda()(interactive)(org-babel-jupyter-aliases-from-kernelspecs)) "JupyterAliase")
  )

(defhydra org-narrow(:exit t)
  "narrow"
("b" org-narrow-to-block "nBlock")
("s" org-narrow-to-subtree "nSubtree")
("w" widen "widen")
  )

(defhydra org-time(:exit t :columns 6)
  "org-time"
("." org-time-stamp "stamp")
("!" org-time-stamp-inactive "stampInactive")
("fc" org-date-from-calendar "dateFromCalendar")
("gc" org-date-goto-calendar "dateGotoCalendar")
;; ("o" org-open-at-point) ;;what is this?
("r" org-evaluate-time-range "tameRange")
("i" org-clock-in "clockIn")
("o" org-clock-out "clockOut")
("l" org-clock-in-last "clockLast")
("t" insert-now-timestamp "nowTime")
("q" org-clock-cancel "clockCancel")
("v" org-clock-display "clockDisplay")
("j" org-clock-goto "clock_goto")
("cD" org-check-deadlines "check_DDL")
("cb" org-check-before-date "check_Before_date")
("ca" org-check-after-date "check_After_date")
("e" org-set-effort "set-Effort")
("E" org-clock-modify-effort-estimate "modify-effort-estimate")
)


(defhydra org-todo(:exit t)
  "org-todo"
 ("t" org-todo "todo")
 ("vt" org-show-todo-tree "showTodoTree")
 ;; ("\\l" org-todo-list)
 ("i" org-insert-todo-heading "insert")
 )



(defhydra org-link(:exit t)
  "org-link"
 ;; you need to use org-store-link
 ("l" org-insert-link "insert")
 ("j" org-next-link "next")
 ("k" org-previous-link "previous")
 )



(defhydra org-agenda(:exit t)
  "org-agenda"
 ("i" org-agenda-file-to-front "insertTocalenda")
 ("d" org-remove-file "DeleteTocalenda")
 ;; org switchb 应该是 global
 ;; ("a<TAB>" 'org-switchb)
 ;; ("" 'universal-argument)
 ("s" org-agenda-set-restriction-lock "restriction")
 ("r" org-agenda-remove-restriction-lock "unrestriction")
 )


(defhydra org-Sparsetree(:exit t)
  "org-Sparsetree"
 ;; -------Sparse trees--------
 ("/" org-sparse-tree "sparseTree")
 ("m" org-match-sparse-tree "MatchSparse")
 ("o" org-occur "occur")
 ("j" next-error "nextError")
 ("k" previous-error "prviousError")
 )


(defun org-to-imagelink()(interactive)(progn (evil-first-non-blank)(insert "[[")(end-of-line)(insert "]]")))
(defhydra org-image(:exit t)
 ("t" org-toggle-inline-images "toggleImage")
 ("l" org-to-imagelink "link")
 )


(defhydra org-table(:exit t :columns 5)
  "org-table"
 ;; -------table--------
 ("i" org-table-create-or-convert-from-region "insert")
 ("l" org-link/body "link")
 ("r" org-table-align "align")
 ("<SPC>" org-table-blank-field "blank")
 ("c" org-table-copy-region "copy")
 ("x" org-table-cut-region "cut")
 ("p" org-table-paste-rectangle "paste")
 ("`" org-table-edit-field "edit")
  ("o" org-open-at-point "openwith")
 )


(defhydra org-deadline-date(:exit t)
  "org-deadline-date"
 ("i" org-deadline "insertDeadline")
 ("c" org-check-deadlines "checkDeadline")
 ("s" org-schedule "schedule")
 ("<" org-check-before-date "checkBeforeDate")
 (">" org-check-After-date "checkAfterDate")
 )


(defhydra org-draw(:exit t)
 ;; -------drawer--------
 ("i" org-insert-drawer "insertDraw")
 )


(defhydra org-tag(:exit t)
  "org-tag"
("i" org-set-tags-command "insert")
("s" org-tags-view "view")
 )


(defhydra org-property(:exit t)
  "org-property"
 ;; -------property--------
 ("i" org-set-property "insert")
 ("d" org-delete-property "delete")
 ("D" org-delete-property-globally "deleteGlobally")
 )



(defhydra org-show(:exit t)
  "org-show"
 ;; -------show something--------
 ("a" outline-show-all "showAll")
 ("1" org-set-startup-visibility "startupVisibility")
 ;; ("sc" outline-show-children)
 ("2" org-tree-to-indirect-buffer "indirectBuffer")
 )



(defhydra org-src(:exit t :columns 5)
  "org-src"
 ("ij" jupyter-org-insert-src-block "insert")
 ("s" org-babel-execute-subtree "executeSubtree")
 ("o" org-babel-open-src-block-result "Open")
 ("n" org-babel-goto-named-src-block  "namedSrc")
 ("N" org-babel-goto-named-result  "namedResult")
 ("b" org-babel-execute-buffer   "executeBuffer")
 ("/" org-babel-demarcate-block   "split")
 ("h" org-babel-insert-header-arg   "headerArg")
 ("D" org-babel-remove-result   "removeResults")
 ("u" org-babel-goto-src-block-head   "headerArg")
("e" org-src/body "Execute")
 ("'" org-edit-special "SpecialEdit")
 ("c" org-babel-remove-result "clear")
 ("l" org-link "link")
;; 快速加上print(原内容)
;; ("(" my-org-add-print "add-print()")

  ("p" wrap-line-with-print "print")
 )





;; --------- todo list -----------
(setq org-todo-keywords
      '(
	(sequence "TODO" "DELAY" "|" "CHANGE" "DONE" "CANCELLED" )
	(sequence "one" "two" "three" "four" "five" "|" "DONE")
	;; (sequence "a" "b" "c" "e" "f" "|" "DONE")
	;; (sequence "1" "2" "3" "4" "5" "|" "DONE")
	))


;; -------clock--------
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; -------jupyter--------
(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   ;;(python . t)
   (jupyter . t)
   ))

(org-babel-jupyter-override-src-block "python")
(setq org-babel-default-header-args:jupyter-julia '((:async . "yes")
                                                    ;; (:session . "jl")
                                                    ;; (:kernel . "julia-1.0")
						    ))
    

;;========== 出现 org-babel-execute-src-block: No org-babel-execute function 问题==========================================
;; jupyter-run-repl
;; (shell-command-to-string "jupyter kernelspecs list")
;; (org-babel-jupyter-aliases-from-kernelspecs)
;; (executable-find "jupyter")
;; (jupyter-available-kernelspecs)
;;=========================================================================================================================

;; "c:/HOME/.pyenv/pyenv-win/shims/jupyter.bat"








 	
;;====================== latex ===========================
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)

;;====================== 排版 ===========================

;; hard indent？？？
;; (setq org-adapt-indentation t
      ;; org-hide-leading-stars t
      ;; org-odd-levels-only t)

;; don’t display the emphasis markers
;; change the face of a headline if it is marked DONE
;; hide the stars
;; show entities as UTF8 characters.
;; odd levels only
;; I feel this makes for a cleaner look of the buffer.

;; (setq
;;       org-hide-emphasis-markers nil
;;       org org-adapt-indentation nil
;;       org-fontify-done-headline nil
;;       org-hide-leading-stars t
;;       ;; org-pretty-entities t
;;       ;; org-odd-levels-only t
;;       )

;; org-block-bege
(custom-set-faces
 '(org-block-begin-line ((default :background "brown")))
 '(org-block-end-line ((default :background "brown")))
 '(header-line ((default :background "#161a1f")))
 '(org-level-1 ((t :height 1.3 :weight bold :foreground "light sky blue")))
 '(org-level-2 ((t :height 1.2 :weight bold :foreground "pale turquoise")))
 '(org-level-3 ((t :height 1.1 :weight normal :foreground "salmon")))
 '(org-level-4 ((t :height 1.1 :foreground "DarkTurquoise")))
 '(org-level-5 ((t :height 1.1 :foreground "medium aquamarine")))
 '(org-level-6 ((t :height 1.1 :foreground "indian red")))
 '(org-level-7 ((t :height 1.1 :foreground "violet")))
 '(org-headline-done ((t :weight normal :foreground "SeaGreen1")))
 '(org-headline-todo ((t :weight normal :foreground "HotPink")))
 )

;; (setq org-cycle-separator-lines 0)


;; org-effort-property?
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


;; -------------- org-roam ---------------------
;; 需要在环境变量当中添加下面的文件夹
(add-to-list 'exec-path "c:/HOME/sqlite/sqlite3.exe")
(add-to-list 'exec-path "c:/HOME/sqlite")
(add-to-list 'exec-path "c:/HOME/msys64/usr/bin/cc.exe")
(add-to-list 'exec-path "c:/HOME/msys64/usr/bin")
(add-hook 'after-init-hook 'org-roam-mode)

(setq org-roam-directory "/mnt/f/roam/") ;only one org-roam path
(org-roam-db-autosync-mode 1)
(setq org-roam-v2-ack t)



;; -------------- org-roam ---------------------
(setq org-default-notes-file (concat org-directory "/notes.org"))




;; org-specil-mode 使用 compay
;; (use-package company-org-block
;;   :ensure t
;;   :hook ((org-mode . (lambda () (setq-local company-backends '(company-org-block))(company-mode +1)))))




;; One can also set org-roam-db-node-include-function. For example, to exclude all headlines with the ATTACH tag from the Org-roam database, one can set:
;; (setq org-roam-db-node-include-function
;;       (lambda ()
;;         (not (member "ATTACH" (org-get-tags)))))

;; 不自动保存
;; However, depending on how large your Org files are, database updating can be a slow operation. You can disable the automatic updating of the database by setting org-roam-db-update-on-save to nil.



;; 7.2 Configuring what is displayed in the buffer
;; There are currently 3 provided widget types:

;; BacklinksView (preview of) nodes that link to this node
;; Reference LinksNodes that reference this node (see Refs)
;; Unlinked referencesView nodes that contain text that match the nodes title/alias but are not linked
;; To configure what sections are displayed in the buffer, set org-roam-mode-section-functions.
;; ;; (setq org-roam-mode-section-functions
;;       (list #'org-roam-backlinks-section
;;             #'org-roam-reflinks-section
;;             ;; #'org-roam-unlinked-references-section
;;             ))


;; 7.3 Configuring the Org-roam buffer display
;; (add-to-list 'display-buffer-alist
;;              '("\\*org-roam\\*"
;;                (display-buffer-in-direction)
;;                (direction . right)
;;                (window-width . 0.33)
;;                (window-height . fit-window-to-buffer))

;; (add-to-list 'display-buffer-alist
;;              '("\\*org-roam\\*"
;;                (display-buffer-in-side-window)
;;                (side . right)
;;                (slot . 0)
;;                (window-width . 0.33)
;;                (window-parameters . ((no-other-window . t)
;;                                      (no-delete-other-windows . t)))))


;; roam 在任何位置可以补全
(setq org-roam-completion-everywhere t)

;; org-roam 图需要用注册表 graphviz 软件

;; 用chrome打开
;; sudo apt install graphviz 先安装这个
(setq org-roam-graph-executable "neato")
;; 安装方法 sudo apt-get install graphviz
;; (setq org-roam-graph-executable "/usr/local/bin/neato")
(setq org-roam-graph-viewer "/usr/bin/google-chrome-stable")
(setq org-roam-graph-viewer nil)


;; If you use this setting and don’t want to see images in a specific file, add this at the top of the org files that are not to display images: #+STARTUP: noinlineimages

;; org capture templates
(setq org-capture-templates
      '(
	("t" "task" entry (file+headline "f:/task/task.org" "temp" )
         "** TODO %?  %i  %a")

        ("e" "Event" entry (file+datetree "f:/task/Event.org" )
         "* %?\nEntered on %U\n  %i\n  %a \n")

        ("F" "path" plain (file "f:/task/Note.org" )
         "%?\n  %F")

        ("n" "Note" entry (file "f:/task/Note.org" )
         "* %?\n  %i  %a")

        ("c" "killring" plain (file "f:/task/Note.org" )
         "%?\n  %c  %a")

        ("x" "clipboard" plain (file "f:/task/Note.org" )
         "%?\n  %x  %a")
	))






;; always show images
(setq org-startup-with-inline-images t)

;; There is some room for improvement though. First, you can add the following hook if you don’t want to press this awkward keybinding every time:
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
;; At the same time, we can set the image width to prevent images from becoming too large. I prefer to do it inside a emacs-lisp code block in the same org file:
(setq-local org-image-actual-width '(1024))
;; (require 'org-download)
;; (setq org-download-method 'attach)
(setq package-check-signature nil)



;; 解决 src-block 报错结果颜色显示的问题
(defun display-ansi-colors ()
  (ansi-color-apply-on-region (point-min) (point-max)))
(add-hook 'org-babel-after-execute-hook #'display-ansi-colors)



;; calfw
(require 'calfw)
(require 'calfw-org)



(setq citar-org-roam-note-title-template "${author} - ${title}")


;; ======= provide =======
(provide 'init-org)
