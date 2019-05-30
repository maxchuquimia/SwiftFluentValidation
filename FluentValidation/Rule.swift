//
//  Rule.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

// This is more powerful than a protocol in our case
public class BaseRule<X> {
    internal func isValid(val: X) throws { }
    internal init() { }
}

public class Rule<X, Value, ErrorType>: BaseRule<X> where ErrorType: Error {

    public typealias Validator = (Value) -> Bool
    public typealias PropertyGetter = (X) throws -> (Value)

    private var validators: [Validator] = []
    private var validationFailureReason: ErrorType!
    private let propertyGetter: PropertyGetter

    internal init(valueGetter: @escaping PropertyGetter) {
        self.propertyGetter = valueGetter
        super.init()
    }

    internal convenience init(path: KeyPath<X, Value>) {
        self.init(valueGetter: { $0[keyPath: path] })
    }

    public func error(_ error: ErrorType) {
        validationFailureReason = error
    }

    internal override func isValid(val: X) throws {

        let property = try propertyGetter(val)

        for isValid in validators {
            if !isValid(property) {
                throw getValidationError()
            }
        }
    }

    internal func add(validator: @escaping Validator) {
        validators.append(validator)
    }

    // Subclasses can override the error
    internal func getValidationError() -> ErrorType {
        return validationFailureReason
    }
}
