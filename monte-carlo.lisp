(defun U ()
  (random 1.0))

(defun E (X &optional (n 1))
  (let ((sum 0.0))
    (loop repeat n
	  do (incf sum (funcall X)))
    (/ sum n)))

(defun I ()
  (cond
    ((<= (+ (expt (- (* (U) 2) 1) 2) (expt (- (* (U) 2) 1) 2)) 1) 1)
    (t 0)))

(defun E-PI (&optional (n 1))
  (* (E #'I n) 4))

(E-PI 10000)
