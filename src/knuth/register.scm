(define-module (knuth register))

;;; General Purpose registers
;;; this is really just a single word, treated as a register

(define (make-greg init)
  (make-word init))

;;; Predicates
(define (greg? reg)
  (word? reg))

(define (greg=? a b)
  (word=? a b))


;; Two Byte registers
(define (make-treg init)
  (cons (make-byte init)
        (make-byte init)))

;;; Predicates
(define (treg? reg)
  (and (byte? (car reg))
       (byte? (cdr reg))))

(define (treg=? a b)
  (and (treg? a)
       (treg? b)
       (byte=? (car a) (car b))
       (byte=? (cdr a) (cdr b))))

(define (reg-high a) (car a))
(define (reg-low a) (cdr a))

