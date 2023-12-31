(use-modules (srfi srfi-64)
             (knuth))

(test-begin "hello")
(test-equal 1 (hello-world))
(test-end "hello")

(test-begin "add")
(test-equal 1 (add 0))
(test-end "add")
