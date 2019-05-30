//
//  CustomTests.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 30/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import XCTest
@testable import FluentValidation

private func returnTrue(_ val: String) -> Bool {
    return true
}

private func returnFalse(_ val: String) -> Bool {
    return false
}

class CustomTests: XCTestCase {

    func testPasses() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyString).must(returnTrue).error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyString).must(returnFalse).error(.a)
            }
        }

        XCTAssertFail(Validator())
    }

    func testMultiple() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyString).must(returnTrue).must(returnTrue).error(.a)
                rule(\.emptyString).must(returnTrue).error(.b)
                rule(\.emptyString).must(returnFalse).error(.c)
                rule(\.emptyString).must(returnFalse).error(.d)
            }
        }

        XCTAssertFail(Validator(), .c)
    }
}
