;; init file for org-mode

(require 'org)
;;---------bullets------------
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; ------key-map-set-----
(setq org-log-done t)



;; After that, everything will happen automatically. All diary entries including holidays, anniversaries, etc., will be included in the agenda buffer created by Org mode. <SPC>, <TAB>, and <RET> can be used from the agenda buffer to jump to the diary file in order to edit existing diary entries. The i command to insert new entries for the current date works in the agenda buffer, as well as the commands S, M, and C to display Sunrise/Sunset times, show lunar phases and to convert to other calendars, respectively. c can be used to switch back and forth between calendar and agenda.
(setq org-agenda-include-diary t)


;; -------- key setting -----------
(general-define-key
 :keymaps 'org-mode-map
 "C-j" 'org-next-visible-heading
 "C-k" 'org-previous-visible-heading
 "C-<return>" 'org-babel-execute-maybe
 "S-<return>" 'org-insert-heading-respect-content 
 ;; "," 'hydra-org/body
 )


(defhydra hydra-org()
 "

hydra-python

s: show   m: move    x: cut
c: copy   i: insert  n: narrow
p: paste  *: heading S: SparseTree
.: time   \\: ToDo   l: link
a: agenda o: open    r: re 
  

"
;; -------show something--------
("sa" outline-show-all)
("s1" org-set-startup-visibility)
;; ("sc" outline-show-children)
("s2" org-tree-to-indirect-buffer)


;; -------motion--------
("mj" org-forward-heading-same-level)
("mk" org-backward-heading-same-level)
("mu" outline-up-heading)
("mg" org-goto)

;; -------structure--------
("<return>" org-insert-heading-respect-content)
;; -------sbtree--------
("sx" org-cut-subtree)
("sc" org-copy-subtree)
("sp" org-paste-subtree)
;; -------narrow--------
("nb" org-narrow-to-block)
("ns" org-narrow-to-subtree)
("nw" widen)

("*" org-toggle-heading)
("`" org-sort)

;; -------Sparse trees--------
("S/" org-sparse-tree)
("Sm" org-match-sparse-tree)
("So" org-occur)
("Sj" next-error)
("Sk" previous-error)

;; -------drawer--------
("di" org-insert-drawer)

;; -------table--------
("|i" org-table-create-or-convert-from-region)
("|r" org-table-align)
("|<SPC>" org-table-blank-field)
("|c" org-table-copy-region)
("|x" org-table-cut-region)
("|p" org-table-paste-rectangle)
("|`" org-table-edit-field)
  
;; -------link--------
;; you need to use org-store-link
("li" org-insert-link)
("lj" org-next-link)
("lk" org-previous-link)

;; -------tag--------
("Ti" org-set-tags-command)
("Ts" org-tags-view)

;; -------property--------

("pi" org-set-property)
("pd" org-delete-property)
("pD" org-delete-property-globally)


;; -------time & clock--------
(".." org-time-stamp)
(".!" org-time-stamp-inactive)
(".c" org-date-from-calendar)
(".C" org-date-goto-calendar)

("o" org-open-at-point) ;;what is this?

(".y" org-evaluate-time-range)
(".i" org-clock-in)
(".o" org-clock-out)
(".l" org-clock-in-last)
(".c" org-evaluate-time-range)
(".q" org-clock-cancel)
(".s" org-clock-display)
;; -------todo--------
("\\t" org-todo)
("\\st" org-show-todo-tree)
;; ("\\l" org-todo-list)
("\\i" org-insert-todo-heading)
;; 有快捷键，自带好用
;; ("\\l" org-shiftcontrolright)
;; ("\\h" org-shiftcontrolleft)

;; -------deadline & schedule--------
("di" org-deadline)
("ds" org-check-deadlines)
("ss" org-schedule)
("Ds" org-check-before-date)
("As" org-check-After-date)

;; -------Agenda--------
("ai" org-agenda-file-to-front)
("ad" org-remove-file)
;; org switchb 应该是 global
;; ("a<TAB>" 'org-switchb)
;; ("" 'universal-argument)
("as" org-agenda-set-restriction-lock)
("ar" org-agenda-remove-restriction-lock)
    )


;; --------- todo list -----------
(setq org-todo-keywords
      '(
	(sequence "TODO" "DELAY" "CHANGE" "|" "DONE")
	(sequence "one" "two" "three" "four" "five" "|" "DONE")
	(sequence "a" "b" "c" "e" "f" "|" "DONE")
	(sequence "1" "2" "3" "4" "5" "|" "DONE")
	))


;; -------clock--------
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; -------jupyter--------
(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (latex . t)
   (jupyter . t)))




;; ======= provide =======
(provide 'init-org)
