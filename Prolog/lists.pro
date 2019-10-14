/*
Example of list in Prolog
To usea trace: Type trace. in the bash
*/ 

%%% Get last element in the list 
last_mine([H]|[],H). % cuando hay head y no hay tail, el head es el last element de la lista 
% Recursive case
last_mine([_|T], L) :- % _ variable anónima 
    last_mine(T,L). % le pasas T hasta que tenga un solo elemento de tail, y llegue al fact de arriba 


%%% Get the length of a list
tec_length([], 0).
% Recursive case
tec_length([_|R], L) :-
    tec_length(R, L1),
    L is L1+1.

%%% Tail recursion for getting the lenght of a list
tec_length_tail([],L,L). % Fact. Base case
% Recursive rule
tec_length_tail([_|T], A, L) :-
    A1 is A + 1,
    tec_length(T,A1,L).

%%% Reverse a list
tec_reverse(L,R) :- % R is final result, L is the list you receive
    reverse_helper(L,R,[]). % empty list as accumulator
% Base case fact
reverse_helper([],R,R). % return the list, the result list, bc it's an empty list.  
% Recursive rule
reverse_helper([H|T],R,A) :-
    reverse_helper(T,R,[H|A]).

%%% Append a list to another list
% Base case fact
tec_append([],L,L).
% Recursive rule
tec_append([H1|T1],L2,[H1|R]) :- 
    tec_append(T1,L2,R). % use trace. (kind of debugger)to understand this!

%%% Double each element of a list
double_elements([],[]). 
% Recursive rule
double_elements([H|T],[X|R]) :-
    X is H * 2, % head de mi respuesta es el primer head * 2
    double_elements(T,R). % use trace, (kind of debugger)to understand this!

