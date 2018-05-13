//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var foo = "bar"

var age : Int = 21
Float(age)/2

var myDetails = "\(foo), \(age)"



func getMilk(howManyGallons : Int) {
    print("get \(howManyGallons) milk from market")
}

getMilk(howManyGallons: 200)

func calculatePriceToPay(howManyGallons : Int) -> Int {
    let pricePerGallon : Int = 2
    let priceToPay = howManyGallons * pricePerGallon
    return priceToPay
    
}
var moneyToPay = calculatePriceToPay(howManyGallons:20)


func loveCalculator(yourName: String, theirName: String) -> String{
    let score = arc4random_uniform(101)
    if score > 80{
        return "You love each other"
    }
        
    else if score > 40 && score <= 80{
        return "some spark is there.. not a lot.. some"
    }
    else{
        return "you dont love each other"
    }
}

loveCalculator(yourName: "foo", theirName: "bar")


func bmiCalculator(mass: Int, height: Int) -> Double{
    if height == 0 {
        return 0.0
    }
    let bmi = Double(mass) / pow(Double(height), 2.0)
    return bmi
}

var bmi = bmiCalculator(mass: 30, height: 2)



let arrayOfNumbers = [1,2,3,4,5]

var sum = 0

for number in arrayOfNumbers{
    sum += number
}
print(sum)

for number in 1...10{
    print(number)
}

for number in 1...10 where number % 2 == 0{
    print(number)
}


func fibonacciNumbers(until n: Int) -> Int {
    if n == 0 {
        return 0
    }
    else if n == 1{
        return 1
    }
    var secondLast = 0;
    var last = 1
    var this = 0
    for number in 2...n {
        this = last + secondLast
        secondLast = last
        last = this
        
    }
    
    return this
    
}


var fib = fibonacciNumbers(until: 6)
print(fib)



