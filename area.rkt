#lang racket

(define (area a b c)
  
      (sqrt ( * (s a b c)  ( - (s a b c) a ) ( - (s a b c) b ) ( - (s a b c) c) ) )   
)

(define (s a b c)
 
  ( / ( + a b c) 2.0)
  
)

(area 6 7 58)