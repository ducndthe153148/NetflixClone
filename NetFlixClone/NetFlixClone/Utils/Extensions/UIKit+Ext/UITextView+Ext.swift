//
//  UITextView+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 03/11/2021.
//

import Foundation

extension UITextView: XIBLocalizable {
    @IBInspectable var localizeText: String? {
        get {
            return nil
        }
        set(value) {
            text = value?.localized()
        }
   }
}
