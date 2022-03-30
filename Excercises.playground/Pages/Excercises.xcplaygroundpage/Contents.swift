import UIKit

// MARK: - 1
/*
    Checkear si 2 palabras son un anagrama, devolver un booleano
    func isAnagram(_ lhs: String, _ rhs: String) -> Bool
 */

func isAnagram(_ lhs: String, _ rhs: String) -> Bool {
    let str1 = lhs.lowercased().sorted()
    let str2 = rhs.lowercased().sorted()
    
    return (str1 == str2)
}

// Method test
isAnagram("HELLO", "heLoL")
isAnagram("fer", "POEWIR")


// MARK: - 2
/*
    Checkear si 2 palabras son la misma escrita al revez, devolver un booleano
    func isReverse(_ lhs: String, _ rhs: String) -> Bool
 */

func isReverse(_ lhs: String, _ rhs: String) -> Bool {
    let str1 = String(lhs.lowercased())
    let str2 = String(rhs.lowercased().reversed())
    
    return (str1 == str2)
}

// Method test
isReverse("test", "tset")
isReverse("no", "way")


// MARK: - 3
/*
    Checkear si una palabra es un palindromo
    func isPalindrome(_ word: String) -> Bool
 */

func isPalindrome(_ word: String) -> Bool {
    let reverse_String = String(word.reversed())
    
    if (word == "") {
        return false
    }
    return (word == reverse_String)
}

// Method test
isPalindrome("")
isPalindrome("ANNA")
isPalindrome("NOTAPALINDROME")


// MARK: - 4
/*
 Crear un juego de piedra papel o tijera usando un enumerado para las opciones,
 otro para los resultados (ganar, perder o empatar) y un metodo que a partir de
 2 opciones devuelva el resultado del primer jugador
 func match(lhs: HandShape, rhs: HandShape) -> MatchResult
 */

enum HandShape {
    case paper, stone, sccisors
}

enum MatchResult {
    case win, lose, tie
}

func match(lhs: HandShape, rhs: HandShape) -> MatchResult {
    var result = MatchResult.tie
    
    // Tie case
    if (lhs == rhs) {
        return result
    }
    
    // If there are no winning cases, this value is returned
    result = MatchResult.lose
    
    // Win cases
    switch lhs {
    case .paper:
        if (rhs == HandShape.stone) {
            result = MatchResult.win
        }
    case .stone:
        if (rhs == HandShape.sccisors) {
            result = MatchResult.win
        }
    case .sccisors:
        if (rhs == HandShape.paper) {
            result = MatchResult.win
        }
    }
    return result
}

// Method test
match(lhs:.paper, rhs:.stone)
match(lhs:.paper, rhs:.paper)
match(lhs:.stone, rhs:.paper)


// MARK: - 5
/*
 Contar la cantidad de ocurrencias de cada palabra en una lista de strings
 func countStrings(_ strings: [String]) -> [String: Int]
 */

func countStrings(_ strings: [String]) -> [String: Int] {
    var dict = [String: Int]()
    
    for word in strings {
        if dict[word] != nil {
            dict[word] = dict[word]! + 1
        } else {
            dict[word] = 1
        }
    }
    
    return dict
}

// Method test
countStrings(["HOLA","COMO","ESTAS","HOLA","PROBANDO","PROBANDO2"])


// MARK: - 6
/*
 Crear una funcion que acepte un numero n y una funcion, y llame a esa funcion n veces
 func applyNTimes(_ n: Int, _ closure: () -> ())
 */

var testClosure = {
    print("Running closure")
}

func applyNTimes(_ n: Int, _ closure: () -> ()) {
    
    for i in 1...n {
        print("\(i)" + " time")
        closure()
    }
}

// Method test
applyNTimes(3, testClosure)


// MARK: - 7
/*
 Crear una funcion que devuelva un array con los elementos de tipo Int a partir de
 una string que represente un array de JSON
 func getInts(from string: String) -> [Int]
 "[\"a\", \"b\", 1, {}, 4.3, 2]"
 */

func getInts(from string: String) -> [Int] {
    var intNumbers = [Int]()
    
    if (string != "" && string.count >= 2) {         // Conditional for empty string and empty JSON array
        // Removing Parenthesis
        var stringWithoutParenthesis = string
        stringWithoutParenthesis.removeFirst()
        stringWithoutParenthesis.removeLast()
    
        // Splitting the string
        let array = stringWithoutParenthesis.components(separatedBy: ", ")
        
        for a in array {
            if let n = Int(a) {
                intNumbers.append(n)
            }
        }
    }
    
    return intNumbers
}

getInts(from: "[\"a\", \"b\", 1, {}, 4.3, 2]")
getInts(from: "")
getInts(from: "[]")
getInts(from: "[1]")
getInts(from: "[1, 2]")


// MARK: - 8
/*
 Crear una funcion recursiva que devuelva el n numero de fibonacci
 func fibonacci(_ i: Int) -> Int
 */

func fibonacci(_ i: Int) -> Int {
    if i <= 1 {
        return i
    } else {
        return (fibonacci(i-1) + fibonacci(i-2))
    }
}

// Method test
fibonacci(8)


// MARK: - 9
/*
 Dada una lista de diccionarios de forma
 let people: [[String: Any]] = [
     [
         "firstName": String,
         "lastName": String,
         "score": Int
     ],
     [
         "firstName": String,
         "lastName": String,
         "score": Int
     ],
 ]
 devolver el nombre completo de la persona con mayor puntaje
 func highestScore(_ people: [[String: Any]]) -> String
 */

let people: [[String: Any]] = [
    [
        "firstName": "Darth",
        "lastName": "Vader",
        "score": 8
    ],
    [
        "firstName": "Master",
        "lastName": "Yoda",
        "score": 11
    ],
    [
        "firstName": "Obi-Wan",
        "lastName": "Kenobi",
        "score": 9
    ],
]

func highestScore(_ people: [[String: Any]]) -> String {
    var nameOfHighestScore: String = ""
    var highestScore: Int = 0
    
    for p in people {
        let score = p["score"]
        if score as! Int > highestScore {
            let firstName = p["firstName"]
            let lastName = p["lastName"]
            highestScore = score as! Int
            nameOfHighestScore = (firstName as! String) + " " + (lastName as! String)
        }
            
    }
    
    return nameOfHighestScore
}


highestScore(people)










