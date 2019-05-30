//
//  Rule+Optional.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

// Seems like we need to handle optionals manually, for now anyway/
// Who knows what the future of Swift may hold?
public class OptionalRule<X, Value, ErrorType>: Rule<X, Optional<Value>, ErrorType>  where ErrorType: Error {

    private var unwrappedRule: Rule<X, Value, ErrorType>?
    var keyPathOfOptional: KeyPath<X, Value?>

    init(path: KeyPath<X, Value?>) {
        self.keyPathOfOptional = path
        super.init(valueGetter: { $0[keyPath: path] })
    }

    override func isValid(val: X) throws {
        try super.isValid(val: val)
        try unwrappedRule?.isValid(val: val)
    }

    override func getValidationError() -> ErrorType {

        if let unwrappedRule = self.unwrappedRule {
            return unwrappedRule.getValidationError()
        }

        return super.getValidationError()
    }
}

public extension OptionalRule {

    func isNone() -> Self {
        add(validator: {
            switch $0 {
            case .none: return true
            case .some: return false
            }
        })
        return self
    }

    func isSome() -> Rule<X, Value, ErrorType> {

        add(validator: {
            switch $0 {
            case .none: return false
            case .some: return true
            }
        })


        let unwrappedRule = Rule<X, Value, ErrorType>(valueGetter: { [unowned self] object in
            switch object[keyPath: self.keyPathOfOptional] {
            case .none: throw self.getValidationError()
            case .some(let value): return value
            }
        })
        self.unwrappedRule = unwrappedRule
        return unwrappedRule
    }
}
