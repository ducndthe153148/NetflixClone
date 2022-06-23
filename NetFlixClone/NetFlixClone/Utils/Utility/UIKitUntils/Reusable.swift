//
//  Reusable.swift
//  Engage-Mobi
//
//  Created by V001695 on 29/10/2021.
//

import Foundation
import UIKit

protocol Reusable {
    static var reuseID: String {get}
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}





