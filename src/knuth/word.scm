(define-module (knuth word))
(use-modules (knuth byte))

;; Constructors

(define (make-word init)
  (vector init
          (make-byte init)
          (make-byte init)
          (make-byte init)
          (make-byte init)
          (make-byte init)))

(define (word sign a b c d e)
  (vector sign a b c d e))

;; Selectors
(define (word-sign b) (vector-ref b 0))
(define (bytea b) (vector-ref b 1))
(define (byteb b) (vector-ref b 2))
(define (bytec b) (vector-ref b 3))
(define (byted b) (vector-ref b 4))
(define (bytee b) (vector-ref b 5))

(define (word-fspec))

;; l i slow byte and r high byte
(define (fspec l r) (+ (* 8 l) r))

(define (cepsf f)
  (car (filter (lambda (p) (and  (integer? (cdr p))
                                  (integer? (car p))))
                (map (lambda (r)
                       (let* ((w (- f r))
                              (l (/ w 8)))
                         (cons l r)))
                     (list 1 2 3 4 5 6)))))

;; Predicates
(define (word? word)
  (and (vector? word)
       (= (vector-length word) 6)
       (number? (word-sign word))))

(define (word=? a b)
  (and (word? a)
       (word? b)
       (= (word-sign a) (word-sign b))
       (byte=? (bytea a) (bytea b))
       (byte=? (byteb a) (byteb b))
       (byte=? (bytec a) (bytec b))
       (byte=? (bytee a) (bytee b))
       (byte=? (bytee a) (bytee b))))

(export make-word
        word
        word?
        word=?
        word-sign
        bytea
        byteb
        bytec
        byted
        bytee)
