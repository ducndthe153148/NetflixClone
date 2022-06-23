//
//  XIBLocalizable.swift
//  Engage-Mobi
//
//  Created by V001695 on 03/11/2021.
//

import Foundation

@objc protocol XIBLocalizable {
    var localizeText: String? { get set }
    @objc optional var localizePlaceHolder: String? { get set }
}
