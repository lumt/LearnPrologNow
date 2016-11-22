% example
a2b([],[]).

a2b([a|Ta],[b|Tb]):- a2b(Ta,Tb).

% 4.3
second(X,[_,X|_]).

% 4.4
swap12([X,Y|T], [Y,X|T]).

% 4.5
tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

listtran([], []).
listtran([GH|GT], [EH|ET]):-
							tran(GH,EH), 
							listtran(GT,ET).

% 4.6
twice([], []).
twice([H|T1], [H,H|T2]):-
						twice(T1,T2).

% 4.7
