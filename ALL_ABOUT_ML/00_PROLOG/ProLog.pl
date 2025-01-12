loves(romeo, juliet).

loves(juliet, romeo) :- loves(romeo, juliet).

male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).

female(alice).
female(betsy).
female(diana).

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :- 
    happy(albert).

dances(alice) :-
    happy(alice),
    with_albert(alice).

does_alice_dance :- 
    dances(alice),
    write('When Alice is happy and with Albert she dances').

swims(bill) :-
    happy(bill).
swims(bill) :-
    near_water(bill).

near_water(bill).

parent(albert, bob).
parent(albert, betsy).
parent(bob, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

get_grandparent :-
    parent(X, carl),
    parent(X, charlie),
    format('~w ~s grandparent ~n ', [X, 'is the']).

brother(bob, bill).

grand_parent(X, Y) :-
    parent(Z, X),
    parent(Y, Z).

blushes(X) :- human(X).
human(derek).

stabs(tybalt, mercutio, sword).
hates(romeo, X) :- stabs(X, mercutio, sword).



what_grade(5) :-
    write('Go to kindergarten').
what_grade(6) :-
    write('Go to 1st grade').
what_grade(Other) :-
    Other \= 5, % Ensure the age is not 5 (`\=` operator is used to denote inequality.)
    Other \= 6, % Ensure the age is not 6
    Grade is Other - 5, % ARITHMETIC OPERATION: Calculate the grade by subtracting 5 from the given age
    format('Go to grade ~w', [Grade]).