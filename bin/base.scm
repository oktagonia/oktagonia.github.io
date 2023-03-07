(import (rnrs hashtables (6)))

;; Counters. Inspired by LaTeX's protocol.
(define *counters* (make-eq-hashtable))
(define (counter-ref counter) 
  (hashtable-ref *counters* counter "COUNTER-REF: counter not found."))
(define (reset-counter! counter) (hashtable-set! *counters* counter 0))
(define (step-counter! counter) 
  (hashtable-set! *counters* counter (1+ (counter-ref counter))))

(define (make-counter! name start)
  (hashtable-set! *counters* name start)
  (lambda (body)
    (step-counter! name)
    `(p (b ,(string-append 
              (symbol->string name) " "
              (number->string (counter-ref name)) "."))
        ,body)))

; Some useful academic counters.
(define Definition  (make-counter! 'Definition   0))
(define Theorem     (make-counter! 'Theorem      0))
(define Observation (make-counter! 'Observation  0))
(define Proposition (make-counter! 'Proposition  0))

;; Footnotes
;; Note makes a footnote, Footnote displays the footnotes.
(define *footnotes* '())
(define (Note str) 
  (set! *footnotes* (append *footnotes* (list str))) 
 `(a (@ (href ,(string-append "#footnote-" 
                (number->string (length *footnotes*)))))
     (sup 
       (@ (id ,(string-append "source-" (number->string (length *footnotes*)))))
       ,(string-append "[" (number->string (length *footnotes*)) "]"))))

(define (Footnotes)
  (define (format note c) 
    `(li (p (@ (id ,(string-append "footnote-" (number->string c)))) ,note)))
  `((p (b "Notes") )
    ,(let loop ((l '(ol)) (notes *footnotes*) (c 1))
       (if (null? notes) l
         (loop (append l (list (format (car notes) c)))
               (cdr notes) (+ c 1))))))

(define (align-img img dir)
  `(img (@ (src ,img) (style "max-width: 50%") (align ,dir))))
