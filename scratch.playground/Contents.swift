//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//t = (log(A/P) / log(1+r/n)) / n

//n=4, r=10/100, A=2, P=1
let n = 4
let r = 10.0/100
let A = 2
let P = 1
log(2)/log(1 + 0.1 / 4) / 4
log(2)/( log(1 + 0.1 / 4) )/4.0


enum InterestTimes{
    static let perAnnum = "% per annum"
    static let perMonth = "% per month"
    static let perDay = "% per day"
    static let allValues = [perAnnum, perMonth, perDay]
    
}

InterestTimes.allValues[1]


