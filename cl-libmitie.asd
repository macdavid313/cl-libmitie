#|
  This file is a part of cl-libmitie project.
  Copyright (c) 2017 David Gu (macdavid313@gmail.com)
|#

#|
  Author: David Gu (macdavid313@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-libmitie-asd
  (:use :cl :asdf))
(in-package :cl-libmitie-asd)

(defsystem cl-libmitie
  :version "0.1"
  :author "David Gu"
  :license ""
  :depends-on (#:cffi)
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "lispyfy")
                 (:file "libmitie"))))
  :description "The low level binding of libmitie."
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq))))
