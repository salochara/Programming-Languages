(define (quadratic a b c)
  (let
      ([d (- (* b b) (* 4 a c) )  ] )

   )
  (list
   ( / ( + (-b) (sqrt d)) (* 2 a))
   ( / ( - (-b) (sqrt d)) (* 2 a))
   
  )
)
