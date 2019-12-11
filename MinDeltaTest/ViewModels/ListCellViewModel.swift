//
//  ListCellViewModel.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 10/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

class ListCellViewModel: Identifiable {
    
    let id = UUID()
    
    var name: String {
        return model.id
    }
    
    var value1: String {
        return "\(model.value1)\(model.metric)"
    }
    
    var value2: String {
        return "\(model.value2)\(model.metric)"
    }
    
    var delta: Int {
        return model.value1 - model.value2
    }
    
    let model: Deltable
    
    init(model: Deltable) {
        self.model = model
    }
}
