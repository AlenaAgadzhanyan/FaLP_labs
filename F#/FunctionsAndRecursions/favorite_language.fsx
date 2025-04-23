let favoriteLanguage language =
    match language with
    | "F#" | "Prolog" -> "Подлиза!"
    | _ -> "Ого, интересный выбор..."
 
let askUserSuper = (fun () -> System.Console.WriteLine("Какой язык программирования твой любимый?"); System.Console.ReadLine()) >> favoriteLanguage >> System.Console.WriteLine

askUserSuper ()

let addFunc input output = output (favoriteLanguage input)

System.Console.WriteLine("Какой язык программирования твой любимый?")
let askUserCarry = addFunc (System.Console.ReadLine())
askUserCarry System.Console.WriteLine