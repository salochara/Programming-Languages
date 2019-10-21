/*
 Programming Languages
 Prolog Homework
 Assignment #6
 Developed by Salomón Charabati
 Source for the backtarce operator (!): https://pdfs.semanticscholar.org/c8ab/e6dc0b75597b7f9d5797871ea81466e99e50.pdf
*/

%% in_list: 
%% Takes two arguments, a list and an element, and determines if the element is in the list
in_list([H|_],H). % Base case fact. An element is in the list if it's in head (H)
% Recursive rule
in_list([_|T],H) :- % An element is in the list if it's in the tail (T)
    in_list(T,H).

%% odd_length:
%% Take as argument a list, and determine if the list has an odd number of elements or not. 
even_length([]). % A list with no elements, with null elementsn is even.
even_length([Head|Tail]) :- % An even list, is a list where the tail of the list is odd.
    odd_length(Tail).

odd_length([SingleElement]). % A list with a single element is odd.
odd_length([Head|Tail]) :- % An odd list, is a list where the tail of the list is even.
    even_length(Tail).


%% element_at: 
%% Take as argument an index and a list, and return the element at index n of the list. Indices start at 0.
element_at(0,[X|L],X). % Base case. When X is at the head of the list.
element_at(N,[Y|L],X) :- % If the element is not at the head, 
    N1 is N-1, % substract 1 to the index passed
    element_at(N1,L,X). % and call the function again with N1 and the rest of the list

%% is_permutation: 
%% Take two lists as arguments, and determine if they are permutations of each other. That is, they have the exact same elements, but in different orders.
% Version using permutation built in method
is_permutation(L1,L2) :-
    permutation(L1,L2).
% Version using msort 
is_permutation(L1,L2) :-
    msort(L1, Sorted), 
    msort(L2, Sorted). 

%% remove_doubles:
%% Take as argument a list, and generate a list without contiguous elements that are duplicated.
remove_doubles([], []). % Base case fact. An empty list returns itself.
remove_doubles([Head, Head | Tail], Result) :- % If there are two equal elements, return one head
remove_doubles([Head|Tail], Result), !.        % and don't backtrace, i.e. don't find alternative solutions

remove_doubles([Head | Tail], [Head | Result]) :- % If there are two different elements, keep head in result (kind of "append it")
remove_doubles(Tail, Result).                     % and call the function again with tail


