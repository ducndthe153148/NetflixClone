//
//  EngagedWebViewRouter.swift
//  Engage-Mobi
//
//  Created by Nguyen Dat on 30/03/2022.
//

import Foundation

enum EngagedWebViewRouter: String {
    case homeLogin = "/mobi/home/top/login"
    case logout = "/mobi/home/top/logout"
    case login = "/mobi/login"
    case register = "/mobi/register"
    case verifyOTP = "/mobi/signup/verify-otp"
    case signup = "/mobi/signup"
    case annual_salary = "/mobi/register/work-details#/annual_salary"
    case experience_years = "/mobi/register/work-details#/experience_years"
    case experience_occupation = "/mobi/register/work-details#/experience_occupation"
    case work_details = "/mobi/register/work-details"
    case work_experience = "/mobi/register/skill/work_experience"
//    case b = "/mobi/register/work-details#/experience_years"
    case unknown
    
    var title: String {
        switch self {
        case .verifyOTP, .signup:
            return "新規会員登録"
        default:
            return "プロフィール登録"
        }
    }
    
    var isHiddenNavigation: Bool {
        switch self {
        case .homeLogin, .logout:
            return true
        default:
            return false
        }
    }
    
    var isHiddenTabbar: Bool {
        switch self {
        case .homeLogin, .logout:
            return false
        default:
            return true
        }
    }
    
    var isHiddenBackButton: Bool {
        switch self {
        case .homeLogin, .logout:
            return false
        default:
            return false
        }
    }
    
    var isHiddenCloseButton: Bool {
        switch self {
        case .homeLogin, .logout:
            return true
        default:
            return true
        }
    }
}
