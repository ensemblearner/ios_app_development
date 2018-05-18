//
//  Car.swift
//  Classes And Objects
//
//  Created by Mohitdeep Singh on 5/18/18.
//  Copyright © 2018 Mohitdeep Singh. All rights reserved.
//

import Foundation


enum CarType {
    case Sedan
    case Coupe
    case HatchBack
}

class Car {
    var color : String = "Black"
    var numberOfSeats : Int = 5
    var typeOfCar : CarType = .Coupe
    
    init() {
    }
    
    convenience init(carColor : String) {
        self.init()
        color = carColor
        
    }
    func drive() {
        print("car is moving")
    }
}
