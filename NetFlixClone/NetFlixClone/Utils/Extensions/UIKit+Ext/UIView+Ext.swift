//
//  UIView+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 01/11/2021.
//

import Foundation
import UIKit
//import SnapKit

extension UIView {
    func setHeightConstraint(_ constant: CGFloat) {
        var isUpdated = false
        self.constraints.forEach({
            if $0.firstItem === self, $0.firstAttribute == .height {
                $0.constant = constant
                isUpdated = true
            }
        })
        if !isUpdated {
            self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        }
    }
    
    func setWidthConstraint(_ constant: CGFloat) {
        var isUpdated = false
        self.constraints.forEach({
            if $0.firstItem === self, $0.firstAttribute == .width {
                $0.constant = constant
                isUpdated = true
            }
        })
        if !isUpdated {
            self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        }
    }
}


extension UIView {
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: borderColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
            layer.masksToBounds = true
        }
    }
}

extension UIView: Chainable { }

extension Chain where Origin: UIView {
  
  @discardableResult
  func add(to: UIView) -> Chain {
    to.addSubview(self.origin)
    return self
  }
  
  @discardableResult
  func background(color: UIColor?) -> Chain {
    self.origin.backgroundColor = color
    return self
  }
  
//  @discardableResult
//  func makeConstraints(closure: (ConstraintMaker) -> Void) -> Chain {
//    self.origin.snp.makeConstraints(closure)
//    return self
//  }
//  
//  @discardableResult
//  func remakeConstraints(closure: (ConstraintMaker) -> Void) -> Chain {
//    self.origin.snp.remakeConstraints(closure)
//    return self
//  }
  
  @discardableResult
  func border(color: UIColor?) -> Chain {
    self.origin.layer.borderColor = color?.cgColor
    return self
  }
  
  @discardableResult
  func border(width: CGFloat) -> Chain {
    self.origin.layer.borderWidth = width
    return self
  }
  
  @discardableResult
  func corner(radius: CGFloat) -> Chain {
    self.origin.layer.cornerRadius = radius
    return self
  }

  @discardableResult
  func clipToBounds(_ by: Bool) -> Chain {
    self.origin.clipsToBounds = by
    return self
  }
  
  @discardableResult
  func contentMode(_ by: UIView.ContentMode) -> Chain {
    self.origin.contentMode = by
    return self
  }
  
  @discardableResult
  func tintColor(_ by: UIColor?) -> Chain {
    self.origin.tintColor = by
    return self
  }
  
  @discardableResult
  func frame(_ by: CGRect) -> Chain {
    self.origin.frame = by
    return self
  }
  
  @discardableResult
  func isHidden(_ isHidden: Bool) -> Chain {
    self.origin.isHidden = isHidden
    return self
  }
  
  @discardableResult
  func alpha(_ alpha: CGFloat) -> Chain {
    self.origin.alpha = alpha
    return self
  }
  
  @discardableResult
  func maskedCorners(_ mask: CACornerMask) -> Chain {
    self.origin.layer.maskedCorners = mask
    return self
  }
  
  @discardableResult
  func semanticContentAttribute(_ attribute: UISemanticContentAttribute) -> Chain {
    self.origin.semanticContentAttribute = attribute
    return self
  }
}
