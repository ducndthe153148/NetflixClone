//
//  Data+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 31/10/2021.
//

import Foundation

extension Data {
    func tranforms<T: Decodable>(to: T.Type) -> T? {
        guard let response = try? JSONDecoder().decode(to, from: self) else { return nil }
        return response
    }

    //Use debug response
    func tranformsDebug<T: Decodable>(to: T.Type) -> T? {
        return try! JSONDecoder().decode(to, from: self)
    }
}
