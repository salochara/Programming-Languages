; Example of let in Racket


(let* ; Asterisk is for being able to declare c
    ; Declare variables
    (
     [a 234]
     [b 3]
     [ c (+ a b)] ; c = a + b
    )

  ; Expression where the variables are valid  
   (* a b c)
)