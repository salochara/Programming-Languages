#|
    First example of threads using Racket
|#

#lang racket


(define (main)
    (display "Main thread\n")
    (thread (lambda () (printf "Thread 1 \n"))) ; With (thread), there is a new thread running
    (thread (lambda () (printf "Thread 2 \n"))) ; lambda as anonymous function
    (thread (lambda () (printf "Thread 3 \n")))
    (display "Main finishing\n")
)