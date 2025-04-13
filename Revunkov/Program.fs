open Figure
open FigureDU
open System

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

    0