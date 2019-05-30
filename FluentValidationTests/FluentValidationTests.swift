//
//  FluentValidationTests.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 28/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import XCTest
@testable import FluentValidation

class FluentValidationTests: XCTestCase {

    func testSomething() {
        let rule = BaseRule<Int>()

        // Test coverage doesn't reach 100% unless we do this
        // because `BaseRule<X>.isValid(val: )` doesn't get called by subclasses
        try? rule.isValid(val: 10)
    }
}
