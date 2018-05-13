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
    else{
        return "you dont love each other"
    }
}

loveCalculator(yourName: "foo", theirName: "bar")


