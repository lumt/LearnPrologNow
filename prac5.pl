% accMax
accMax([H|T], A, Max):-
	H > A,
	accMax(T, H, Max).

accMax([H|T], A, Max):-
	H =< A,
	accMax(T , A, Max).

accMax([], A, A).

max(List, Max):-
	List = [H|_],
	accMax(List, H, Max).


% 1) accMin
accMin([H|T], A, Min):-
	H < A,
	accMin(T, H, Min).

accMin([H|T], A, Min):-
	H >= A,
	accMin(T, A, Min).

accMin([], A, A).

min(List, Min):-
	List = [H|_],
	accMin(List, H, Min).

% 2) scalar multiplication

scalarMult(K, [], []).
scalarMult(K, [H|T], [H1|T1]):-
	H1 is H*K,
	scalarMult(K, T, T1).

% 3) dot product
/* Without acc 
dot([H1|T1], [H2|T2], R):-
	dot(T1,T2,R1),
	R is (R1 + (H1*H2)).

dot([],[], 0).
*/

/* With acc */
accDot([],[], A, A).

accDot([H1|T1], [H2|T2], A, R):-
	NewA is H1*H2 + A,
	accDot(T1, T2, NewA, R).

dot(L1, L2, R):-
	accDot(L1, L2, 0, R).

