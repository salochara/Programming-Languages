(define (leap? year)
   ( if     ( integer?  ( remainder ( (integer? ( remainder( year 4)) ) ) 100 ) )  (display "no") (display "maybe")) 
)