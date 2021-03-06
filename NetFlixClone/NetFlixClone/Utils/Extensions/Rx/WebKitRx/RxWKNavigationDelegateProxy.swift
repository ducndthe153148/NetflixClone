//
//  RxWKNavigationDelegateProxy.swift
//  Engage-Mobi
//
//  Created by V001695 on 01/11/2021.
//

import WebKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

public typealias RxWKNavigationDelegate = DelegateProxy<WKWebView, WKNavigationDelegate>

open class RxWKNavigationDelegateProxy: RxWKNavigationDelegate, DelegateProxyType, WKNavigationDelegate {
    
    /// Type of parent object
    public weak private(set) var webView: WKWebView?
    
    /// Init with ParentObject
    public init(parentObject: ParentObject) {
        webView = parentObject
        super.init(parentObject: parentObject, delegateProxy: RxWKNavigationDelegateProxy.self)
    }
    
    /// Register self to known implementations
    public static func registerKnownImplementations() {
        self.register { parent -> RxWKNavigationDelegateProxy in
            RxWKNavigationDelegateProxy(parentObject: parent)
        }
    }
    
    /// Gets the current `WKNavigationDelegate` on `WKWebView`
    open class func currentDelegate(for object: ParentObject) -> WKNavigationDelegate? {
        return object.navigationDelegate
    }
    
    /// Set the navigationDelegate for `WKWebView`
    open class func setCurrentDelegate(_ delegate: WKNavigationDelegate?, to object: ParentObject) {
        object.navigationDelegate = delegate
    }
}
