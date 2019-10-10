; Uso de map. Map aplica la funcion que le pasa a cada uno de los elemntos en la lista

(define (double x)
  (* x 2)
)

(map double '(4 7 6 4 9 2))


; Factorial. hace 1*1, 1*2, 1*3, etc...
(foldl * 1 ' ( 1 2 3 4 5 6))
  