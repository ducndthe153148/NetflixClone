//
//  UIBarItem+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 03/11/2021.
//

import Foundation

extension UIBarItem: XIBLocalizable {
    @IBInspectable var localizeText: String? {
        get {
            return nil
        }
        set(value) {
            title = value?.localized()
        }
    }
}
