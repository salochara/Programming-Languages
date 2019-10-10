#|  
Salomón Charabati
Programming Languages
Primes Program
|#

; Function for returning the nth-prime. It calls prime-less-than function with 200,000 (may be smaller for better performance) and the access the list at number position
(define (nth-prime number)
  (list-ref (prime-less-than 200000) (- number 1))
)

; Function that returns the list of primes less than the value passed
(define (prime-less-than number)
  ; First conditionals, simple cases
  (when ( < number 2) '())
  (when ( equal? number 2) '(2))
  (if ( > number 2 )
    (let loop ([maximum number] [i 3] [resultList '(2)]) ; If number is bigger than 2, then this loops enters
      (if (> maximum i)
          (if (isPrime? i resultList)
              (loop maximum (+ i 1) (append resultList (list i))) ; True, then append to list!
              (loop maximum (+ i 1) resultList); False, increment i by one and leave the list untouched
          )
          resultList ; Return the list with all the prime-less-than number
      )
    )
    (display "Unknown number") ; Needed as false statement for the if (< number 2)
  )
)
  
  
; Function for determining if a number is prime. Also recieves a list. Similar to function isPrimeOne?
(define (isPrime? maximum list)
    (if (empty? (cdr list))
      #t
        (if (= (modulo maximum (car list)) 0)
          #f
          (isPrime? maximum (cdr list));
        )
    )
)


; Function for determining if a number is prime. Only for one number
(define (isPrimeOne? n)
  (let loop ((d 2)) ; Named loop, starting at 2 (2 is the first prime number)
    (cond ((< n (* d d)) #t)
          (( = (modulo n d) 0) #f) 
          (else (loop (+ d 1))) ; Iterative call, adding 1 to d
    )
  )
)

