(defun fizz-buzz (n)
  (let ((divisible-by-3 (= 0 (mod n 3)))
	(divisible-by-5 (= 0 (mod n 5))))
    (cond
      ((and divisible-by-3 divisible-by-5) '(FIZZ BUZZ))
      (divisible-by-3 'FIZZ)
      (divisible-by-5 'BUZZ)
      (t n))))
