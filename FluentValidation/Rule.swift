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

public class Rule<X, Value>: BaseRule<X> {

    public typealias Validator = (Value) -> Bool

    private let path:  KeyPath<X, Value>
    private var validators: [Validator] = []
    private var validationFailureReason: Error!

    internal init(path: KeyPath<X, Value>) {
        self.path = path
        super.init()
    }

    public func error(_ error: Error) {
        validationFailureReason = error
    }

    internal override func isValid(val: X) throws {

        let property = val[keyPath: path]

        for isValid in validators {
            if !isValid(property) {
                throw validationFailureReason
            }
        }
    }

    internal func add(validator: @escaping Validator) {
        validators.append(validator)
    }
}
