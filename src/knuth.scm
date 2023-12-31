(define-module (knuth)
  #:export (hello-world
            add))

(define (hello-word)
  (display "Hello World!")
  (newline))

(define (add a) (+ a 1))
