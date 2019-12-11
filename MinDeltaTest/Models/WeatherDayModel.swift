//
//  WeatherDayModel.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 10/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

struct WeatherDayModel: Deltable {
    let metric = "F"
    
    var delta: Int {
        return value2 - value1
    }
    
    var id: String {
        return "\(day)"
    }
    
    var value1: Int {
        return maxTemperature
    }
    
    var value2: Int {
        return minTemperature
    }
    
    let day: Int
    let maxTemperature: Int
    let minTemperature: Int
}
