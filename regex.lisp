(require "cl-ppcre")

(defun continue? (string)
  (cl-ppcre:scan "(?i)(y|ye|yes)" string))

(defun is-variable? (string)
  (cl-ppcre:scan "^[A-Za-z][A-Za-z0-9]*$" string))

(defun is-number? (string)
  (cl-ppcre:scan "^([\+\-])?[0-9]+(.[0-9]+)?((e|E)([\+\-])?[0-9]+)?$" string))

(defun classify-lexeme (string)
  (cond ((is-variable? string) 'VARIABLE)
	((is-number? string) 'NUMBER)
	(t 'NONE)))

(defun prompt ()
  (loop
    (format *query-io* "LEXEME: ")
    (force-output)
    (format *query-io* "~a~%" (classify-lexeme (read-line *query-io*)))
    (format *query-io* "CONTINUE [y/N]: ")
    (force-output)
    (when (null (continue? (read-line *query-io*))) (return))))
