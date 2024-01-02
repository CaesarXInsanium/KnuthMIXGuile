(define-module (knuth)
  #:export (hello-world
            add))

(define (hello-world)
  (+ 1 0))

(define (add a) (+ a 1))

(define (asm-main args)
  (display args))

(define (vm-main args)
  (display args))
