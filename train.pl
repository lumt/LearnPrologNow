directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

/* recursive travelfromto */
% base case
travelfromto(X,Y):- directTrain(X,Y).

% recursive case
travelfromto(X,Y):- directTrain(X,Z),
					travelfromto(Z,Y).
