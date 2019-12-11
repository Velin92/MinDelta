//
//  FootbalTeamCellView.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 10/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import SwiftUI

struct ListCellView: View {
    
    let viewModel: ListCellViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.name)
            Spacer()
            Text("\(viewModel.value1)")
            Text("\(viewModel.value2)")
        }
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        let testModel = FootballTeamModel(name: "Arsenal", scoredGoals: 100, concededGoals: 50)
        return ListCellView(viewModel: ListCellViewModel(model: testModel))
    }
}
