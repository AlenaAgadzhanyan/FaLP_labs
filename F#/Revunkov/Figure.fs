// 1. Программа должна быть разработана в виде консольного 
// приложения на языке F#. 
// 2. Абстрактный класс «Геометрическая фигура» содержит виртуальный 
// метод для вычисления площади фигуры.
// 3. Класс «Прямоугольник» наследуется от класса «Геометрическая 
// фигура». Ширина и высота объявляются как свойства (property). 
// Класс должен содержать конструктор по параметрам «ширина» и 
// «высота».
// 4. Класс «Квадрат» наследуется от класса «Прямоугольник». Класс 
// должен содержать конструктор по длине стороны.  
// 5. Класс «Круг» наследуется от класса «Геометрическая фигура». 
// Радиус объявляется как свойство (property). Класс должен содержать 
// конструктор по параметру «радиус». 
// 6. Для классов «Прямоугольник», «Квадрат», «Круг» переопределить 
// виртуальный метод Object.ToString(), который возвращает в виде 
// строки основные параметры фигуры и ее площадь. 
// 7. Разработать интерфейс IPrint. Интерфейс содержит метод Print(), 
// который не принимает параметров и возвращает void. Для классов 
// «Прямоугольник», «Квадрат», «Круг» реализовать наследование от 
// интерфейса IPrint. Переопределяемый метод Print() выводит на 
// консоль информацию, возвращаемую переопределенным методом 
// ToString().

module Figure

[<AbstractClass>]
type GeometryFigure() =
    abstract Area: unit -> float
    default this.Area() : float = failwith "Not implemented"

type IPrint = 
    abstract member Print: unit -> unit

type Rectangle(width: float, height: float) =
    inherit GeometryFigure()

    let mutable widthValue = width
    let mutable heightValue = height

    member this.Width with get() = widthValue and set value = widthValue <- value
    member this.Height with get() = heightValue and set value = heightValue <- value
     
    override this.Area() = this.Width * this.Height

    override this.ToString() = sprintf "Прямоугольник: ширина = %f, высота = %f, площадь = %f" this.Width this.Height (this.Area())

    interface IPrint with 
        member this.Print() = printfn "%s" (this.ToString())
 
type Square(sideLength: float) = 
    inherit Rectangle(sideLength, sideLength)
    
    override this.ToString() = sprintf "Квадрат: сторона = %f, площадь = %f" (float (base.Width)) (this.Area())

    interface IPrint with 
        member this.Print() = printfn "%s" (this.ToString())

type Circle(radius: float) =
    inherit GeometryFigure()

    let mutable radiusValue = radius

    member this.Radius with get() = radiusValue and set value = radiusValue <- value
    
    override this.Area() = System.Math.PI * this.Radius * this.Radius
    
    override this.ToString() = sprintf "Круг: радиус = %f, площадь = %f" this.Radius (this.Area())

    interface IPrint with 
        member this.Print() = printfn "%s" (this.ToString())