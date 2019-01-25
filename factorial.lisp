(defun factorial (n)
  (if (> n 1) (* n (factorial (- n 1))) 1))


(defun factorial-loop (n)
  (let ((result 1))
    (dotimes (i n) (setq result (* result (+ i 1))))
    result))
