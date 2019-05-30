//
//  Rule+Equatable.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

public extension Rule where Value: Equatable {

    /// Validates that the value is equal to `x`
    func equalTo(_ x: Value) -> Self {
        add(validator: { $0 == x })
        return self
    }

    /// Validates that the value is not equal to `x`
    func notEqualTo(_ x: Value) -> Self {
        add(validator: { $0 != x })
        return self
    }
}
