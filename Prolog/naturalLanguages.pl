/* 
    Example of natural langauge processing in Prolog 
*/

%%% Vocabulary
article([el]). % in a list, to work with append function
article([la]).
noun([niño]).
noun([bici]).
verb([corre]).
verb([monta]).

%%% Rules
sentence(L) :-
    noun_phrase(NL),
    verb_phrase(VL),
    append(NL,VL,L).

noun_phrase(L) :-
    article(X),
    noun(N),
    append(A,N,L).

% Only a verb
verb_phrase(L) :-
    verb(V),
    append(V,[],L).

% Verb followed by a noun phrase
verb_phrase(L) :-
    verb(V),
    noun_phrase(N),
    append(V,N,L).


