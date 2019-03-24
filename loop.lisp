(loop for i in '(ichi ni san)
      do (print i))

(loop for x from 1 to 100
      for y = (* x 2)
      collect y)

(loop for (a b) in '((x 1) (y 2) (z 3))
      collect (list b a) )

(loop repeat 10 do (format t "ok"))

(dolist (item '(ichi ni san))
  (print item))
