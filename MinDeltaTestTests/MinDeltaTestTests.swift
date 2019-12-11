//
//  MinDeltaTestTests.swift
//  MinDeltaTestTests
//
//  Created by Mauro Romito on 08/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import XCTest
@testable import MinDeltaTest

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
        XCTAssert(teams[0].scoredGoals == 30)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
