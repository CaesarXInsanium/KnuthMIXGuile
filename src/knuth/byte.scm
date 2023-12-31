(define-module (knuth byte)
  #:export (make-byte))

(define (make-byte init)
  (make-bitvector 6 init))
