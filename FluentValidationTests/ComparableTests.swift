//
//  ComparableTests.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 30/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import XCTest
@testable import FluentValidation

class ComparableTests: XCTestCase {

    func testIsGreaterThan() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.intZero).greaterThan(-10).error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsGreaterThanFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.intZero).greaterThan(0).error(.a)
            }
        }

        XCTAssertFail(Validator())
    }

    func testIsGreaterThanOrEqual() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.intZero).greaterThanOrEqualTo(0).error(.a)
                rule(\.intTen).greaterThanOrEqualTo(-10).error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsGreaterThanOrEqualFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.intTen).greaterThanOrEqualTo(20).error(.a)
            }
        }

        XCTAssertFail(Validator())
    }

    func testIsLessThan() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.floatFive).lessThan(10).error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsLessThanFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.floatFive).lessThan(0).error(.a)
            }
        }

        XCTAssertFail(Validator())
    }

    func testIsLessThanOrEqual() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.doubleNine).lessThanOrEqualTo(9).error(.a)
                rule(\.doubleNine).lessThanOrEqualTo(99).error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsLessThanOrEqualFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.doubleNine).lessThanOrEqualTo(1.3).error(.a)
            }
        }

        XCTAssertFail(Validator())
    }
}
