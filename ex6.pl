/* (append is already defined in library but for ref:)

append([], L2, L2).
append([H|T], L2, [H|T3]):-append(T,L2,T3).

 */

% example: Reverse

accRev([],A,A).
accRev([H|T], A, R):- 
	accRev(T, [H|A], R).

reverse(L, R):- 
	accRev(L, [], R).


% 6.1 doubled
doubled(L):-
	append(L1,L1,L).

% 6.2 palindrome
palindrome(List):-
	reverse(List,List).

% 6.3 toptail

toptail([_|T], Out):-
	append(Out,[_],T).

% 6.4 last using reverse

last(L, X):-
	reverse(L, [X|_]).

% using recursion

last([X],X).
last([_|T],X):- last(T,X).

% 6.5 swap first and last (using append)

swapfl([H1|T1], [H2|T2]):-
	append(X, [H1], T2),
	append(X, [H2], T1). 

% no append

swapfl([First, Last], [Last, First]).
swapfl([First, X |T1], [Last, X |T2]):-
	swapfl([First|T1], [Last, T2]).	

% 6.6 Logic puzzle

% member(X, L).

prefix(P,L):-
	append(P, _, L).

suffix(S, L):-
	append(_, S, L).

sublist(SubL, L):-
	suffix(S,L),
	prefix(SubL, S).

% house(colour, nationality, pet).
zebra(C, N):-
	Street = [H1, H2, H3],
	member(house(red,_,_), Street),
	member(house(blue,_,_), Street),
	member(house(green,_,_), Street),
	member(house(red,english,_), Street),
	member(house(_, spanish, jaguar), Street),
	sublist([house(_, _, snail), house(_, japanese,_)], Street),
	sublist([house(blue,_ ,_), house(_,_, snail)], Street),
	member(house(C, N, zebra), Street).




