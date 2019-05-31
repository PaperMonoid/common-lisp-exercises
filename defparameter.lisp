(defparameter *p* 1)
(constantp '*p*)
(setq *p* 2)
(defparameter *p* 3)
*p*
