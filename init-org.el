;; init file for org-mode
(require 'org)
;;---------bullets------------
(require 'org-bullets)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)
(setq header-line-format "    ")
(setq line-spacing 0.2)
(toggle-truncate-lines t)
(custom-set-faces
 '(header-line ((default :background "#161a1f")))
)
			   ))

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





(general-define-key
 :keymaps 'org-mode-map
 "C-j" 'org-next-visible-heading
 "C-k" 'org-previous-visible-heading
 "C-S-j" (lambda()(interactive)(progn (search-forward "#+begin_src" nil t)(next-line)))
 "C-S-k" (lambda()(interactive)(progn (search-backward "#+begin_src" nil t)
				      (search-backward "#+begin_src" nil t)
				      (next-line)))
 )



(define-key org-mode-map (kbd "C-<return>") 'org-babel-execute-src-block)
(define-key org-mode-map (kbd "S-<return>") 'org-insert-heading-respect-content)
(evil-define-key '('normal 'visual) org-mode-map (kbd ",") 'hydra-org/body)



(defhydra hydra-org(:exit t)
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
  ("p" org-property/body "property")
;; v show
  ("v" org-show/body "vision")
;; e envirenment
  ("e" org-env/body "environments")
;;sort
    ("`" org-sort "sort")
;;src-code
    ("C" org-src/body "src")
;;edit-special
    ("'" org-edit-special "org special edit")
;;mode-setting
    ("m" org-mode-config/body "org mode config")
;;org-open
    ("o" org-open-at-point "org open at point")
  )

(defhydra org-mode-config(:exit t)
("n" org-num-face "orgNum")
  )

(defhydra org-subtree(:exit t)
("x" org-cut-subtree "cut")
("c" org-copy-subtree "copy")
("p" org-paste-subtree "paste")
  )

(defhydra org-env(:exit t)
("w" pyvenv-workon "pyvenv-workon")
("R" (lambda()(interactive)(org-babel-jupyter-aliases-from-kernelspecs)) "JupyterAliase")
  )

(defhydra org-narrow(:exit t)
("b" org-narrow-to-block "nBlock")
("s" org-narrow-to-subtree "nSubtree")
("w" widen "widen")
  )

(defhydra org-time(:exit t)
("." org-time-stamp "stamp")
("!" org-time-stamp-inactive "stampInactive")
("c" org-date-from-calendar "dateFromCalendar")
("C" org-date-goto-calendar "dateGotoCalendar")
;; ("o" org-open-at-point) ;;what is this?
("r" org-evaluate-time-range "tameRange")
("i" org-clock-in "clockIn")
("o" org-clock-out "clockOut")
("l" org-clock-in-last "clockLast")
;; (".c" org-evaluate-time-range)
("q" org-clock-cancel "clockCancel")
("v" org-clock-display "clockDisplay")
)


(defhydra org-todo(:exit t)
 ("t" org-todo "todo")
 ("vt" org-show-todo-tree "showTodoTree")
 ;; ("\\l" org-todo-list)
 ("i" org-insert-todo-heading "insert")
 )


(defhydra org-link(:exit t)
 ;; you need to use org-store-link
 ("i" org-insert-link "insert")
 ("j" org-next-link "next")
 ("k" org-previous-link "previous")
 )



(defhydra org-agenda(:exit t)
 ("i" org-agenda-file-to-front "insertTocalenda")
 ("d" org-remove-file "DeleteTocalenda")
 ;; org switchb 应该是 global
 ;; ("a<TAB>" 'org-switchb)
 ;; ("" 'universal-argument)
 ("s" org-agenda-set-restriction-lock "restriction")
 ("r" org-agenda-remove-restriction-lock "unrestriction")
 )


(defhydra org-Sparsetree(:exit t)
 ;; -------Sparse trees--------
 ("/" org-sparse-tree "sparseTree")
 ("m" org-match-sparse-tree "MatchSparse")
 ("o" org-occur "occur")
 ("j" next-error "nextError")
 ("k" previous-error "prviousError")
 )


(defhydra org-image(:exit t)
 ("t" org-toggle-inline-images "toggleImage")
 )


(defhydra org-table(:exit t)
 ;; -------table--------
 ("i" org-table-create-or-convert-from-region "insert")
 ("r" org-table-align "align")
 ("<SPC>" org-table-blank-field "blank")
 ("c" org-table-copy-region "copy")
 ("x" org-table-cut-region "cut")
 ("p" org-table-paste-rectangle "paste")
 ("`" org-table-edit-field "edit")
 )


(defhydra org-deadline-date(:exit t)
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
("i" org-set-tags-command "insert")
("s" org-tags-view "view")
 )


(defhydra org-property(:exit t)
 ;; -------property--------
 ("i" org-set-property "insert")
 ("d" org-delete-property "delete")
 ("D" org-delete-property-globally "deleteGlobally")
 )



(defhydra org-show(:exit t)
 ;; -------show something--------
 ("a" outline-show-all "showAll")
 ("1" org-set-startup-visibility "startupVisibility")
 ;; ("sc" outline-show-children)
 ("2" org-tree-to-indirect-buffer "indirectBuffer")
 )



(defhydra org-src(:exit t)
 ("ij" jupyter-org-insert-src-block "insert")
 ("s" org-edit-special "edit-special")
 )





;; --------- todo list -----------
(setq org-todo-keywords
      '(
	(sequence "TODO" "DELAY" "|" "CHANGE" "DONE" "GiveUp" )
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
   (jupyter . t)))

;; (org-babel-jupyter-override-src-block "python")

;; (setq org-image-actual-width nil)
;; 关于org src 模式导出是不是前面要有空格
;; (setq org-src-preserve-indentation t)

 	
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

(custom-set-faces
 '(header-line ((default :background "#161a1f")))
 '(org-level-1 ((t :height 1.3 :weight normal :foreground "light sky blue")))
 '(org-level-2 ((t :height 1.2 :weight normal :foreground "pale turquoise")))
 '(org-level-3 ((t :height 1.1 :weight bold :foreground "salmon")))
 '(org-level-4 ((t :height 1.1 :foreground "DarkTurquoise")))
 '(org-level-5 ((t :height 1.1 :foreground "medium aquamarine")))
 '(org-level-6 ((t :height 1.1 :foreground "indian red")))
 '(org-level-6 ((t :height 1.1 :foreground "violet")))
 ;; '(org-blank-before-new-entry ((heading . always) (plain-list-item . auto)))
 )

;; (setq org-cycle-separator-lines 0)

;; org-roam
;; 需要在环境变量当中添加下面的文件夹
(add-to-list 'exec-path "c:/HOME/bin/sqlite-tools-win32-x86-3350500/sqlite3.exe")
(add-hook 'after-init-hook 'org-roam-mode)
;;; Define key bindings for Org-roam
(global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") #'org-roam-insert)
(global-set-key (kbd "C-c n /") #'org-roam-find-file)
(global-set-key (kbd "C-c n b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") #'org-roam-find-directory)

;;; Recommendation for Windows users for performance
;;; https://github.com/org-roam/org-roam/issues/1289#issuecomment-744046148
(setq org-roam-db-update-method 'immediate)

;;; Let's also assign C-z to undo here
;; (global-set-key (kbd "C-S-z") 'undo) ;Emacs default is bound to hide Emacs.


;; ======= provide =======
(provide 'init-org)
