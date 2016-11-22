% sigma
% tell prolog that you are dynamically storing results
:- dynamic sigmares/2.

sigmares(0,0).

sigma(K,Result):-
	sigmares(K, Result).

sigma(K, Result):-
	K > 0,
	\+ sigmares(K, Result),		% negate, not in sigmares
	M is K - 1,
	sigma(M, Result1),
	Result is Result1 + K,
	assert(sigmares(K, Result)).


