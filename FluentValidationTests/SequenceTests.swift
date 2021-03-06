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

        XCTAssertSuccess(Validator())
    }

    func testIsEmptyFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).isEmpty().error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testIsNotEmpty() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).isNotEmpty().error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsNotEmptyFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyArray).isNotEmpty().error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testMinimumLength() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).minimumLength(3).error(.a)
                rule(\.threeItemArray).minimumLength(1).error(.b)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testMinimumLengthFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).minimumLength(4).error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testMaximumLength() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).maximumLength(3).error(.a)
                rule(\.threeItemArray).maximumLength(5).error(.b)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testMaximumLengthFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).maximumLength(2).error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testLength() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).length(3).error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testLengthFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.emptyArray).length(3).error(.a)
            }
        }

        XCTAssertFail(Validator())
    }


    func testLengthBetween() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).length(isBetween: 1, and: 4).error(.a)
                rule(\.threeItemArray).length(isBetween: 2, and: 3).error(.b)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testLengthBetweenFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.threeItemArray).length(isBetween: 5, and: 10).error(.a)
            }
        }

        XCTAssertFail(Validator())
    }
}
