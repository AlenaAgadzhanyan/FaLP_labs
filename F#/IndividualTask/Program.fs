open System
open System.Collections.Generic
open System.Linq

let LIMIT = 150000000
let INCREMENTS = [| 1L; 3L; 7L; 9L; 13L; 27L |]

let maxNumber = int64 LIMIT * int64 LIMIT + INCREMENTS.[INCREMENTS.Length - 1]

let sieve (limit: int) : int array =
    if limit < 2 then [||] else
    let size = limit + 1
    let isComposite = Array.create size false
    isComposite.[0] <- true
    isComposite.[1] <- true

    for p in 2 .. int (sqrt (float limit)) do
        if not isComposite.[p] then
            for i in p * p .. p .. limit do
                isComposite.[i] <- true

    [| for i in 2 .. limit do if not isComposite.[i] then i |]


let primes = sieve (int (sqrt (float maxNumber)))

let isPrime (n: int64) =
    if n < 2L then false else
    let end_ = int (sqrt (float n))
    primes
    |> Array.takeWhile (fun p -> p <= end_)
    |> Array.forall (fun p -> n % (int64 p) <> 0L || n = int64 p )


let hasConsecutivePrimes (n: int) : bool =
    let n2 = int64 n * int64 n
    let temp = INCREMENTS |> Array.map (fun inc -> n2 + inc)

    let areAllPrimes =
        temp
        |> Array.forall (fun x -> isPrime x)

    if not areAllPrimes then false else
    let areAllOthersComposite =
        [ 1L .. int64 INCREMENTS.[INCREMENTS.Length - 1] - 1L ]
        |> List.filter (fun i -> not (INCREMENTS |> Array.contains i))
        |> List.forall (fun i -> not (isPrime (n2 + i)))

    areAllOthersComposite


let run () : string =
    let sum =
        [ 0 .. LIMIT - 1 ]
        |> List.filter (fun n -> n % 10 = 0) 
        |> List.filter hasConsecutivePrimes
        |> List.sumBy int64

    sum.ToString()

[<EntryPoint>]
let main _ =
    printfn "%s" (run())
    0