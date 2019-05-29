//
//  Rule+Comparable.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

public extension Rule where Value: Comparable {

    /// Validates that the value is greater than `x`
    func greaterThan(_ x: Value) -> Self {
        add(validator: { $0 > x })
        return self
    }

    /// Validates that the value is less than `x`
    func lessThan(_ x: Value) -> Self {
        add(validator: { $0 < x })
        return self
    }

    /// Validates that the value is greater than or equal to `x`
    func greaterThanOrEqualTo(_ x: Value) -> Self {
        add(validator: { $0 >= x })
        return self
    }

    /// Validates that the value is less than or equal to `x`
    func lessThanOrEqualTo(_ x: Value) -> Self {
        add(validator: { $0 <= x })
        return self
    }

    /// Validates that the value is not equal to `x`
    func notEqualTo(_ x: Value) -> Self {
        add(validator: { $0 != x })
        return self
    }
}
