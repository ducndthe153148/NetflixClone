//
//  WebKit+Rx.swift
//  Engage-Mobi
//
//  Created by V001695 on 01/11/2021.
//
import Foundation
import WebKit
import RxSwift
import RxCocoa

extension Reactive where Base: WKWebView {
    /**
     Reactive wrapper for `title` property
     */
    public var title: Observable<String?> {
        return self.observeWeakly(String.self, "title")
    }

    /**
     Reactive wrapper for `loading` property.
     */
    public var loading: Observable<Bool> {
        return self.observeWeakly(Bool.self, "loading")
            .map { $0 ?? false }
    }

    /**
     Reactive wrapper for `estimatedProgress` property.
     */
    public var estimatedProgress: Observable<Double> {
        return self.observeWeakly(Double.self, "estimatedProgress")
            .map { $0 ?? 0.0 }
    }

    /**
     Reactive wrapper for `url` property.
     */
    public var url: Observable<URL?> {
        return self.observeWeakly(URL.self, "URL")
    }


    /**
     Reactive wrapper for `canGoBack` property.
     */
    public var canGoBack: Observable<Bool> {
        return self.observeWeakly(Bool.self, "canGoBack")
            .map { $0 ?? false }
    }

    /**
     Reactive wrapper for `canGoForward` property.
     */
    public var canGoForward: Observable<Bool> {
        return self.observeWeakly(Bool.self, "canGoForward")
            .map { $0 ?? false }
    }
    
    
    /// Reactive wrapper for `evaluateJavaScript(_:completionHandler:)` method.
    ///
    /// - Parameter javaScriptString: The JavaScript string to evaluate.
    /// - Returns: Observable sequence of result of the script evaluation.
    public func evaluateJavaScript(_ javaScriptString:String) -> Observable<Any?> {
        return Observable.create { [weak base] observer in
            base?.evaluateJavaScript(javaScriptString) { value, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    observer.onNext(value)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
