//
//  Helper+Rx.swift
//  Engage-Mobi
//
//  Created by V001695 on 01/11/2021.
//

import Foundation
import RxSwift
import RxCocoa  
// - MARK: Internal Helpers
func castOptionalOrFatalError<T>(_ value: Any?) -> T? {
    if value == nil {
        return nil
    }
    let v: T = castOrFatalError(value)
    return v
}

func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }
    return returnValue
}

func castOrFatalError<T>(_ value: Any!) -> T {
    let maybeResult: T? = value as? T
    guard let result = maybeResult else {
        fatalError("Failure converting from \(value ?? "") to \(T.self)")
    }
    
    return result
}
