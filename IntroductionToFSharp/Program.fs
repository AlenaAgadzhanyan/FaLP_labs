open System

Console.WriteLine("Hello world")

type SolveResult =
    None
    | Linear of float
    | Quadratic of float*float

let solve a b c =
    let D = b * b - 4. * a * c
    if a = 0. then
        if b = 0. then None
        else Linear(-c / b)
    else
        if D < 0. then None
        else Quadratic((((-b + sqrt(D)) / (2. * a)), ((-b - sqrt(D)) / (2. * a))))


[<EntryPoint>]
let main argv =
    let result = solve 1. 2. 3.
    match result with
        None -> Console.WriteLine("There are no solutions.")
        | Linear(x) -> Console.WriteLine($"Linear equation: {x}.")
        | Quadratic(x1, x2) -> Console.WriteLine($"Quadratic equation: {x1}, {x2}.")
    0