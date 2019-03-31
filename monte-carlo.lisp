(defun U (inferior superior)
  (+ inferior (random (- superior inferior))))

(defun E-PI (&optional (n 10000))
    (let ((i 0.0))
      (loop repeat n
	    do (when (<= (+ (expt (U -1.0 1.0) 2.0) (expt (U -1.0 1.0) 2.0)) 1.0)
		 (incf i 1.0)))
      (* (/ i n) 4.0)))
