//
//  SequenceTests.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import XCTest
@testable import FluentValidation

class SequenceTests: XCTestCase {

    func testIsEmpty() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyArray).isEmpty().error(.a)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertNil(result.error)
    }

    func testIsEmptyFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).isEmpty().error(.a)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertEqual(result.error, TestError.a)
    }

    func testIsNotEmpty() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).isNotEmpty().error(.a)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertNil(result.error)
    }

    func testIsNotEmptyFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyArray).isNotEmpty().error(.a)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertEqual(result.error, TestError.a)
    }

    func testMinimumLength() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).minimumLength(3).error(.a)
                rule(\.threeItemArray).minimumLength(1).error(.b)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertNil(result.error)
    }

    func testMinimumLengthFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).minimumLength(4).error(.a)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertEqual(result.error, TestError.a)
    }

    func testMaximumLength() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).maximumLength(3).error(.a)
                rule(\.threeItemArray).maximumLength(5).error(.b)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertNil(result.error)
    }

    func testMaximumLengthFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).maximumLength(2).error(.a)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertEqual(result.error, TestError.a)
    }

    func testLengthBetween() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).length(isBetween: 1, and: 4).error(TestError.a)
                rule(\.threeItemArray).length(isBetween: 2, and: 3).error(TestError.b)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertNil(result.error)
    }

    func testLengthBetweenFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).length(isBetween: 5, and: 10).error(TestError.a)
            }
        }

        let sut = Validator()

        let result = sut.validate(testModel)

        XCTAssertEqual(result.error, TestError.a)
    }
}
