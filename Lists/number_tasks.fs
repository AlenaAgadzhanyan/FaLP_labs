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
