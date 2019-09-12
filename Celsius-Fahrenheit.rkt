
; F->C and C->F 

(define ( F->C number)
  ( / (- number 32) 1.8 )
)

( define ( C->F number)
   ( + ( * number  1.8 ) 32)
)


