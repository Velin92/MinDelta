//
//  TestViewModel.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 10/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

enum ExceptionModel {
    case none
    case empty
    case error
}

class TestViewModel: ObservableObject {
    
    @Published private var cellViewModels = [ListCellViewModel]()
    @Published private var type: TestType
    @Published var isFiltering = false
    @Published var exception = ExceptionModel.none
    
    var backClosure: (()->Void)?
    private let parser: Parser
    
    let backButtonText = "Back"
    
    var filteredCellViewModels: [ListCellViewModel]  {
        if !isFiltering {
            return cellViewModels
        } else {
            if let min = cellViewModels.min(by: {$0.delta <= $1.delta})?.delta {
                return cellViewModels.filter({$0.delta == min})
            }
            return [ListCellViewModel]()
        }
    }
    
    var exceptionMessage: String {
        switch exception {
        case .error:
            return "An error has occurred while fetching data"
        case .empty:
            return "Empty data"
        default:
            return ""
        }
    }
    
    var switchMessage: String {
        switch type {
        case .football:
            return "Filter for lowest goal difference"
        case .weather:
            return "Filter for lowest thermal excursion"
        }
    }
    
    var firstColumnName: String {
        switch type {
        case .football:
            return "Team"
        case .weather:
            return "Day"
        }
    }
    
    var secondColumnName: String {
        switch type {
        case .football:
            return " F "
        case .weather:
            return "Max"
        }
    }
    
    var thirdColumnName: String {
        switch type {
        case .football:
            return " A "
        case .weather:
            return "Min"
        }
    }
    
    var testName: String {
        switch type {
        case .football:
            return "Football Test "
        case .weather:
            return "Weather Test"
        }
    }
    
    init(parser: Parser, type: TestType) {
        self.type = type
        self.parser = parser
    }
    
    func parseModels() {
        do {
            var results: [Deltable]?
            switch type {
            case .football:
                results = try parser.parseFootballTeams()
            case .weather:
                results = try parser.parseWeather()
            }
            if let results = results {
                cellViewModels = results.compactMap(ListCellViewModel.init)
            }
            if cellViewModels.isEmpty {
                exception = .empty
            }
        } catch {
            exception = .error
        }
    }
    
    func back() {
        backClosure?()
    }
}
