//
//  Rule+Custom.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

public extension Rule {

    /// Verifies that the value passes the test `f`
    func must(_ f: @escaping Validator) -> Self {
        add(validator: f)
        return self
    }
}
