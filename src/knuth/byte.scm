;; designed to be prefixed with MIX:
(define-module (knuth byte))
(use-modules (srfi srfi-60))

;; TODO: might have to change the internal representation of bytes
;; now i have to revert these changes, because they work now
;; constructors
(define (zero-or-one a) (or (= 1 a) (= 0 a)))
(define bit? (lambda (b) (or (boolean? b) (zero-or-one b))))

(define (string->bits a)
  (list->bitvector (map (lambda (d)
                          (char=? d #\1))
                        (string->list a))))

(define (byte b)
  (cond ((string? b) (string->bits b))
        ((and (bitvector? b) (= 6 (bitvector-length b))) b)
        (else (error (format #f "Incorrectly sized bitvector: bt ~s len ~s ~%" b (bitvector-length b))))))

;; init is a boolean
(define (make-byte init)
  (make-bitvector 6 init))

;; predicates
(define (byte? a)
  (format (current-output-port) "Bitvector: (~s)~%" a)
  (and (bitvector? a)
       (= 6 (bitvector-length a))))

(define (byte=? a b)
  (= (list->integer (bitvector->list a))
     (list->integer (bitvector->list b))))


;; getters
(define (bit0 b) (bitvector-bit-set? b 0))
(define (bit1 b) (bitvector-bit-set? b 1))
(define (bit2 b) (bitvector-bit-set? b 2))
(define (bit3 b) (bitvector-bit-set? b 3))
(define (bit4 b) (bitvector-bit-set? b 4))
(define (bit5 b) (bitvector-bit-set? b 5))


;;; TODO
;; bit shift, move to instructions section
;; boolean operators

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
