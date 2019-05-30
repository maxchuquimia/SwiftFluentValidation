//
//  TestModel.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

struct TestModel {

    let emptyArray: [String] = []
    let threeItemArray: [Int] = [1, 2, 3]

    let emptyString: String = ""
    let threeCharString: String = "123"
    let helloWorld: String = "Hello World!"

    let intZero: Int = 0
    let intTen: Int = 10

    let floatFive: Float = 5
    let floatFifty: Float = 50

    let doubleNine: Double = 9
    let doubleTwentyFive: Double = 25
}

let testModel = TestModel()
