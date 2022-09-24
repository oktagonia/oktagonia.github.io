#!/usr/bin/guile -s
!#
(load "stem.scm")
(load "base.scm")
(import (rnrs io ports (6)))

;; Blogging stuff

; date sorting. (Jul 2 2022) > (Ma 2 2022)
(define (date> d1 d2)
  (define *months* 
    '((jan . 1) (feb  .  2) (march .  3) (april .  4)
      (may . 5) (june .  6) (july  .  7) (aug   .  8)
      (sep . 9) (oct  . 10) (nov   . 11) (dec   . 12)))
  (define (month d) (cdr (assoc (car d) *months*)))
  (define (day d) (cadr d))
  (define (year d) (caddr d))
  (cond ((> (year d1) (year d2)) #t)
        ((= (year d1) (year d2))
         (cond ((> (month d1) (month d2)) #t)
               ((= (month d1) (month d2))
                (cond ((> (day d1) (day d2)) #t)
                      ((= (day d1) (day d2)) #t)
                      (else #f))) (else #f))) (else #f)))

(define (metadata file)
  (let* ((f (open-input-file file)) (mstring (get-line f)))
    (set! mstring (get-line f))
    (read (open-input-string mstring))))

(define (blog-posts)
  (define path "/home/kiand/fun/website/site/blog/")
  (define dir (opendir path))
  (let loop ((posts '()) (e (readdir dir)))
    (cond ((eof-object? e) posts)
          ((< (string-length e) 3) (loop posts (readdir dir)))
          ((string=? (string-take-right e 3) ".md")
           (loop 
             (append posts `(,(metadata (string-append path e))))
             (readdir dir)))
          (else (loop posts (readdir dir))))))

(define (Post title date) 
  `((h1 (@ (style "text-align: left; font-size: 20pt;")) ,title)
    ,date (br "")))

(define (post-path post) (caddr post))
(define (post-date post) (cadr post))
(define (post-title post) (car post))

(define (list-posts)
  (define *posts* 
    (sort (blog-posts) 
          (lambda (x y) (date> (post-date x) (post-date y)))))
  (define (format post)
    `(li (p (a (@ (href ,(post-path post)))
               ,(string-append (post-title post) ".")))))
  (let loop ((l '(ul)) (posts *posts*))
    (if (null? posts) l
        (loop (append l (list (format (car posts)))) (cdr posts)))))

(define (read-stdin)
  (let loop ((acc "") (char (read-char)))
    (if (eof-object? char) acc
        (loop (string-append acc (string char))
              (read-char)))))
        
;; dump it all in STDOUT.
; (display (compile-string (read-stdin)))
(generate-html (cadr (command-line)))
