//
//  Data+Ext.swift
//  NetFlixClone
//
//  Created by MacOS on 23/06/2022.
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
