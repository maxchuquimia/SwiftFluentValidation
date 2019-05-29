//
//  Rule+Sequence.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

public extension Rule where Value: Sequence {

    /// Validates that the Sequence is empty
    func isEmpty() -> Self {
        add(validator: { $0.isEmpty })
        return self
    }

    /// Validates that the Sequence is not empty
    func isNotEmpty() -> Self {
        add(validator: { !$0.isEmpty })
        return self
    }

    /// Validates that the Sequence is at least `x` in length
    func minimumLength(_ x: Int) -> Self {
        add(validator: { $0.count >= x })
        return self
    }

    /// Validates that the Sequence's length is `x` at the most
    func maximumLength(_ x: Int) -> Self {
        add(validator: { $0.count <= x })
        return self
    }

    /// Validates that the length is between `x` and `y`, inclusively
    func length(isBetween x: Int, and y: Int) -> Self {
        add(validator: {
            let count = $0.count
             return count >= x && count <= y
        })
        return self
    }
}
