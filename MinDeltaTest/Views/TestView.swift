//
//  TestView.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 10/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import SwiftUI

struct TestView: View {
    
    @ObservedObject var viewModel: TestViewModel
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Toggle(isOn: $viewModel.isFiltering){
                        Text(viewModel.switchMessage)
                        .scaledToFit()
                    }
                }
                HStack {
                    Text(viewModel.firstColumnName)
                        .bold()
                    Spacer()
                    Text(viewModel.secondColumnName)
                        .bold()
                    Text(viewModel.thirdColumnName)
                        .bold()
                }
                ForEach(viewModel.filteredCellViewModels) { viewModel in
                    ListCellView(viewModel: viewModel)
                }
            }.navigationBarTitle(viewModel.testName)
                .navigationBarItems(leading: Button(action: viewModel.back) {
                    Text(viewModel.backButtonText)
            })
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        let testViewModel = TestViewModel(parser: DatParser(), type: .football)
        testViewModel.parseModels()
        return TestView(viewModel: testViewModel)
    }
}
