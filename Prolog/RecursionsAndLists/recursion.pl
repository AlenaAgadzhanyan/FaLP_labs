% max(+X, +Y, -Z)

max(X,Y,X) :- X > Y, !.
max(_,Y,Y).

% max(+X, +Y, +Z, -U)

max(X,Y,Z,U) :- max(X,Y,V), max(V,Z,U).

max3(X,Y,Z,X) :- X > Y, X > Z, !.
max3(_,Y,Z,Y) :- Y > Z, !.
max3(_,_,Z,Z).

% sum_cifr(W, ?S)

sum_cifr(0,0) :- !.
sum_cifr(N,S) :- N1 is N // 10, C is N mod 10, sum_cifr(N1,S1), S is S1 + C.

sum_cifr_down(N,S) :- sum_cifr_down(N,0,S).
sum_cifr_down(0,S,S) :- !.
sum_cifr_down(N,S,R) :- N1 is N // 10, C is N mod 10, S1 is S + C, sum_cifr_down(N1,S1,R).

write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

sum_list([],0) :- !.
sum_list([H|T],S) :- sum_list(T,S1), S is S1 + H.

sum_list_down([H|T],S) :- sum_list_down([H|T],0,S).
sum_list_down([],S,S) :- !.
sum_list_down([H|T],S,R) :-S1 is S + H, sum_list_down(T,S1,R).