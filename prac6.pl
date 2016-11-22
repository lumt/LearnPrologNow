% redefine append with app for debugging purposes
app([],L,L).
app([H|T], L2, [H|L3]):-
	app(T,L2, L3).

prefix(P,L):-
	app(P, _, L).

suffix(S, L):-
	app(_, S, L).

sublist(SubL, L):-
	suffix(S,L),
	prefix(SubL, S).

/* 1) one liner for member/2 */
mem(X, L):-
	app(_, [X|_], L).

/* 2) set	*/

% base case
set([], A, A).

% if already in accumulator,
% skip and call Tail
set([H|T], A, Out):-
	member(H, A),
	set(T, A, Out).

% otherwise if new
% append to accumulator
set([H|T], A, Out):-
	append(A, [H], R),
	set(T, R, Out).

% caller
set([H|T], Out):-
	set(T, [H], Out).

/* 3) Flatten */

% base case,
flatten([], A, A).

% if X is not a list, append list to acc
flatten(X, A, [X|A]):-
	X \= [],
	X \= [_|_].

% if X is a list, flatten head and tail
flatten([X|Xt], A, Flat):-
	flatten(Xt, A, NewA),
	flatten(X, NewA, Flat).

% caller
flatten(L, Flat):-
	flatten(L, [], Flat).	


