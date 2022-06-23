//
//  MBProgressHUD+Rx.swift
//  Engage-Mobi
//
//  Created by V001695 on 29/10/2021.
//

import Foundation
import RxSwift
import RxCocoa
import MBProgressHUD

extension MBProgressHUD {

    /**
     Bindable sink for MBProgressHUD show/hide methods.
     */
    public var rx_mbprogresshud_animating: AnyObserver<Bool> {
        return AnyObserver { event in
            MainScheduler.ensureExecutingOnScheduler()

            switch (event) {
            case .next(let value):
                if value {
                    if let view = UIApplication.shared.keyWindow?.subviews.last {
                        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
                        loadingNotification.mode = self.mode
                    }
                } else {
                    if let view = UIApplication.shared.keyWindow?.subviews.last {
                        MBProgressHUD.hide(for: view, animated: true)
                    }
                }
            case .error(let error):
                let error = "Binding error to UI: \(error)"
//                #if DEBUG
//                    rxFatalError(error)
//                #else
                    print(error)
//                #endif
            case .completed:
                break
            }
        }
    }
}

extension Reactive where Base: MBProgressHUD {
    public var animation: Binder<Bool> {
        return Binder(self.base) { hud, show in
            guard let view = UIApplication.shared.keyWindow?.subviews.last else { return }
            if show {
                if hud.superview == nil {
                    view.addSubview(hud)
                }
                hud.show(animated: true)
            } else {
                hud.hide(animated: true)
            }
        }
    }
}
