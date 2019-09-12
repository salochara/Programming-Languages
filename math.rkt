

( define (f x)
   (cond

     [ ( < x -1)                 (+ x 2) ]
     [ ( and ( <= -1 x) (< x 0))         1]
     [    (>= x 0)              ( + (- ( * x x)) 1)]
    )
   
)