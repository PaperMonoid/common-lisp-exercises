(loop for i in '(ichi ni san) do (print i))

(loop for x from 1 to 100
      for y = (* x 2)
      collect y)

(loop repeat 10 do (format t "ok"))
