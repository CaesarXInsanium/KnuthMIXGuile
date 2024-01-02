;; (use-modules (srfi srfi-1))

(define-module (knuth byte))

;; TODO: might have to change the internal representation of bytes
;; constructors
(define (bit? x) (or (= 1 x) (= 0 x)))

(define (byte a b c d e f)
  (vector a b c d e f))

(define (string->bits a) (error "Not Implemented!"))

(define (byte . a)
  (if (and (= 6 (length a))
           (string? (car a)))
      (string->bits (car a))
      (list->vector a)))

(define (make-byte init)
  (if (bit? init)
      (make-vector 6 init)
      (error (format #f "~s is not a 0 or 1~%" init))))


;; predicates
(define (byte? a)
  (and (vector? a)
       (= 6 (vector-length a))
       (= 6 (length (filter (lambda (x) (bit? x))
                            (vector->list a))))))
(use-modules (srfi srfi-43))
(define (byte=? a b)
  (and (byte? a)
       (byte? b)
       (vector= = a b)))


;; getters
(define (bit0 b) (vector-ref b 0))
(define (bit1 b) (vector-ref b 1))
(define (bit2 b) (vector-ref b 2))
(define (bit3 b) (vector-ref b 3))
(define (bit4 b) (vector-ref b 4))
(define (bit5 b) (vector-ref b 5))


(export make-byte
        byte
        byte?
        byte=?
        bit0
        bit1
        bit2
        bit3
        bit4
        bit5)
