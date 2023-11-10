


;; init file for org-mode
(require 'org)
;;---------bullets------------
(require 'org-bullets)
(add-hook 'org-mode-hook 'rainbow-delimiters-mode-enable)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)
(openwith-mode 1)
;; (setq header-line-format "    ")
(setq line-spacing 0.2)
(toggle-truncate-lines t)
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


;; citar 如果只是在org-mode中使用的话
(use-package citar
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup)
  :no-require
  :custom
  (org-cite-global-bibliography '("~/zotero/我的文库.bib"))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  ;; optional: org-cite-insert is also bound to C-c C-x C-@
  ;; :bind
  ;; (:map org-mode-map :package org ("C-c b" . #'org-cite-insert))
  )

(setq citar-library-path '("/mnt/f/zoteroAttachments/myAllPDF/"))
(setq bibtex-completion-pdf-field "file")
;; rich UI
 (setq citar-templates
      '((main . "${author editor:30%sn}     ${date year issued:4}     ${title:48}")
        (suffix . "          ${=key= id:15}    ${=type=:12}    ${tags keywords:*}")
        (preview . "${author editor:%etal} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
        (note . "Notes on ${author editor:%etal}, ${title}")))


(require 'pdf-tools)
(pdf-tools-install)
(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))




(use-package org-noter
  :config
  ;; Your org-noter config ........
  (require 'org-noter-pdftools))

(use-package org-noter-pdftools
  :after org-noter
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freepointer-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))


















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

;; (defun my-C-j()
;;   (interactive)
;;   (cond ( (org-in-src-block-p) (org-babel-next-src-block))
;; 	(t (org-next-visible-heading 1))
;; 	))

;; (defun my-C-k()
;;   (interactive)
;;   (cond ( (org-in-src-block-p) (org-babel-previous-src-block))
;; 	(t (org-previous-visible-heading 1))
;; 	))


(defun my-C-turn()
  (interactive)
  (cond ( (org-in-src-block-p) (progn (org-babel-execute-src-block-maybe)(org-babel-next-src-block)))
	(t (org-insert-heading-respect-content))
	))
  


;; (evil-define-key '('normal 'visual) org-mode-map (kbd ",") 'hydra-org/body)



(defhydra hydra-org(:exit t :columns 5)
  "org"
  ("o" org-open-at-point "openwith")
  ("c" org-citarr/body "citar")
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
;;ID
    ("I" org-id-get-create "orgID")

    ("b" my-org-bold-line "bold")
    ("_" my-org-_-line "__")
    ("/" my-org-/-line "//")
    ("+" my-org-+-line "++")
  )

(defun my-org-bold-line()(interactive)
       (progn   (evil-normal-state)
		(evil-first-non-blank)
		(insert "*")
		(whitespace-cleanup)
		(evil-end-of-line)
		(evil-append 1)
		(insert "*")
		(evil-normal-state)
		(evil-next-line)
       ))

(defun my-org-/-line()(interactive)
       (progn   (evil-normal-state)
		(evil-first-non-blank)
		(insert "/")
		(whitespace-cleanup)
		(evil-end-of-line)
		(evil-append 1)
		(insert "/")
		(evil-normal-state)
		(evil-next-line)
       ))

(defun my-org-+-line()(interactive)
       (progn   (evil-normal-state)
		(evil-first-non-blank)
		(insert "+")
		(whitespace-cleanup)
		(evil-end-of-line)
		(evil-append 1)
		(insert "+")
		(evil-normal-state)
		(evil-next-line)
       ))

(defun my-org-_-line()(interactive)
       (progn   (evil-normal-state)
		(evil-first-non-blank)
		(insert "_")
		(whitespace-cleanup)
		(evil-end-of-line)
		(evil-append 1)
		(insert "_")
		(evil-normal-state)
		(evil-next-line)
       ))

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
("c" org-copy-subtree "copy")
("p" org-paste-subtree "paste")
("$" org-archive-subtree "Archive")
("P" org-property/body "property")
("D" org-deadline-date/body "deadline")
("e" org-babel-execute-subtree "Execute")
("s" org-subtree/body "self")
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
("c" org-date-from-calendar "dateFromCalendar")
("C" org-date-goto-calendar "dateGotoCalendar")
;; ("o" org-open-at-point) ;;what is this?
("r" org-evaluate-time-range "tameRange")
("i" org-clock-in "clockIn")
("o" org-clock-out "clockOut")
("l" org-clock-in-last "clockLast")
("t" insert-now-timestamp "nowTime")
("q" org-clock-cancel "clockCancel")
("v" org-clock-display "clockDisplay")
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
("(" my-org-add-print "add-print()")
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
 '(org-level-1 ((t :height 1.1 :weight bold :foreground "light sky blue")))
 '(org-level-2 ((t :height 1.1 :weight normal :foreground "pale turquoise")))
 '(org-level-3 ((t :height 1.1 :weight thin :foreground "salmon")))
 '(org-level-4 ((t :height 1.1 :foreground "DarkTurquoise")))
 '(org-level-5 ((t :height 1.1 :foreground "medium aquamarine")))
 '(org-level-6 ((t :height 1.1 :foreground "indian red")))
 '(org-level-7 ((t :height 1.1 :foreground "violet")))
 '(org-headline-done ((t :weight normal :foreground "SeaGreen1")))
 '(org-headline-todo ((t :weight normal :foreground "HotPink")))
 )

;; (setq org-cycle-separator-lines 0)





;; -------------- org-roam ---------------------
;; 需要在环境变量当中添加下面的文件夹
;; (add-to-list 'exec-path "c:/HOME/sqlite/sqlite3.exe")
;; (add-to-list 'exec-path "c:/HOME/sqlite")
;; (add-to-list 'exec-path "c:/HOME/msys64/usr/bin/cc.exe")
;; (add-to-list 'exec-path "c:/HOME/msys64/usr/bin")
(add-hook 'after-init-hook 'org-roam-mode)


(setq org-roam-directory "/mnt/f/org-roam/")
(org-roam-db-autosync-mode)
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

(use-package websocket
    :after org-roam)

(use-package org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; 用chrome打开
;; sudo apt install graphviz 先安装这个
;; (setq org-roam-graph-executable "neato")
;; (setq org-roam-graph-executable "neato")
;; (setq org-roam-graph-viewer "/usr/bin/google-chrome-stable")
;; (setq org-roam-graph-viewer nil)


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






;; ======= provide =======
(provide 'init-org)
