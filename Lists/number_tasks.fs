module NumberTasks

// 1.6	Дан целочисленный массив. Необходимо осуществить циклический сдвиг элементов массива влево на три позиции.
let rec shiftLeftThreeList list =
    let n = List.length list
    if n <= 3 then list 
    else
        let head = List.skip 3 list  
        let tail = List.take 3 list  
        head @ tail 


let shiftLeftThreeChurch list =
    let rec listLength acc lst =
        match lst with
        | [] -> acc
        | _ :: tl -> listLength (acc + 1) tl

    let length = listLength 0 list

    if length <= 3 then list
    else
        let rec shift acc lst count =
            match lst with
            | [] -> acc
            | h :: tl ->
                if count > 0 then
                    shift (acc @ [h]) tl (count - 1)
                else
                    tl @ acc 
        let rec take' list n acc =
          match list with
          | [] -> acc
          | h::t when n > 0 -> take' t (n-1) (acc @ [h])
          | _ -> acc

        let acc = take' list 3 []
        let remaining = List.skip 3 list
        remaining @ acc

// 1.36	Дан целочисленный массив. Необходимо найти максимальный нечетный элемент.
let find_max_odd_church (arr: int array) =
    let lst = Array.toList arr
    let rec find_max candidate lst =
        match lst with
        | [] -> candidate
        | head :: tail ->
            if head % 2 <> 0 then
                let newCandidate =
                    match candidate with
                    | None -> Some head
                    | Some cur -> Some (max head cur)
                find_max newCandidate tail
            else
                find_max candidate tail
    match find_max None lst with
    | Some result -> result
    | None -> failwith "Нет нечётных элементов"

let find_max_odd_list (arr: int array) =
    let lst = Array.toList arr
    let odds = List.filter (fun x -> x % 2 <> 0) lst
    if List.isEmpty odds then
        failwith "Нет нечётных элементов"
    else
        List.max odds

// Задание 17 Построить приложение на F# , позволяющее пользователю решать задачу указанную задачу с применением высших функций класса List.
let readList () =
    System.Console.WriteLine "Введите список через пробел:"
    System.Console.ReadLine().Split()
    |> Array.map int
    |> Array.toList

// 6. Отсортировать введенный список кортежей длины 5 по возрастанию в лексико-графическом порядке, причем в новом списке могут быть лишь
// кортежи из цифр в итоговый список записать числовое представление получившегося кортежа, то есть список вида
// [(7,3,4,5,6),(2,3,4,6,7),(2,3,4,5,6),(4,3,10,4,5)] должен быть преобразован в список [23456,23467,73456].
let sortAndConvertToNumbers (list: (int * int * int * int * int) list) =
    list
    |> List.filter (fun (a, b, c, d, e) -> List.forall (fun x -> x >= 0 && x <= 9) [a; b; c; d; e])
    |> List.sort
    |> List.map (fun (a, b, c, d, e) -> int (string a + string b + string c + string d + string e))