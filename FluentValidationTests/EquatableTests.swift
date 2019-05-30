//
//  EquatableTests.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 30/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import XCTest
@testable import FluentValidation

class EquatableTests: XCTestCase {

    func testIsEqual() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.helloWorld).equalTo("Hello World!").error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsEqualFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.helloWorld).equalTo("Byeee").error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testIsNotEqual() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.helloWorld).notEqualTo("1 2 3 4 5").error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testIsNotEqualFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.helloWorld).notEqualTo("Hello World!").error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }
}
