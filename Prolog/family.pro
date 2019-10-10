/*
Program to establish family relationships between persons
Source of the data:
    https://dragonball.fandom.com/wiki/Bardock
Gilberto Echeverria
02/10/2019
*/

% Facts
father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
mother(gine, goku).
mother(gine, raditz).
mother(chichi, gohan).
mother(chichi, goten).
mother(bulma, trunks).
mother(bulma, bulla).
male(bardock).
male(goku).
male(raditz).
male(vegeta).
male(gohan).
male(goten).
male(trunks).
female(gine).
female(chichi).
female(bulma).
female(bulla).


% Rules

% Que la madre y el padre sean el mismo
brothers(X,Y) :- father(Z,X),father(Z,Y),mother(W,X),mother(W,Y), X \= Y. % para que no se cuente a si mimso

% X es hermano de Y, cumpliendo brothers + que sea male
brother(X,Y) :- brothers(X,Y),male(X).

sister(X,Y) :- brothers(X,Y),female(X).

% Si, X es papá de Y
grandfather(X,Y) :- father()

grandfather(X,Y) :- 
    male(X),
    father(Z,Y),
    father(X,Z).

grandmother(X,Y) :-
    female(X),
    mother(Z,Y),
    mother(X,Z).

grandchild(X,Y) :- 
    (grandfather(Y,X); % or
    grandmother(Y,X)).

grandson(X,Y) :-
    grandchild(X,Y),
    male(X).

granddaughter(X,Y) :-
    grandchild(X,Y),
    female(X).`


