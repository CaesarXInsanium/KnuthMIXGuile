(use-modules (srfi srfi-64)
             ((knuth) #:prefix knuth-)
             (knuth byte))

(test-begin "mixbyte")
(test-equal #t (bitvector? (make-byte #t)))
(test-end "mixbyte")
