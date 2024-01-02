(use-modules (srfi srfi-64)
             (knuth word)
             (knuth byte))

(test-begin "mixword")
;; test that contructor and predicate work as intended
(define a (make-word 0))
(test-assert (word? a))
(test-end "mixword")

(test-begin "alternative-constructions")
(define b (word 0
                (byte 0 1 0 1 0 1)
                (byte 0 1 0 1 0 1)
                (byte 0 1 0 1 0 1)
                (byte 0 1 0 1 0 1)
                (byte 1 0 1 0 1 0)))
(define c (word 0
                (byte 0 1 0 1 0 1)
                (byte 0 1 0 1 0 1)
                (byte 0 1 0 1 0 1)
                (byte 0 1 0 1 0 1)
                (byte 1 0 1 0 1 0)))
(test-end "alternative-constructions")

(test-begin "word-comparison")
(test-assert (word=? b c))
(test-end "word-comparison")

(test-begin "fspec")
(test-equal 11 (fspec 1 3))
(test-equal (cons 1 3) (cepsf 11))
(test-end "fspec")
