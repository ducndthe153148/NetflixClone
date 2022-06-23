//
//  RxTTTAttributedLabelDelegateProxy.swift
//  Engage-Mobi
//
//  Created by V001695 on 03/11/2021.
//

import TTTAttributedLabel
import RxSwift
import RxCocoa

public typealias RxTTTAttributedLabelDelegate = DelegateProxy<TTTAttributedLabel, TTTAttributedLabelDelegate>

open class RxTTTAttributedLabelDelegateProxy: RxTTTAttributedLabelDelegate, DelegateProxyType, TTTAttributedLabelDelegate {
    public weak private(set) var attributedLabel: TTTAttributedLabel?
    
    public init(parentObject: ParentObject) {
        attributedLabel = parentObject
        super.init(parentObject: parentObject, delegateProxy: RxTTTAttributedLabelDelegateProxy.self)
    }
    
    public static func registerKnownImplementations() {
        self.register { (parent) -> RxTTTAttributedLabelDelegateProxy in
            RxTTTAttributedLabelDelegateProxy.init(parentObject: parent)
        }
    }
    
    public static func currentDelegate(for object: TTTAttributedLabel) -> TTTAttributedLabelDelegate? {
        return object.delegate
    }
    
    public static func setCurrentDelegate(_ delegate: TTTAttributedLabelDelegate?, to object: TTTAttributedLabel) {
        return object.delegate = delegate
    }
}

extension Reactive where Base : TTTAttributedLabel {
    
    public typealias TTTAttributedLabelEvent = (label: TTTAttributedLabel, didSelectLinkWith: URL)
    
    public var delegate: DelegateProxy<TTTAttributedLabel, TTTAttributedLabelDelegate> {
        return RxTTTAttributedLabelDelegateProxy.proxy(for: base)
    }
    
    
    public var didSelectLink: ControlEvent<TTTAttributedLabelEvent> {
        let source: Observable<TTTAttributedLabelEvent> = delegate
            .methodInvoked(.didSelectLink)
            .map { arg in
                let view = try castOrThrow(TTTAttributedLabel.self, arg[0])
                let url = try castOrThrow(URL.self, arg[1])
                return (view, url)
            }
        return ControlEvent(events: source)
    }
}

extension Selector {
    static let didSelectLink = #selector(((TTTAttributedLabelDelegate.attributedLabel(_:didSelectLinkWith:))! as (TTTAttributedLabelDelegate) -> (TTTAttributedLabel, URL) -> Void))
}
