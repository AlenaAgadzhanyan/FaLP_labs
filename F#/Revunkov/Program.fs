open Figure
open FigureDU
open Agent
open System
open Agent.Agent
open FunctorsAndMonadas

[<EntryPoint>]
let main argv =
    let rectangle = Figure.Rectangle(5.0, 10.0)
    let square = Figure.Square(7.0)
    let circle = Figure.Circle(3.0)

    (rectangle :> IPrint).Print()
    (square :> IPrint).Print()
    (circle :> IPrint).Print()

    let figures = [
        FigureDU.Rectangle(3.0, 4.0)
        FigureDU.Square(5.0)
        FigureDU.Circle(2.5)
    ]

    figures |> List.iter (fun figure ->
        match figure with
        | FigureDU.Rectangle(width, height) -> 
            printfn "Прямоугольник: площадь = %f" (calculateArea figure)
        | FigureDU.Square(side) -> 
            printfn "Квадрат: площадь = %f" (calculateArea figure)
        | FigureDU.Circle(radius) -> 
            printfn "Круг: площадь = %f" (calculateArea figure)
    )

    let agent = startAgent ()

    agent.Post (Print "HELLO")
    agent.Post Count
    agent.Post Stop

    System.Threading.Thread.Sleep(500)

    let testCases = [Just 5; Nothing]
    
    Console.WriteLine("Проверка законов функтора:")
    testCases |> List.iter (fun x ->
        Console.WriteLine($"Тождественный закон для {x}: {Functor.Laws.identity x}")
        Console.WriteLine($"Закон композиции для {x}: {Functor.Laws.composition ((+) 2) ((*) 3) x}")
    )

    Console.WriteLine("\nПроверка законов аппликативного функтора:")
    testCases |> List.iter (fun v ->
        Console.WriteLine($"Тождественный закон для {v}: {Applicative.Laws.identity v}")
    )
    Console.WriteLine($"Гомоморфизм: {Applicative.Laws.homomorphism ((+) 2) 5}")
    Console.WriteLine($"Закон перестановки: {Applicative.Laws.interchange (Just ((+) 2)) 5}")

    Console.WriteLine("\nПроверка законов монады:")
    let f x = Just (x + 2)
    let g x = Just (x * 3)
    testCases |> List.iter (fun m ->
        Console.WriteLine($"Левый нейтральный элемент (левая единица): {Monad.Laws.leftIdentity 5 f}")
        Console.WriteLine($"Правый нейтральный элемент (правая единица) для {m}: {Monad.Laws.rightIdentity m}")
        Console.WriteLine($"Ассоциативность для {m}: {Monad.Laws.associativity m f g}")
    )
    0