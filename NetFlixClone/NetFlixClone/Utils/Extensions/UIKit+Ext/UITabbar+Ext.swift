//
//  UITabbar+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 19/11/2021.
//

import Foundation
import UIKit

extension Chain where Origin: UITabBar {
    
    @discardableResult
    func tint(color: UIColor?) -> Chain {
        self.origin.tintColor = color
        return self
    }
    
    @discardableResult
    func unselectedItemTint(color: UIColor?) -> Chain {
        self.origin.unselectedItemTintColor = color
        return self
    }
    
    @discardableResult
    func barTint(color: UIColor?) -> Chain {
        self.origin.barTintColor = color
        return self
    }
}
