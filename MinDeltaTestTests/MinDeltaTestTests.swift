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

    func testParser() {
        print(try? DatParser().parseFootballTeams())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
