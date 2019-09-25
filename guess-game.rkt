(define (guess-game num)
    (display "WELCOME TO THE NUMBER GUESS GAME \n")
    (define random_number (random 1 100))
    (printf "The random number generated is ~a \n" random_number)
    
    (iterative_function random_number 1)
)

(define (iterative_function random_number counter)
    (display "Enter your guess\n")
    (define guess (read))
    (if (= random_number guess)
        ; If true
        ((printf "Congratulations, you won after ~a tries\n" counter)
        (exit 0))
        ; If false
        ((if (< random_number guess)
            (display "Enter a lower number\n")
            (display "Enter a higher number\n") 
         )
        (iterative_function random_number (+ 1 counter)))
    )
)

