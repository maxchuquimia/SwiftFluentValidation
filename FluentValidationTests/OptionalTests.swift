//
//  OptionalTests.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 30/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import XCTest
@testable import FluentValidation

class OptionalTests: XCTestCase {

    func testNone() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.noneOptionalString).isNone().error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testNoneFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.someOptionalString).isNone().error(.a)
            }
        }

        XCTAssertFail(Validator())
    }

    func testSome() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.someOptionalString).isSome().error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testSomeFails() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.noneOptionalString).isSome().error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }

    func testSomeChain() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.someOptionalString).isSome().equalTo("some").error(.a)
            }
        }

        XCTAssertSuccess(Validator())
    }

    func testSomeChainFail() {

        class Validator: FluentValidator<TestModel, TestError> {

            override init() {
                super.init()
                rule(\.someOptionalString).isSome().equalTo("hellloooo").error(.a)
            }
        }

        XCTAssertFail(Validator(), .a)
    }
}
