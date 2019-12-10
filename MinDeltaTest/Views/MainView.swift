//
//  ContentView.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 08/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            Form {
                SectionButton(text: viewModel.footballSectionName, action: viewModel.goToFootballTest)
                SectionButton(text: viewModel.weatherSectionName, action: viewModel.goToWeatherTest)
            }.navigationBarTitle("Choose A Test")
        }
    }
}

struct SectionButton: View {
    let text: String
    let action: ()->Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                Spacer()
                Image(systemName: "chevron.right")
            }
        }.foregroundColor(Color(UIColor.label))
    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
