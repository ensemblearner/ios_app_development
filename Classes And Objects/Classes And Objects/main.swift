//
//  main.swift
//  Classes And Objects
//
//  Created by Mohitdeep Singh on 5/18/18.
//  Copyright © 2018 Mohitdeep Singh. All rights reserved.
//

import Foundation


let myCar = Car()
print(myCar.color)

let richCar = Car(carColor: "Pink")
print(richCar.color)
myCar.drive()
let tesla = SelfDrivingCar()
tesla.destination = "Toronto"
tesla.drive()
