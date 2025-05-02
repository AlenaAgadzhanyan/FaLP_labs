# 1.10	Даны два массива. Необходимо найти количество совпадающих по значению элементов.
% count_matches(+List1, +List2, -Count)

count_matches([], _, 0) :- !.
count_matches(_, [], 0) :- !.

count_matches([H|T], List2, Count) :-
    member(H, List2), !,
    count_matches(T, List2, RestCount),
    Count is RestCount + 1. 

count_matches([_|T], List2, Count) :-
    count_matches(T, List2, Count).