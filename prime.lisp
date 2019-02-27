(defun is-prime (n)
  (let ((result t))
    (loop for i from 2 to (- n 1) do
      (setq result (and result (not (= 0 (mod n i))))))
    result))
