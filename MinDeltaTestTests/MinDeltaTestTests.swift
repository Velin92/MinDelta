//
//  MinDeltaTestTests.swift
//  MinDeltaTestTests
//
//  Created by Mauro Romito on 08/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import XCTest
@testable import MinDeltaTest

class MockParser: Parser {
    
    let exception: ExceptionModel
    
    init(exception: ExceptionModel) {
        self.exception = exception
    }
    
    func parseFootballTeams() throws -> [FootballTeamModel] {
        switch exception {
        case .empty:
            return []
        case .error:
            throw ParserError.fileNotFound
        case .none:
            return [FootballTeamModel(name: "Test", scoredGoals: 10, concededGoals: 5)]
        }
    }
    
    func parseWeather() throws -> [WeatherDayModel] {
        switch exception {
        case .empty:
            return []
        case .error:
            throw ParserError.fileNotFound
        case .none:
            return [WeatherDayModel(day: 10, maxTemperature: 10, minTemperature: 10)]
        }
    }
}

class MinDeltaTestTests: XCTestCase {
    
    func testFootballParsing() {
        let bundle = Bundle.init(for: type(of: self))
        let teams = try! DatParser().parseFootballTeams(from: bundle, named: "football_test")
        XCTAssert(teams.count == 2)
        XCTAssert(teams[0].id == "Arsenal")
        XCTAssert(teams[1].id == "Liverpool")
        XCTAssert(teams[0].scoredGoals == 79)
        XCTAssert(teams[1].scoredGoals == 67)
        XCTAssert(teams[0].concededGoals == 36)
        XCTAssert(teams[1].concededGoals == 30)
    }
    
    func testWeatherParser() {
        let bundle = Bundle.init(for: type(of: self))
        let days = try! DatParser().parseWeather(from: bundle, named: "weather_test")
        XCTAssert(days.count == 2)
        XCTAssert(days[0].day == 1)
        XCTAssert(days[1].day == 2)
        XCTAssert(days[0].minTemperature == 59)
        XCTAssert(days[1].minTemperature == 63)
        XCTAssert(days[0].maxTemperature == 88)
        XCTAssert(days[1].maxTemperature == 79)
    }
    
    func testNoFile() {
        let bundle = Bundle.init(for: type(of: self))
        XCTAssertThrowsError(try DatParser().parseWeather(from: bundle, named: "no_file"))
        XCTAssertThrowsError(try DatParser().parseFootballTeams(from: bundle, named: "no_file"))
    }
    
    func testTestViewIsEmpty() {
        var viewModel = TestViewModel(parser: MockParser(exception: .empty), type: .football)
        viewModel.parseModels()
        XCTAssert(viewModel.exception == .empty)
        XCTAssert(viewModel.exceptionMessage == "Empty data")
        viewModel = TestViewModel(parser: MockParser(exception: .empty), type: .weather)
        viewModel.parseModels()
        XCTAssert(viewModel.exception == .empty)
        XCTAssert(viewModel.exceptionMessage == "Empty data")
    }
    
    func testViewIsInError() {
        var viewModel = TestViewModel(parser: MockParser(exception: .error), type: .football)
        viewModel.parseModels()
        XCTAssert(viewModel.exception == .error)
        XCTAssert(viewModel.exceptionMessage == "An error has occurred while fetching data")
        viewModel = TestViewModel(parser: MockParser(exception: .error), type: .weather)
        viewModel.parseModels()
        XCTAssert(viewModel.exception == .error)
        XCTAssert(viewModel.exceptionMessage == "An error has occurred while fetching data")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
