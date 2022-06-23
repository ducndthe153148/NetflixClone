//
//  EnageCommons.swift
//  Engage-Mobi
//
//  Created by V001695 on 31/10/2021.
//

import Foundation
import RxSwift
import RxCocoa


let LOGIN_ID = "LOGIN_ID"

class EngagedViewRouter {
    static let shared = EngagedViewRouter()
    weak var homeTabbar: TabbarViewController?
    var login: PublishRelay<Bool> = .init()
    var isLogin = false {
        didSet {
            UserDefaults.standard.set(isLogin, forKey: LOGIN_ID)
        }
    }
}
