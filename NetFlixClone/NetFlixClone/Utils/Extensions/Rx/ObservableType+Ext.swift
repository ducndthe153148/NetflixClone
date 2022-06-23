//
//  ObservableType+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 28/10/2021.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    func ignoreAll() -> Observable<Void> {
        return map {_ in}
    }
    
    func unwrap<T>() -> Observable<T> where Element == T? {
        return compactMap { $0 }
    }
    
    func orEmpty() -> Observable<Element> {
        return catchError { _ in
            return .empty()
        }
    }
    
    func map<T>(to value: T) -> Observable<T> {
        return map { _ in value }
    }
    
    func execute(_ selector: @escaping (Element) -> Void) -> Observable<Element> {
        return flatMap { result in
             return Observable
                .just(selector(result))
                .map { _ in result }
                .take(1)
        }
    }
}


extension ObservableType where Element: Collection {

    func mapMany<T>(_ transform: @escaping (Self.Element.Element) -> T) -> Observable<[T]> {
        return self.map { collection -> [T] in
            collection.map(transform)
        }
    }
}

extension Observable where Element == String {
    func mapToURL() -> Observable<URL> {
        return map { URL(string: $0) }.compactMap { $0 }
    }
}

extension Observable where Element == Bool {
    
    func negate() -> Observable<Bool> {
        return map { !$0 }
    }

}

extension Observable where Element: Sequence, Element.Iterator.Element: Comparable {
    
    /*
     Transforms an observable of sequences into an observable of ordered arrays by using the sequence element's
     natural comparator.
     */
    
    func sorted<T>() -> Observable<[T]> where Element.Iterator.Element == T {
        return map { $0.sorted() }
    }
    
    func sorted<T>(_ areInIncreasingOrder: @escaping (T, T) -> Bool) -> Observable<[T]>
        where Element.Iterator.Element == T {
            return map { $0.sorted(by: areInIncreasingOrder) }
    }
}


extension ObservableType where Element == Bool {
    /// Boolean not operator
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
    
}

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
