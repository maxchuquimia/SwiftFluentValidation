//
//  Result+Extension.swift
//  FluentValidationTests
//
//  Created by Max Chuquimia on 29/5/19.
//  Copyright © 2019 Chuquimian Productions. All rights reserved.
//

import Foundation

extension Result {

    var error: Failure? {
        switch self {
        case .failure(let x): return x
        default: return nil
        }
    }

    var value: Success? {
        switch self {
        case .success(let x): return x
        default: return nil
        }
    }
}
