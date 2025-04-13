// 1. Реализуйте класс геометрическая фигура в виде алгебраического 
// типа (discriminated union), который содержит варианты «Прямоугольник», «Квадрат», «Круг» с необходимыми параметрами. 
// 2. Разработайте для данного класса функцию вычисления площади. 
// Функция должна принимать параметр типа «геометрическая фигура» 
// и вычислять различные варианты площади в зависимости от дискриминатора. Необходимо использовать механизм сопоставления 
// с образцом. (Используйте пример вычисления корней квадратного уравнения). 

module FigureDU

type FigureDU =
    | Rectangle of width: float * height: float
    | Square of side: float
    | Circle of radius: float

let calculateArea figure =
    match figure with
    | Rectangle(width, height) -> width * height
    | Square(side) -> side * side
    | Circle(radius) -> System.Math.PI * radius * radius