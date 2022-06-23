//
//  UITextField+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 03/11/2021.
//

import Foundation

extension UITextField: XIBLocalizable {
    @IBInspectable var localizeText: String? {
        get {
            return nil
        }
        set(value) {
            text = value?.localized()
        }
    }

    @IBInspectable var localizePlaceHolder: String? {
        get {
            return nil
        }
        set(value) {
            placeholder = value?.localized()
        }
    }
}

private var __maxLengths = [UITextField: Int]()
extension UITextField {
    var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let t = textField.text {
            textField.text = String(t.prefix(maxLength))

        }
    }
}
