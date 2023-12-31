(use-modules (srfi srfi-64)
             ((knuth) #:prefix knuth-))

(test-begin "test")
(test-equal 1 (knuth-hello-world))
(test-equal 1 (knuth-add 0))
(test-end "test")
