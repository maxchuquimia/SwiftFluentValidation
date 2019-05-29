//
//  Rule+String.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

public extension Rule where Value == String {

    /// Validates that the string is empty
    func isEmpty() -> Self {
        add(validator: { $0.isEmpty })
        return self
    }
}
