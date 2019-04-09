(defclass Box ()
  ((length :reader get-length :writer set-length)
   (breadth :reader get-breadth :writer set-breadth)
   (height :reader get-height :writer set-height)))

(make-instance 'Box)
