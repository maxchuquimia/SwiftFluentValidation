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

    func nothing() {

        func proceed() {}
        func handle(error: Error) {

        }

struct CustomerModel {
    let name: String
    let age: Int
    let addressLines: [String]?
    let emailAddress: String
}


class CustomerValidator: FluentValidator<CustomerModel, CustomerValidator.Problem> {

    enum Problem: Error {
        case noName, underage, invalidAddress, invalidEmail
    }

    override init() {
        super.init()

        rule(\.name).isNotEmpty().error(.noName)
        rule(\.age).greaterThanOrEqualTo(18).error(.underage)
        rule(\.addressLines).isSome().length(isBetween: 1, and: 4).error(.invalidAddress)
        rule(\.emailAddress).must(beAnEmailAddress).error(.invalidEmail)
    }

    static func validate(customer c: CustomerModel) -> Problem? {

        guard !c.name.isEmpty else { return .noName }
        guard c.age >= 18 else { return .underage }
        guard let l = c.addressLines?.count, l >= 1 && l <= 4 else { return .invalidAddress }
        guard isAnEmailAddress(c.emailAddress) else { return .invalidEmail }

        return nil // Success!
    }

    private func beAnEmailAddress(value: String) -> Bool {
        // Execute custom logic
        return true
    }

    static func isAnEmailAddress(_ c: String) -> Bool {
        // Execute custom logic
        return true
    }
}


        let validator = CustomerValidator()

        let customer = CustomerModel(name: "Henry Kendall", age: 43, addressLines: nil, emailAddress: "")

        // result is Result<Void, CustomerValidator.Problem>
        let result = validator.validate(customer)

        switch result {
        case .success: proceed()
        case .failure(let problem): handle(error: problem)
        }


    }
}
