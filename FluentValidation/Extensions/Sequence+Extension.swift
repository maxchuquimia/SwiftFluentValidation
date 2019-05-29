//
//  Sequence+Extension.swift
//  FluentValidation
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

internal extension Sequence {

    var isEmpty: Bool {
        var isEmpty = true

        for _ in self {
            isEmpty = false
            break
        }

        return isEmpty
    }

    var count: Int {
        var _count = 0

        for _ in self {
            _count += 1
        }

        return _count
    }
}
