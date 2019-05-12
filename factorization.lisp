(defun factorize (n &optional (i 2) (limit n))
  (if (< i limit)
      (if (zerop (mod n i))
	  i
	  (factorize n (+ i 1) (floor (/ n i))))
      n))

(factorize (* 15485863 32452843))
