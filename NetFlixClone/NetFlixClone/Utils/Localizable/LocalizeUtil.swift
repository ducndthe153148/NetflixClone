//
//  LocalizeUtil.swift
//  Engage-Mobi
//
//  Created by V001695 on 03/11/2021.
//

import Foundation
import Localize_Swift

enum CountryLanguageCode: String {
    case english = "en"
    case vietnam = "vi"
    case japanese = "ja"
    
    func toString() -> String {
        switch self {
        case .english:
            return "appLang.En".localized()
        case .vietnam:
            return "appLang.Vi".localized()
        case .japanese:
            return "appLang.JP".localized()
        }
    }
}
class LocalizeUtil {
    
    static func setLanguage(countryLanguageCode: CountryLanguageCode) {
        
        var countryLanguageString = CountryLanguageCode.english.rawValue
        
        switch countryLanguageCode {
        case .vietnam:
            countryLanguageString = CountryLanguageCode.vietnam.rawValue
        case .english:
            countryLanguageString = CountryLanguageCode.english.rawValue
        case .japanese:
            countryLanguageString = CountryLanguageCode.japanese.rawValue
        }
        
        UserDefaults.standard.set(countryLanguageString, forKey: Constants.AppInfo.appLangSetting)
        UserDefaults.standard.synchronize()
        Localize.setCurrentLanguage(countryLanguageString)
    }
    
    static func getLanguage() -> CountryLanguageCode {
        
        let lang = UserDefaults.standard.string(forKey: Constants.AppInfo.appLangSetting)
        
        switch lang {
        case CountryLanguageCode.english.rawValue:
            return CountryLanguageCode.english
        case CountryLanguageCode.vietnam.rawValue:
            return CountryLanguageCode.vietnam
        case CountryLanguageCode.japanese.rawValue:
            return CountryLanguageCode.japanese
        default:
            UserDefaults.standard.set(CountryLanguageCode.japanese.rawValue, forKey: Constants.AppInfo.appLangSetting)
            UserDefaults.standard.synchronize()
            return CountryLanguageCode.japanese
        }
    }
    
    static func currentLangString() -> String {
        return getLanguage().toString()
    }
    
    static func addObserver(observer: Any, selector aSelector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: aSelector, name: NSNotification.Name(LCLLanguageChangeNotification), object: nil)
    }
    
    static func removeObserver(observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
}
