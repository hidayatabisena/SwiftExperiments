import UIKit

let people = [
    "Jack Ryan", "John Wick", "Jason Bournce", "James Bond", "Tom Clancys", "Sam Fisher", "Jack Ryan Jr", "James Greer", "Kathleen Ryan", "Scott Mitchell", "Sam Driscoll"
]

// Contoh Closures dengan parameter dan return type
let theRyans = people.filter({ (name: String) -> Bool in
    return name.contains("Ryan")
})

print(theRyans)

// Contoh Closures dimana return type nya bisa di omit (dihilangkan)
let theJacks = people.filter { name in
    return name.contains("Ryan")
}

// Shorthand closures, $0, $1 sebagai pengganti argumen
let theJacksPart2 = people.filter({ $0.contains("Jack")} )
theJacksPart2

// trailing closures
let theJacksPart3 = people.filter { $0.contains("Jack") }
theJacksPart3
