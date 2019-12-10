//
//  ListCellViewModel.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 10/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

class ListCellViewModel: Identifiable {
    
    var id: String {
        return model.id
    }
    
    var value1: Int {
        return model.value1
    }
    
    var value2: Int {
        return model.value2
    }
    
    var delta: Int {
        return value1 - value2
    }
    
    let model: Deltable
    
    init(model: Deltable) {
        self.model = model
    }
}
