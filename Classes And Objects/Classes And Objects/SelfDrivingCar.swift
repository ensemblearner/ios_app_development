//
//  SelfDrivingCar.swift
//  Classes And Objects
//
//  Created by Mohitdeep Singh on 5/18/18.
//  Copyright © 2018 Mohitdeep Singh. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car{
    
    var destination : String?
    
    
    override func drive() {
        super.drive()
        if let userDestination = destination{
            print("driving to \(userDestination)")
        }
    }
    
}
