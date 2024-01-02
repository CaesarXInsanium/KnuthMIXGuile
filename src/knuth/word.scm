(define-module (knuth word))
(use-modules (knuth byte))

;; Constructors

(define-public (make-word init)
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

(define (word-fspec w int)
  (let ((f (cepsf int)))
    (vector-copy w (car f) (cdr f))))

;; Predicates
(define (word? w)
  (and (vector? w)
       (= (vector-length w) 6)
       (number? (word-sign w))))

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
        fspec
        cepsf
        word-sign
        bytea
        byteb
        bytec
        byted
        bytee)
