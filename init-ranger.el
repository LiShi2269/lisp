;; ========= keybindings==================
;; Basic Commands
;; Key Binding	Description
;; ?	show basic commands in the minibuffer
;; du	show selected files, file size
;; q / ZZ	close tab or disable (quit) ranger
;; Q / ZQ	disable (quit) ranger
;; C-r	refresh ranger buffer
;; Navigation
;; Key Binding	Description
;; k/up	up
;; j/down	down
;; h/-/left	to parent directory
;; l/RET/right	to selected directory / open file
;; gg	to top
;; G	to bottom
;; <	to previous directory
;; >	to next directory
;; gh	to home directory
;; C-b	scroll ranger window full page up
;; C-f	scroll ranger window full page down
;; K/C-u	scroll ranger window half page up
;; J/C-d	scroll ranger window half page down
;; C-k	scroll preview window up
;; C-j	scroll preview window down
;; [	previous parent directory
;; ]	next parent directory
;; ;M-{	previous marked file / directory
;; ;M-}	next marked file / directory
;; Search for a File / Directory
;; Key Binding	Description
;; f	search for file / directory







;; Copy, Rename/Move or Delete
;; When the copy command is called by pressing ;C, and only a single file or directory is selected. Then a you'll be asked to enter a new name. However when it's called with multiple marked files / directories, then a you'll be asked for the path to the target directory.

;; Key Binding	Description
;; ;C	copy the current/marked file(s) / dir(s)
;; R	rename/move the current/marked file(s) / dir(s)
;; D	delete the current/marked file(s) / dir(s)
;; ;d	flag current file/dir for deletion, and select next
;; ;x	delete flagged file(s) / dir(s)
;; Subdirectories
;; Key Binding	Description
;; I	insert subdirectory from selected folder
;; gk	move to prev subdirectory
;; gj	move to next subdirectory
;; Marking
;; Key Binding	Description
;; t	toggle mark on current file / directory
;; ;m/C-SPC/TAB	mark current file / dir, and select next
;; ;u	unmark current file / dir, and select next
;; ;U	unmark all files
;; v	invert all marks
;; "	mark files (regexp)
;; Sorting
;; Key Binding	Description
;; on	name
;; oN	name (reverse)
;; oe	extension
;; oE	extension (reverse)
;; os	size
;; oS	size (reverse)
;; ot	modified date/time
;; oT	modified date/time (reverse)
;; oc	created date/time
;; oC	created date/time (reverse)
;; zd	sort directories first or last
;; Toggles / Settings
;; Key Binding	Description
;; i	toggle the preview window
;; zh	toggle hidden files (e.g. dotfiles)
;; zi	toggle literal / full-text previews
;; zf	toggle image full-size / fit to window
;; zP	toggle between full ranger / deer-mode
;; zp	toggle file details in deer-mode
;; z-	reduce number of parent windows
;; z+	increase number of parent windows
;; Shell
;; Key Binding	Description
;; !	run shell command on file
;; ;&	run async shell command on file
;; S	eshell popup window
;; Writable Dired Mode
;; WDired mode changes the file listings buffer to editable text. This makes it easier to rename multiple files. Depending on the width of the Emacs frame. It might be useful to toggle off the preview window, by pressing: i. Before starting WDired mode. This leaves more room for editing the file names.

;; Key Binding	Description
;; C-c C-e	start WDired mode
;; C-c C-c/C-x C-s	finish, rename changed file names, exit WDired mode
;; C-c C-k/C-c ESC	abort, reverting any changes
;; C-x C-q	exit, ask to save/revert modified file names
;; Other
;; Key Binding	Description
;; ;+/+	create directory
;; ;=/=	diff: current file and asks for 2nd file
;; ;g	revert current buffer, with file on disk
;; ;k	kill (hide) marked lines, C-r to unhide
;; Mouse
;; Key Binding	Description
;; mouse-1	move to selected directory, or open file and quit ranger
;; mouse-3	move to parent directory





;; ;; ======= ranger =======
(use-package ranger
  :init

(setq ranger-show-hidden t)
(setq ranger-show-literal t)
(setq ranger-parent-depth 2)
(setq ranger-width-parents 0.2)
(setq ranger-max-parent-width 0.3)
(setq ranger-max-preview-size 10)
(setq ranger-dont-show-binary t)
;; ------- delay -------
(setq ranger-footer-delay 0.2)
(setq ranger-preview-delay 0.040)
  )


(provide 'init-ranger)
