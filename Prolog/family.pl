% Задание 1. 

% Построить предикат, который выведет всех мужчин. Построить предикат, который выведет всех женщин
men :- man(X),print(X),nl,fail
women :- woman(X),print(X),nl,fail

% Построить предикат children(X), который выводит всех детей X.
children(X) :- parent(X,Y),print(Y),nl,fail.

% Построить предикат mother(X, Y), который проверяет, является ли X матерью Y. Построить предикат, mother(X), который выводит маму X.
mother(X,Y) :- parent(X, Y), woman(X).
mother(X) :- mother(Y, X), print(Y).

% Построить предикат brother(X, Y), который проверяет, является ли X братом Y. Построить предикат brothers(X), который выводит всех братьев X.
brother(X, Y) :- man(Y), parent(Z,X), parent(Z,Y), man(Z), Y\=X,nl.
brothers(X) :- brother(X,Y), Y\=X, print(Y),nl,fail.

% Построить предикат b_s(X,Y), который проверяет, являются ли X и Y родными братом и сестрой или братьями или сестрами. Построить предикат b_s(X), который выводит всех братьев или сестер X.
b_s(X,Y) :- parent(Z,X), parent(Z,Y), Y\=X, nl.
b_s(X) :-  setof(Y, b_s(Y, X), Siblings), write(Siblings).


% Задание 2. Вариант № 10. 
	
% Построить предикат father(X, Y), который проверяет, является ли  X отцом Y. Построить предикат, father(X), который выводит отца X.
father(X,Y) :- parent(X, Y), man(X).
father(X) :- father(Y, X), print(Y).

% Построить предикат wife(X, Y), который проверяет, является ли X женой Y. Построить предикат wife(X), который выводит жену X.
wife(X,Y) :- parent(X,Z), parent(Y,Z), woman(X), man(Y).
wife(X) :- wife(Y, X), print(Y).

% Задание 3. Вариант № 10. 

% Построить предикат grand_ma(X, Y), который проверяет, является ли X бабушкой Y. Построить предикат grand_mas(X), который выводит всех бабушек X.

% на основе базы фактов
grand_ma(X,Y) :- woman(X), parent(X,Z), parent(Z,Y).
grand_mas(X) :- woman(Y), parent(Y,Z), parent(Z,X), print(Y), nl, fail.

% на основе предикатов
grand_ma(X,Y) :- mother(X,Z), mother(Z,Y).
grand_mas(X) :- grand_ma(Y,X),print(Y), nl, fail.

% Построить предикат grand_pa_and_da(X,Y), который проверяет, являются ли X и Y дедушкой и внучкой или внучкой и дедушкой.

% на основе базы фактов
grand_pa_and_da(X,Y) :- man(X), parent(X,Z), parent(Z,Y); man(Y), parent(Y,Z), parent(Z,X). 

% на основе предикатов
grand_pa_and_da(X,Y) :- grand_ma(Z,X), wife(Z,Y); grand_ma(Z,Y), wife(Z,X).

% Построить предикат, который проверяет, является ли X племянницей Y. Построить предикат, который выводит всех племянниц X.

% на основе базы фактов
niece(X,Y) :- parent(Z,X), parent(W,Z), parent(W,Y), woman(X), Z\=Y.
niece(X) :- setof(Y, (parent(Z,Y), parent(W,Z), parent(W,X), woman(Y), Z\=X), Nieces), write(Nieces), nl.

% на основе предикатов
niece(X,Y) :- b_s(Z,Y), parent(Z,X), woman(X), Z\=Y.
niece(X) :- setof(Y, niece(Y, X), Nieces), write(Nieces), nl.