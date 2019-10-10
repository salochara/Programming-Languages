; Quadratic Equation
; Programming Languages Course
; Salomón Charabati
#lang racket

(define (quadratic a b c)
           
  (if (= a 0) ; Special case when a = 0
      ( - ( / c b))
   ; Returns a list with both solutions
      ( list
        ( /   ( + (- b) (sqrt  ( - ( * b b ) ( * 4 a c) )))   ( * 2 a) )
        ( /   ( - (- b) (sqrt  ( - ( * b b ) ( * 4 a c) )))   ( * 2 a) )
      )
  )
)