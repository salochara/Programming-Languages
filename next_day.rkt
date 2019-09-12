#|  
Salomón Charabati
Programming Languages
Next day program

General note, for accesing members of list:
(first date) = day
(second date) = month
(last date) = year
|#


; Leap year alrgoithm
; Algorith according to https://en.wikipedia.org/wiki/Leap_year
(define (leap? year)
  (cond
    [ ( not (integer? ( / year 4))) #f] ;if (year is not divisible by 4) then (it is a common year)
    [ ( not (integer? ( / year 100))) #t] ;else if (year is not divisible by 100) then (it is a leap year)
    [ ( not (integer? ( / year 400))) #f] ;else if (year is not divisible by 400) then (it is a common year)
    [else #t]                            ;else (it is a leap year)
  )
)

; Function to determine the numbers of days in a month
( define (days monthNumber year)
   (cond
     [ (or  (= monthNumber 1) (= monthNumber 3) (= monthNumber 5) (= monthNumber 7) (= monthNumber 8) (= monthNumber 10) (= monthNumber 12)  )  31]
     [ (= monthNumber 2) (if (leap? year) 29 28 )]
     [ (or (= monthNumber 4) (= monthNumber 6) (= monthNumber 9) (= monthNumber 11) ) 30]
   )
)

; Function for regular next day. Day less than 30
(define (one_more_day date) 
  ( list
      ( + (first date) 1) (second date) (last date)
   )
)

; Function for checking if a month has 31 days
(define (full_month date)
  (if (= (days (second date) (last date)) 31) ; If the month has 31 days
      (list 31 (second date) (last date))          ; Go to 31-month-year
      (list 1 (+ (second date) 1) (last date)  )       ; Else, go to the next month
   )
)

; Function for month 2. It checks if it's a leap year with function leap?
(define (leap_month date)
    ( if( leap? (last date))  ; Is it a leap year?
         (list 29 (second date) (last date)) ; If true, return as list 29-month-year
         (list 1 3 (last date))  ; Else, 1-3-year
         )                
)

; Main function. Checks for conditionals and calls functions to execute. 
(define (next_day date)
  (cond
    [  (= (second date) 2)  (leap_month date)] ; If the month is 2
    [(and (= (first date) 31) (= (second date) 12)) (list  1 1 (+ (last date) 1) )]; For passing to next year
    [  (= (first date) 31  ) (list 1 (+(second date) 1) (last date))] ; For going to next month from day 31. It directly returns a list
    [  (= (first date) 30) (full_month date)] ; For going to 31 if the month has 31 days, else go to next month 
    [(< (first date) 30) (one_more_day date)]; For adding +1 to day only
    )
)


  






