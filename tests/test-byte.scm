(use-modules (srfi srfi-64)
             (knuth byte))

;; testing internal representation of bytes
(test-begin "mixbyte")
(define a (make-byte 1))
;; is this a byte object?
(test-assert (byte? a))

(test-end "mixbyte")
;; bits have to be defined in this specific syntax
(test-begin "selector")
(define b (byte 0 1 0 1 0 1))

(test-assert (byte? b))

(test-equal 0 (bit0 b))
(test-equal 1 (bit1 b))
(test-equal 0 (bit2 b))
(test-equal 1 (bit3 b))
(test-equal 0 (bit4 b))
(test-equal 1 (bit5 b))
(test-end "selector")

(test-begin "compare")
(define c (byte 1 0 0 0 1 1))
(define d (byte 1 0 0 0 1 1))
(test-assert (byte=? c d))
(test-end "compare")

