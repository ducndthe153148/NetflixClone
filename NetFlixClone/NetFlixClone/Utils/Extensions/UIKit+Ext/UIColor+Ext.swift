//
//  UIColor+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 31/10/2021.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        if cString.count == 6 {
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
        } else {
            self.init(red: 1, green: 1, blue: 1, alpha: CGFloat(1.0))
        }
    }
}
