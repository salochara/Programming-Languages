


(define (sort_3 a b c)
   (cond
     [ (and (<= a b)(<= a c)(<= b c)) ( list a b c) ]; CONDITION AND ACTION
     [ (and (<= a b)(<= a c)(<= c b)) ( list a c b) ]; CONDITION AND ACTION
     [ (and (<= b a)(<= b c)(<= a c)) ( list b a c) ]; CONDITION AND ACTION
   )
)

#|
(case a
    [  (1 2 3 4) "less than 5"  ]
    [  (6 7 8 9) "bigger than 5" ] ; case va a comparar a con todos los valores de la lista. A ver si son iguales
  )
|#