(require "cl-ppcre")

(defun continue? (string)
  (cl-ppcre:scan "(?i)(y|ye|yes)" string))

(defun parse-move (string)
  (cond ((cl-ppcre:scan "(?i)(r|rock)" string) 'ROCK)
	((cl-ppcre:scan "(?i)(p|paper)" string) 'PAPER)
	(t 'SCISSORS)))

(defun get-ai-move ()
  (let ((pick (random 3)))
    (cond ((= pick 1) 'ROCK)
	  ((= pick 2) 'PAPER)
	  (t 'SCISSORS))))

(defun beats? (a b)
  (or (and (equal 'ROCK a) (equal 'SCISSORS b))
      (and (equal 'PAPER a) (equal 'ROCK b))
      (and (equal 'SCISSORS a) (equal 'PAPER b))))

(defun get-winner (a b)
  (cond ((beats? a b) "YOU WIN!")
	((beats? b a) "YOU LOSE!")
	(t "IT'S A TIE")))

(defun prompt ()
  (loop
    (format *query-io* "Your turn [R/P/S]: ")
    (force-output)
    (let ((player-move (parse-move (read-line *query-io*)))
	  (ai-move (get-ai-move)))
      (format *query-io* "AI PLAYED ~a, ~a~%"
	      ai-move (get-winner player-move ai-move))
      (force-output))
    (format *query-io* "CONTINUE [y/N]: ")
    (force-output)
    (when (null (continue? (read-line *query-io*))) (return))))
