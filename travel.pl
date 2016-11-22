byCar(auckland,hamilton). 
byCar(hamilton,raglan). 
byCar(valmont,saarbruecken). 
byCar(valmont,metz). 
 
byTrain(metz,frankfurt). 
byTrain(saarbruecken,frankfurt). 
byTrain(metz,paris). 
byTrain(saarbruecken,paris). 
 
byPlane(frankfurt,bangkok). 
byPlane(frankfurt,singapore). 
byPlane(paris,losAngeles). 
byPlane(bangkok,auckland). 
byPlane(singapore,auckland). 
byPlane(losAngeles,auckland).

travel(X,Y):-byCar(X,Y); byTrain(X,Y); byPlane(X,Y).

travel(X,Y):-travel(X,Z), travel(Z,Y).

/*
% Q3) direct route. << CORRECT
travel(X,Y, go(X,Y)):-  
                     byCar(X,Y);
                     byTrain(X,Y);
                     byPlane(X,Y).

travel(X,Y, go(X, Z, W)):-
                     travel(X,Z, go(X,Z)),
                     travel(Z,Y, W).
*/


% Q4 Show direction.
travel(X,Y, byCar(X,Y)):- byCar(X,Y).
travel(X,Y, byTrain(X,Y)):- byTrain(X,Y).
travel(X,Y, byPlane(X,Y)):- byPlane(X,Y).

travel(X,Y, byCar(X,Z, W)):-
                        travel(X,Z, byCar(X,Z)),
                        travel(Z,Y, W).

travel(X,Y, byPlane(X,Z, W)):-
                        travel(X,Z, byPlane(X,Z)),
                        travel(Z,Y, W).

travel(X,Y, byTrain(X,Z, W)):-
                        travel(X,Z, byTrain(X,Z)),
                        travel(Z,Y, W).
