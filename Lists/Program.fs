﻿open NumberTasks
open System

[<EntryPoint>]
let main argv =
    let list1 = [1; 2; 3; 4; 5; 6; 7]
    let shiftedList1 = shiftLeftThreeList list1
    printfn "Original List: %A" list1
    printfn "Shifted List (F# list): %A" shiftedList1 

    let shiftedList2 = shiftLeftThreeChurch shiftedList1
    printfn "Original List: %A" shiftedList1
    printfn "Shifted List (Church List): %A" shiftedList2 

    let array = [| 4; 2; 5; 7; 4; 3|]

    Console.WriteLine("Максимальный нечётный элемент в массиве:")
    Console.Write("Church: ")
    Console.WriteLine(find_max_odd_church array)
    Console.Write("List: ")
    Console.WriteLine(find_max_odd_list array)

    let inputString = "This is a sample sentence to test the shuffling."
    let shuffledString = shuffleString inputString
    printfn "Original String: %s" inputString
    printfn "Shuffled String: %s" shuffledString
    
    let strings2 = ["aa"; "ab"; "ba"; "bb"]
    let sortedStrings2 = sortStringsByCombinationDifference strings2
    printfn "Original Strings: %A" strings2
    printfn "Sorted Strings: %A" sortedStrings2
    
    0
