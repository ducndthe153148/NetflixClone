//
//  Engage+APIUrls.swift
//  Engage-Mobi
//
//  Created by V001695 on 31/10/2021.
//

import Foundation
extension Constants {
    enum APIUrls {
        static let domain = "https://api.stg.willermobi.com"
        static let callbackURLScheme = ""
        static let clientID = ""
        static let clientSecret = ""
        static let authorizeURL = ""
        static let tokenURL = ""
        static let redirectURL = ""
    }
}

extension Constants.APIUrls {
    enum Secrets {
        static let clientID = Secrets.environmentVariable(named: "CLIENT_ID") ?? ""
        static let clientSecret = Secrets.environmentVariable(named: "CLIENT_SECRET") ?? ""

        private static func environmentVariable(named: String) -> String? {
            guard let infoDictionary = Bundle.main.infoDictionary, let value = infoDictionary[named] as? String else {
                print("‼️ Missing Environment Variable: '\(named)'")
                return nil
            }
            return value
        }
    }
}
