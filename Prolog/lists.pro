/*
Example of list in Prolog

*/

% Get last element in the list 
last_mine([H]|[],H). % cuando hay head y no hay tail, el head es el last element de la lista 
% Recursive case
last_mine([_|T], L) :- % _ variable anónima 
    last_mine(T,L). % le pasas T hasta que tenga un solo elemento de tail, y llegue al fact de arriba 

% Get the length of a list
tec_length([_|[]], 1).
% Recursive case
tec_length([_|R], L) :-
    tec_length(R, L1),
    L is L1+1.