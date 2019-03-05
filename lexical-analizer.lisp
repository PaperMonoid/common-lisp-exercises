(require "cl-ppcre")

(defun is-variable? (string)
  (cl-ppcre:scan "^[A-Za-z][A-Za-z0-9]*$" string))

(defun is-number? (string)
  (cl-ppcre:scan "^([\+\-])?[0-9]+(.[0-9]+)?((e|E)([\+\-])?[0-9]+)?$" string))

(defun is-email? (string)
  (cl-ppcre:scan "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$" string))

(defun is-url? (string)
  (cl-ppcre:scan "^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]$" string))

(defun classify-lexeme (string)
  (cond ((is-variable? string)  (cons 'VARIABLE string))
	((is-number? string) (cons 'NUMBER string))
	((is-email? string) (cons 'EMAIL string))
	((is-url? string) (cons 'URL string))
	(t (cons 'NONE string))))

(let ((in (open "lexical-analizer-test.txt" :if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
         while line do (format t "~a~%" (classify-lexeme line)))
    (close in)))
