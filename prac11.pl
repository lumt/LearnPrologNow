% 1) subset is a list without repeats

% base
subsetR([], _, []).

% if Hs is member of Main, and not been found in itself (Acc);
subsetR([Hs|Ts], A, [H|T]):-
	member(Hs, [H|T]),
	\+ member(Hs, A),
	subsetR(Ts, [Hs|A], T).	% append to accumulator

% otherwise, reduce main
subsetR(Sub, A, [_|T]):-
	subsetR(Sub, A, T).

% if input is Var, return unique answers
subset(Var, M):-
	var(Var),
	setof(X, subsetR(X, [], M), Var).

% otherwise, run check
subset(Sub, M):-
	subsetR(Sub, [], M).


% 2) powerset, given a set, return all its subset

powerset(Set, Subs):-
	subset(Subs, Set).
