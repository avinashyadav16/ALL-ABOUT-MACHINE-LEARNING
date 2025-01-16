% ------------------------------------------------
% Basic Facts and Rules
% ------------------------------------------------

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

% ------------------------------------------------
% Happiness and Actions
% ------------------------------------------------

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

% ------------------------------------------------
% Grades
% ------------------------------------------------

what_grade(5) :-
    write('Go to kindergarten').
what_grade(6) :-
    write('Go to 1st grade').
what_grade(Other) :-
    Other \= 5, 
    Other \= 6, 
    Grade is Other - 5,
    format('Go to grade ~w', [Grade]).

% ------------------------------------------------
% Family Relationships
% ------------------------------------------------

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

% ------------------------------------------------
% Miscellaneous Facts and Rules
% ------------------------------------------------

blushes(X) :- human(X).
human(derek).

stabs(tybalt, mercutio, sword).
hates(romeo, X) :- stabs(X, mercutio, sword).

% ------------------------------------------------
% Customer Information
% ------------------------------------------------

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_customer_balance(FName, LName) :-
    customer(FName, LName, Balance),
    write(FName), write(' '), write(LName),
    format(' owns us $~2f~n', [Balance]).

% ------------------------------------------------
% Geometry
% ------------------------------------------------

% This predicate checks if a given line is vertical.
% A line is represented as line(point(X, Y), point(X, Y2)).
% The line is vertical if both points have the same X coordinate.
verticle((line(point(X, Y), point(X, Y2)))).

% This predicate checks if a given line is horizontal.
% A line is represented as line(point(X, Y), point(X2, Y)).
% The line is horizontal if both points have the same Y coordinate.
horizontal((line(point(X, Y), point(X2, Y)))).

% ------------------------------------------------
% Mammals
% ------------------------------------------------

warm_blooded(penguin).
warm_blooded(human).

produce_milk(penguin).
produce_milk(human).

have_feathers(penguin).
have_hair(human).

mammal(X) :- 
    warm_blooded(X), 
    produce_milk(X), 
    have_hair(X).

% ------------------------------------------------
% Relatedness
% ------------------------------------------------

parent(albert, bob).
parent(albert, betty).
parent(albert, bill).

parent(bob, alice).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

related(X, Y) :- 
    parent(X, Y).

related(X, Y) :- 
    parent(X, Z),
    related(Z, Y).

% ------------------------------------------------
% Mathematical Operations
% ------------------------------------------------

double_digit(X, Y) :- 
    Y is X * 2.

is_even_1(X) :-
    0 is X mod 2.

is_even_2(X) :-
    X mod 2 =:= 0.

is_even_3(X) :-
    X mod 2 =\= 1.

is_even_4(X) :-
    Y is X // 2, X =:= Y * 2.

% ------------------------------------------------
% User Interaction
% ------------------------------------------------

say_hi :-
    write('What is your name? '),
    read(X),
    write('Hi '),
    write(X),
    nl.

fav_char :-
    write('What is your favorite character? '),
    get(X),
    format('The ASCII value is ~w of ', [X]),
    put(X),
    nl.

% ------------------------------------------------
% File Operations
% ------------------------------------------------

% Predicate to write text to a file
write_to_file(File, Text) :-
    % Open the file in write mode
    open(File, write, Stream),
    % Write the text to the file stream
    write(Stream, Text), nl,
    % Close the file stream
    close(Stream).

% Predicate to read and display the contents of a file
read_file(File) :-
    % Open the file in read mode
    open(File, read, Stream),
    % Get the first character from the file stream
    get_char(Stream, Char1),
    % Process the stream starting with the first character
    process_stream(Char1, Stream),
    % Close the file stream
    close(Stream).

% Base case: stop processing when end of file is reached
process_stream(end_of_file, _) :- !.

% Recursive case: process each character in the stream
process_stream(Char, Stream) :-
    % Write the character to the output
    write(Char),
    % Get the next character from the file stream
    get_char(Stream, Char2),
    % Continue processing the rest of the stream
    process_stream(Char2, Stream).

% ------------------------------------------------
% Counting
% ------------------------------------------------

count_to_10(10) :- 
    write(10), nl.

count_to_10(X) :-
    write(X), nl,
    Y is X + 1,
    count_to_10(Y).

% OR

count_to_10(X) :- 
    write(X), nl,
    X < 10,
    Y is X + 1,
    count_to_10(Y).

count_up(Low, High) :-
    between(Low, High, X),
    Y is Low + X,
    write(Y), nl.

count_down(Low, High) :-
    between(Low, High, X),
    Y is High - X,
    write(Y), nl.

% ------------------------------------------------
% Guessing Game
% ------------------------------------------------

guess_num :-
    loop(start).

loop(15) :-
    write('You Guessed it!'), nl.

loop(X) :-
    X \= 15,
    write('Guess a number: '),
    read(Guess),
    write(Guess), write(' is not the number.'), nl,
    loop(Guess).

% ------------------------------------------------
% List Operations
% ------------------------------------------------

write_list([]).

write_list([Head|Tail]) :-
    write(Head), nl,
    write_list(Tail).

% ------------------------------------------------
% String Operations
% ------------------------------------------------

% This predicate concatenates two strings, Str1 and Str2, resulting in Str3.
join_str(Str1, Str2, Str3) :-
    % Converts the string Str1 into a list of ASCII codes, StrList1.
    name(Str1, StrList1),
    
    % Converts the string Str2 into a list of ASCII codes, StrList2.
    name(Str2, StrList2),
    
    % Appends the list of ASCII codes StrList1 and StrList2 into a single list, StrList3.
    append(StrList1, StrList2, StrList3),
    
    % Converts the list of ASCII codes StrList3 back into a string, Str3.
    name(Str3, StrList3).