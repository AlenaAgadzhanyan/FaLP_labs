% 1.10	Даны два массива. Необходимо найти количество совпадающих по значению элементов.
% count_matches(+List1, +List2, -Count)

count_matches([], _, 0) :- !.
count_matches(_, [], 0) :- !.

count_matches([H|T], List2, Count) :-
    member(H, List2), !,
    count_matches(T, List2, RestCount),
    Count is RestCount + 1. 

count_matches([_|T], List2, Count) :-
    count_matches(T, List2, Count).

% 1.34	Дан целочисленный массив и отрезок a..b. Необходимо найти элементы, значение которых принадлежит этому отрезку.
% elements_in_interval(+List1, +a, , +b, -List2)

elements_in_interval([], _, _, []).

elements_in_interval([H|T], A, B, Result) :-
    H >= A,
    H =< B,
    !, 
    elements_in_interval(T, A, B, RestResult),
    Result = [H|RestResult].

elements_in_interval([_|T], A, B, Result) :-
    elements_in_interval(T, A, B, Result).


% 1.46	Дан целочисленный массив. Необходимо вывести вначале его положительные элементы, а затем - отрицательные.
% positives_then_negatives(+List, -Result)

separate_positives_and_negatives([], [], []) :- !.

separate_positives_and_negatives([H|T], [H|Positives], Negatives) :-
    H > 0,
    separate_positives_and_negatives(T, Positives, Negatives).

separate_positives_and_negatives([H|T], Positives, [H|Negatives]) :-
    H =< 0, 
    separate_positives_and_negatives(T, Positives, Negatives).

positives_then_negatives(List, Result) :-
    separate_positives_and_negatives(List, Positives, Negatives),
    append(Positives, Negatives, Result).
