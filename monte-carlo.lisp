(defun U ()
  (random 1.0))

(defun avg (X &optional (n 1))
  (let ((sum 0.0))
    (loop repeat n
	  do (incf sum (funcall X)))
    (/ sum n)))

(defun inside-circle? ()
  (cond
    ((<= (+ (expt (- (* (U) 2) 1) 2) (expt (- (* (U) 2) 1) 2)) 1) 1)
    (t 0)))

(defun e-pi (&optional (n 1))
  (* (avg #'inside-circle? n) 4))

(e-pi 10000) ; approximating PI

(defun inside-x? ()
  (let ((x (U))
	(y (U)))
    (cond
      ((<= y x) 1)
      (t 0))))

(defun e-x (&optional (n 1))
  (* (avg #'inside-x? n)))

(e-x 1000) ; approximating integral of y = x

(defun inside-x^2? ()
  (let ((x (U))
	(y (U)))
    (cond
      ((<= y (expt x 2)) 1)
      (t 0))))

(defun e-x^2 (&optional (n 1))
  (* (avg #'inside-x^2? n)))

(e-x^2 1000) ; approximating integral of y = x^2
