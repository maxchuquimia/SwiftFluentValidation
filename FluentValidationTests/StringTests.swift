//
//  StringTests.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 30/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import XCTest
@testable import FluentValidation

class StringTests: XCTestCase {

    func testIsEmpty() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyString).isEmpty().error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsEmptyFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeCharString).isEmpty().error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testIsNotEmpty() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeCharString).isNotEmpty().error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsNotEmptyFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyString).isNotEmpty().error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testMinimumLength() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeCharString).minimumLength(3).error(.a)
                rule(\.threeCharString).minimumLength(1).error(.b)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testMinimumLengthFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeCharString).minimumLength(4).error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testMaximumLength() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeCharString).maximumLength(3).error(.a)
                rule(\.threeCharString).maximumLength(5).error(.b)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testMaximumLengthFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeCharString).maximumLength(2).error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testLengthBetween() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeCharString).length(isBetween: 1, and: 4).error(TestError.a)
                rule(\.threeCharString).length(isBetween: 2, and: 3).error(TestError.b)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testLengthBetweenFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeCharString).length(isBetween: 5, and: 10).error(TestError.a)
            }
        }

        XCTAssertFail(Validator())
    }
}
