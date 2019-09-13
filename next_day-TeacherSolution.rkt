; NextDay - Teacher Solution

(define (leap? year)
  (cond
    [ ( not (integer? ( / year 4))) #f] ;if (year is not divisible by 4) then (it is a common year)
    [ ( not (integer? ( / year 100))) #t] ;else if (year is not divisible by 100) then (it is a leap year)
    [ ( not (integer? ( / year 400))) #f] ;else if (year is not divisible by 400) then (it is a common year)
    [else #t]                            ;else (it is a leap year)
  )
)

(define (month-days month year)
    (case month
      [(1 3 5 7 8 10 12) 31]
      [(4 6 9 11) 30]
      [(2) (if (leap? year) 29 28)]  
    )
)

(define (next_day date)
    (let* 
        (
            [day(car date)]
            [month(cadr date)]
            [year(caddr date)]
            [max_days (month-days month year)] ; Here, we already know the max days of the month given
        )
        (if (= day max_days) ;Is day equal to max days of the given month? (1)
            (if (= month 12) ; If true (1-True); Is month equal to 12? (2)
                (list 1 1 (+ 1 year)) ; If true, go to the next year (2-True)
                (list 1 (+ 1 month) year); Else, go to the next month (2 False)
            )
            (list (+ 1 day) month year) ; Else, go to next day (1-False)
        )   
    )
)

