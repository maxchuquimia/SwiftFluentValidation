//
//  FluentValidator.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 28/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

struct Test {
    let count: Int
    let opt: Int?
}

public class FluentValidator<TargetType, ErrorType> where ErrorType: Error {

    internal var rules: [BaseRule<TargetType>] = []

    public func rule<Value>(_ path: KeyPath<TargetType, Value>) -> Rule<TargetType, Value> {
        let rule = Rule<TargetType, Value>(path: path)
        rules.append(rule)
        return rule
    }

    public func rule<Value>(_ path: KeyPath<TargetType, Optional<Value>>) -> OptionalRule<TargetType, Value> {
        let rule = OptionalRule<TargetType, Value>(path: path)
        rules.append(rule)
        return rule
    }

    public func validate(_ value: TargetType) -> Result<Void, ErrorType> {

        do {
            for rule in rules {
                try rule.isValid(val: value)
            }
        } catch {
            return .failure(error as! ErrorType)
        }

        return .success(())
    }
}

class ExampleValidator: FluentValidator<Test, ExampleValidator.ValidationError> {

    enum ValidationError: LocalizedError {
        case tooBig
    }

    override init() {
        super.init()
        rule(\.opt).isNone().error(ValidationError.tooBig)//.greaterThan(10).error(ValidationError.tooBig)
    }
}
