//
//  Extensions.swift
//  EngageMobi
//
//  Created by Nguyen Dat on 22/03/2022.
//

import Foundation
import WebKit

extension WKWebView {

    private var httpCookieStore: WKHTTPCookieStore  { return WKWebsiteDataStore.default().httpCookieStore }

    func getCookies(for domain: String? = nil, completion: @escaping ([String : Any])->())  {
        var cookieDict = [String : AnyObject]()
        httpCookieStore.getAllCookies { cookies in
            for cookie in cookies {
                if let domain = domain {
                    if cookie.domain.contains(domain) {
                        cookieDict[cookie.name] = cookie.properties as AnyObject?
                    }
                } else {
                    cookieDict[cookie.name] = cookie.properties as AnyObject?
                }
            }
            completion(cookieDict)
        }
    }
}

extension String {
    func endPoint() -> String {
        var endpoint = self.replacingOccurrences(of: baseUrl, with: "")
        if let param = endpoint.firstIndex(of: "?") {
            endpoint.removeSubrange(param...)
        }
        if endpoint.last == "/" {
            endpoint.remove(at: endpoint.lastIndex(of: "/")!)
        }
        return endpoint
    }
}
