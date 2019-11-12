#|
Example of using semaphores to control threads
Gilberto Echeverria
11/11/2019
|#

#lang racket

; Create a new semaphore
(define semaphore-out (make-semaphore 1))

; Function to create new threads
(define (make-thread name)
    (thread (lambda ()
             (let loop
                ([n 0])
                (if (< n 10)
                    ; true
                    (begin
                        (sleep (random))
                        (semaphore-wait semaphore-out)
                        ; Critical section
                        (printf "Thread: ~a | Counter: ~a\n" name n)
                        ;(printf "~a_~a " name n)
                        (semaphore-post semaphore-out)
                        (loop (+ n 1)))
                    ; false
                    (printf "Thread ~a finishing\n" name))))))

; Main function to test
(define (main)
    (printf "MAIN THREAD START\n")
    (define threads (map make-thread '(Thread_A Thread_B Thread_C)))
    ; Apply a function to each element in a list, without results
    (for-each thread-wait threads)
    (printf "MAIN THREAD FINISHING\n"))