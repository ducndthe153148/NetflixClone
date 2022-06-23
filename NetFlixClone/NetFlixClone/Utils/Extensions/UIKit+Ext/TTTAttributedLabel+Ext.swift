//
//  TTTAttributedLabel+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 03/11/2021.
//

import Foundation
import TTTAttributedLabel

extension TTTAttributedLabel {
    func setAttributeLabelTerms(fullText: String, linkText: String) {
        self.numberOfLines = 0
        self.text = String(format: fullText, linkText)
        if let text = self.text {
            let nsString = text as! NSString
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.2
            let fullAttributedString = NSAttributedString(string: text as! String, attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.foregroundColor: UIColor.black.cgColor,
            ])
            self.textAlignment = .center
            self.attributedText = fullAttributedString
            
            let rangeTC = nsString.range(of: linkText)
            
            let ppLinkAttributes: [String: Any] = [
                NSAttributedString.Key.foregroundColor.rawValue:  UIColor(hex: "#30C0F0"),
                NSAttributedString.Key.underlineStyle.rawValue: false,
            ]
            let ppActiveLinkAttributes: [String: Any] = [
                NSAttributedString.Key.foregroundColor.rawValue:  UIColor(hex: "#30C0F0"),
                NSAttributedString.Key.underlineStyle.rawValue: false,
            ]
            
            self.activeLinkAttributes = ppActiveLinkAttributes
            self.linkAttributes = ppLinkAttributes
            
            let urlTC = URL(string: "action://TC")!
            self.addLink(to: urlTC, with: rangeTC)
            self.textColor = UIColor.black
        }
    }
}
