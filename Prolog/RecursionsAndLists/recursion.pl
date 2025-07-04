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

% Вариант 10 
% multiply_numbers(+N, -S)

multiply_numbers_up(1,1) :- !.
multiply_numbers_up(N,S) :- N1 is N // 10, C is N mod 10, multiply_numbers(N1,S1), S is S1 * C.

multiply_numbers_down(N,S) :- multiply_numbers_down(N,1,S).
multiply_numbers_down(0,S,S) :- !.
multiply_numbers_down(N,S,R) :- N1 is N // 10, C is N mod 10, S1 is S * C, multiply_numbers_down(N1,S1,R).

% max_digit_not_divisible_by_3_up(+N, -M)

max_digit_not_divisible_by_3_up(0, 0) :- !.
max_digit_not_divisible_by_3_up(N, M) :-
    N1 is N // 10,
    C is N mod 10,
    max_digit_not_divisible_by_3_up(N1, M1),
    (C mod 3 =\= 0 -> max(M1, C, M); M = M1).

% max_digit_not_divisible_by_3_up(+N, -M, +R)

max_digit_not_divisible_by_3_down(N, M) :- max_digit_not_divisible_by_3_down(N, 0, M).
max_digit_not_divisible_by_3_down(0, M, M) :- !.
max_digit_not_divisible_by_3_down(N, M, R) :-
    N1 is N // 10,
    C is N mod 10,
    (C mod 3 =\= 0 -> M1 is max(M, C); M1 = M),
    max_digit_not_divisible_by_3_down(N1, M1, R).


% count_divisors_up(+N, -C)

count_divisors_up(N, Count) :-
    count_divisors_up(N, 1, 0, Count).

count_divisors_up(N, D, Acc, Count) :-
    D =< N,
    (N mod D =:= 0 ->
        NewAcc is Acc + 1,
        NextD is D + 1;
        NewAcc is Acc,
        NextD is D + 1),
    count_divisors_up(N, NextD, NewAcc, Count).

count_divisors_up(N, D, Count, Count) :- D > N.

count_divisors_down(N, Count) :-
    count_divisors_down(N, 1, 0, Count).

count_divisors_down(N, D, Acc, Acc) :- D > N, !.
count_divisors_down(N, D, Acc, Count) :-
    D =< N,
    (N mod D =:= 0 -> NewAcc is Acc + 1; NewAcc is Acc),
    NextD is D + 1,
    count_divisors_down(N, NextD, NewAcc, Count).

% 5.1 Найти количество четных чисел, не взаимно простых с данным
gcd(X, 0, X) :- !.
gcd(X, Y, G) :- Z is X mod Y, gcd(Y, Z, G).

not_coprime(A, B) :- gcd(A, B, G), G > 1.

count_even_not_coprime(N, Count) :-
    findall(X, (between(1, N, X), X mod 2 =:= 0, not_coprime(X, N)), L),
    length(L, Count).

% 5.2. Найти произведение максимального числа, не взаимно простого с данным,
% не делящегося на наименьший делитель исходного числа,
% и суммы цифр числа, меньших 5
% Нахождение наименьшего делителя числа (>1)

smallest_divisor(N, D) :-
    N > 1,
    between(2, N, D),
    N mod D =:= 0,
    !.

digit_less_5(N, Sum) :-
    number_digits(N, Digits),
    include(>(5), Digits, Filtered),
    sum_list(Filtered, Sum).

number_digits(N, Digits) :-
    number_chars(N, Chars),
    maplist(char_number, Chars, Digits).

char_number(C, N) :- char_type(C, digit(N)).

max_not_coprime_not_div(N, Max) :-
    smallest_divisor(N, SD),
    findall(X, (
        between(1, N, X),
        not_coprime(X, N),
        X mod SD =\= 0
    ), List),
    max_list(List, Max).

compute_product(N, Product) :-
    max_not_coprime_not_div(N, Max),
    digit_less_5(N, Sum),
    Product is Max * Sum.