//
//  FluentValidator.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 28/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

public class FluentValidator<TargetType, ErrorType> where ErrorType: Error {

    internal var rules: [BaseRule<TargetType>] = []

    public func rule<Value>(_ path: KeyPath<TargetType, Value>) -> Rule<TargetType, Value, ErrorType> {
        let rule = Rule<TargetType, Value, ErrorType>(path: path)
        rules.append(rule)
        return rule
    }

    public func rule<Value>(_ path: KeyPath<TargetType, Optional<Value>>) -> OptionalRule<TargetType, Value, ErrorType> {
        let rule = OptionalRule<TargetType, Value, ErrorType>(path: path)
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
