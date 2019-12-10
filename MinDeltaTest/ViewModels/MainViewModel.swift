//
//  MainViewModel.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 09/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation
import Combine

enum TestType {
    case football
    case weather
}

class MainViewModel: ObservableObject {
    
    var goToTestClosure: ((TestType)->Void)?
    
    let footballSectionName = "Football"
    let weatherSectionName = "Weather"
    
    func goToFootballTest() {
        goToTest(of: .football)
    }
    
    func goToWeatherTest() {
        goToTest(of: .weather)
    }
    
    private func goToTest(of type: TestType) {
        goToTestClosure?(type)
    }
}
