/*
Simple examples of using arithmetic in Prolog
Gilberto Echeverria
*/
% trace. for debugging

c_to_f(C, F) :-
    F is C * (9 / 5) + 32. % 'is' equivalent to '='' in C
 
 f_to_c(F, C) :- % the result has to be passed as a parameter, there's no return 
     C is (F - 32) * 5 / 9.
 
 quadratic(A, B, C, X1, X2) :-
     D is B * B - 4 * A * C,
     D >= 0,
     X1 is (-B + sqrt(D)) / (2 * A),
     X2 is (-B - sqrt(D)) / (2 * A).
 
 
 % Factorial
 % Base case using a fact
 factorial(0, 1).
 
 % Recursive rule
 factorial(N, R) :-
     N > 0, % commas as 'and'
     N1 is N - 1,
     factorial(N1, S),
     R is N * S.

% Recursive with tail 
factorial(0,R,R). % lo que llevo acumulado, es la misma que la respuesta

% ?- factorial(5,1,X). para correr. A empieza en 1 porque es el acumulador que se multiplica
factorial(N,A,R) :- % a es acumulador
    N > 0, 
    A1 is A * N,
    N1 is N - 1,
    factorial(N1,A1,R).

% Lists, exampel for terminal
?- [H|T] = [a,b,c,d].
H = a,
T = [b, c, d].
    