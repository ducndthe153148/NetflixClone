//
//  Decodable+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 31/10/2021.
//

import Foundation

extension Encodable {
    
    func toJSON(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
    
    func toJsonString(encoder: JSONEncoder = JSONEncoder()) -> String? {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        }
        catch {
            return nil
        }
    }
}
