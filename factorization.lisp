(defun factorize (n)
  (let ((limit n))
    (loop for i from 2 to limit
       do (if (zerop (mod n i))
	      (return i)
	      (setq limit (floor (/ n i)))))))

(factorize (* 15485863 32452843))
