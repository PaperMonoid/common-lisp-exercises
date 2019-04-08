(defvar *x* 1.0)

(defun multiplicative-congruential-random
    (&optional (a 125.0) (m 255.0))
  (progn
    (setq *x* (* (mod (* a *x*) m) 1.0))
    (/ *x* m)))

(loop repeat 10
  do (print (multiplicative-congruential-random 3.0 255.0)))
