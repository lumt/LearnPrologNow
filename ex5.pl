% 5.2, 1)
increment(X, Y):- Y is X + 1.

% 5.2, 2)
sum(X,Y,Z):- Z is X + Y.

% 5.3
addone([],[]).
addone([H|T], [H1|T1]):- H1 is H + 1, addone(T,T1).