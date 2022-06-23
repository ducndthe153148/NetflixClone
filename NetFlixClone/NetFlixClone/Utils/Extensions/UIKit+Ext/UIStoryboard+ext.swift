//
//  UIStoryboard+ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 29/10/2021.
//

import Foundation

extension UIStoryboard {
    func instantiateViewController<T>(ofType type: T.Type = T.self) -> T where T: UIViewController {
        guard let viewController = instantiateViewController(withIdentifier: type.reuseID) as? T else {
            fatalError()
        }
        return viewController
    }
}

extension UITextField {

}
