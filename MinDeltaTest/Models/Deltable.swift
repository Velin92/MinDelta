//
//  Deltable.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 10/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation

protocol Deltable {
    var metric: String {get}
    var id: String {get}
    var value1: Int {get}
    var value2: Int {get}
    var delta: Int {get}
}
