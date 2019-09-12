#lang racket
#| Function for reversing a list using recursion |#
; Loops are accomplished in Racket using recursion
; The debugger in DrRacket is helpful for understanding how this works

(define (reverseList input)
    (if (empty? input)
        empty
        (append
            (reverseList(cdr input))
            (list (car input))
        )
    )
)           
    
(reverseList '(3 2 6 1))