import UIKit

// IF Statements
let temperature = 24

if temperature <= 24 {
    print("====> Dingin bingits....")
}

// if-else statements
let temperatureAC = 22

if temperatureAC >= 30 {
    print("====> Udara panas")
} else {
    print("====> Udara dingin")
}

// if-else boolean value
let temperatureRuangan = 45

if temperatureRuangan >= 35 && temperatureRuangan <= 40 {
    print("====> Udara Palembang banget deh")
} else if (temperatureRuangan == 22) {
    print("====> Bandung beut dah")
} else {
    print("====> warga culabaya udah biasa")
}

// switch statements

let krlDeparture = 6

switch krlDeparture {
case 5:
    print("KRL masih kosong")
case 6:
    print("KRL mulai chaos")
case 7:
    print("Jadi cakwe goyang")
case 8:
    print("udah siap siap resign aja")
default:
    print("Anda udah layak jadi pengangguran")
}

// Ternary Operator

var flashSale: Int
let a = 2
let b = 4

if a > b {
    flashSale = a
} else {
    flashSale = b
}

// rewrite
flashSale = a > b ? a : b

// String Interpolation
let name = "John Wick"
let age = 50

print("====> \(name) umurnya \(age)")


// Functions
func displayPi() {
    print("3.141592")
}

displayPi()

// Function dengan parameter
func triple(value: Int) {
    let result = value * 3
    print("====> If you multiply \(value) by 3, you'll get \(result)")
}

// Function dengan multiple parameter
func multiply(firstNumber: Int, secondNumber: Int) {
    let result = firstNumber * secondNumber
    print("====> The results is \(result)")
}

let hasil: () = multiply(firstNumber: 10, secondNumber: 5)
print(hasil)

// function ada return value
func multiply2(fourthNumber: Int, fifthNumber: Int) -> Int {
    let result = fourthNumber + fifthNumber
    print("====> The results if \(result)")
    
    return result
}

let myResult = multiply2(fourthNumber: 10, fifthNumber: 5)
print("====> 10 ditambah 5 sama dengan \(myResult)")

// Function yang ada argument labels
func sayHello(to person: String, and anotherPerson: String) {
    print("Hello \(person) and \(anotherPerson)")
}

sayHello(to: "John", and: "Lisa")

// omitting labels
func add(_ firstNumber:Int, to secondNumber: Int = 0) -> Int {
    return firstNumber + secondNumber
}

add(10, to: 8)

// Struct
struct Shirt {
    var size: String
    var color: String
}

let myShirt = Shirt(size: "XL", color: "Blue")
let yourShirt = Shirt(size: "M", color: "Red")

// Dari API biasanya dapat data JSON berupa Dictionary (Key Value)
var myDict: [String:Int] = [
    "a": 1,
    "b": 2,
    "c": 3
]

// menghapus item dari data dictionary
myDict.removeValue(forKey: "c")

// mangakses item dari dictionary
let item = myDict["b"]

// mengupdate item dari dictionary
myDict["a"] = 5

// looping item di dalam dictionary
for (key, value) in myDict {
    print("====> Isi Dictionary saya adalah \(key): \(value)")
}

// mendapatkan semua values dari dictionary
let values = Array(myDict.keys)
print(values)



