//
//  FootballGameModel.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 08/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

struct FootballTeamModel: Deltable {
    let metric = ""
    //I am also considering negative values here
    var delta: Int {
        return value1 - value2
    }
    
    var id: String {
        return name.replacingOccurrences(of: "_", with: " ").capitalized
    }
    
    var value1: Int {
        return self.scoredGoals
    }
    
    var value2: Int {
        return self.concededGoals
    }
    
    
    init(name: String, scoredGoals: Int, concededGoals: Int) {
        self.name = name
        self.scoredGoals = scoredGoals
        self.concededGoals = concededGoals
    }
    
    private let name: String
    
    //goal segnati
    let scoredGoals: Int
    //goal subiti
    let concededGoals: Int
}
