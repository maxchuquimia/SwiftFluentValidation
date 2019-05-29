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
//public class OptionalRule<X, Value>: Rule<X, Optional<Value>> {
//
//    private var unwrappedRule: Rule<X, Value>?
//
//    override func isValid(val: X) throws {
//
//    }
//}
//
//public extension OptionalRule {
//
//    func isNone() -> Self {
//        add(validator: {
//            switch $0 {
//            case .none: return true
//            case .some: return false
//            }
//        })
//        return self
//    }
//
//    func isSome() -> Rule<X, Value> {
//
//        add(validator: {
//            switch $0 {
//            case .none: return false
//            case .some: return true
//            }
//        })
//
//        fatalError()
//
////        if let rule = self.unwrappedRule {
////            return rule
////        } else {
////            let unwrappedRule = Rule<X, Value>(path: path)
////            self.unwrappedRule = unwrappedRule
////            return unwrappedRule
////        }
//    }
//}
