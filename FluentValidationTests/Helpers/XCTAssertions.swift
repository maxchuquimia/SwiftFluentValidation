//
//  FluentValidator+Extension.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 30/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import XCTest
import FluentValidation

func XCTAssertSuccess(_ validator: FluentValidator<TestModel, TestError>) {
    XCTAssertNil(validator.validate(testModel).error)
}

func XCTAssertFail(_ validator: FluentValidator<TestModel, TestError>) {
    XCTAssertNotNil(validator.validate(testModel).error)
}

func XCTAssertFail(_ validator: FluentValidator<TestModel, TestError>, _ error: TestError) {
    XCTAssertEqual(validator.validate(testModel).error, error)
}
