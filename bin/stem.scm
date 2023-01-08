(import (rnrs io ports (6)))
(use-modules (ice-9 regex))

(define (block? expr) (symbol? (car expr)))
(define (tagged-block? expr)
  (and (block? expr) (if (list? (cadr expr)) (eq? (caadr expr) '@) #f)))

(define (compile expr)
  (cond ((string? expr) expr)
        ((tagged-block? expr) (compile-block (car expr) (cadr expr) (cddr expr)))
        ((block? expr) (compile-block (car expr) '(@) (cdr expr)))
        (else (compile-sentence expr))))

(define (compile-tag tag-info)
  (if (null? tag-info) ""
      (let ((var (symbol->string (caar tag-info))) 
            (val (string-append "\"" (cadar tag-info) "\"")))
        (string-append " " var "=" val (compile-tag (cdr tag-info))))))

(define (compile-block block tag body)
  (let* ((tag-data (compile-tag (cdr tag)))
         (tag-begin (string-append "<" (symbol->string block) tag-data ">"))
         (tag-end (string-append "</" (symbol->string block) ">")))
    (string-append tag-begin (compile-sentence body) tag-end)))

(define (compile-sentence expr)
  (let loop ((acc "") (e expr))
    (cond ((null? e) acc)
          ((= 1 (length e))
           (loop (string-append acc (compile (car e))) (cdr e)))
          (else (loop (string-append acc (compile (car e)) " ") (cdr e))))))

(define (compile-template expr)
  (compile (eval expr (interaction-environment))))

(define *regexp* "\\%\\{([^{}]*)\\}\\%")

(define (find-scheme-expr str)
  (let ((expr (match:substring (string-match *regexp* str))))
    (read (open-input-string (substring expr 2 (- (string-length expr) 2))))))

(define (replace str rx item)
  (let ((interval (vector-ref (string-match rx str) 1)))
    (string-append (substring str 0 (car interval))
                   item
                   (substring str (cdr interval) (string-length str)))))

(define (replace-global str rx proc)
  (let loop ((s str))
    (if (string-contains s "%{")
        (loop (replace s rx (proc s))) s)))

(define (compile-string str) 
  (replace-global str *regexp* 
                  (lambda (x) (compile-template (find-scheme-expr x)))))

(define (compile-file file) 
  (replace-global (get-string-all (open-input-file file)) *regexp* 
                  (lambda (x) (compile-template (find-scheme-expr x)))))

(define (generate-html input)
  (display (compile-file input)))
