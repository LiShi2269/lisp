(require 'flx-ido)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;; (ido-mode 1)
(setq ido-separator "\n")
(setq ido-use-faces t)
;; ------ ffap -------
;; Find File At Point, also known generally as “ffap”, is an intelligent (well, when I say that, I mean it uses simple heuristics to infer the context at point) system for opening files, and URLs.
;; Some people hate it, and personally I tolerate it. It gets in the way sometimes and when it does it’s really annoying, but mostly it helps me so it gets to stay. It works in surprisingly many contexts like inferring the filepath of a library in an elisp (require 'foobar) form.
;; This will make Ido guess the context, which is what I use.
(setq ido-use-filename-at-point 'guess)


(defun uuid ()
  (format "%08x-%08x-%08x-%08x"
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 4))))
(benchmark-run 1
  (let ((cache (flx-make-filename-cache)))
    (dolist (i (number-sequence 0 10000))
      (flx-process-cache (uuid) cache))))





(provide 'init-ido)
